package com.codingdojo.recipe_guru_app.services;

import com.codingdojo.recipe_guru_app.repositories.UserRepository;

import java.util.Optional;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import com.codingdojo.recipe_guru_app.models.User;


@Service
public class UserService {
    private final UserRepository userRepository;
    
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
    
    // register user and hash their password
    public User signup(User user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return userRepository.save(user);
    }
    
    // find user by email
    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }
    
    // find user by id
    public User findUserById(Long id) {
    	Optional<User> u = userRepository.findById(id);
    	
    	if(u.isPresent()) {
            return u.get();
    	} else {
    	    return null;
    	}
    }
    
    // authenticate user
    public boolean authenticateUser(String email, String password) {
        // first find the user by email
        User user = userRepository.findByEmail(email);
        // if we can't find it by email, return false
        if(user == null) {
            return false;
        } else {
            // if the passwords match, return true, else, return false
            if(BCrypt.checkpw(password, user.getPassword())) {
                return true;
            } else {
                return false;
            }
        }
    }
    
    public User updateUser(User user) {
        // Retrieve the existing user from the database using the user's ID
        User existingUser = userRepository.findById(user.getId()).orElse(null);
        
        // Check if the existing user is found
        if (existingUser != null) {
            // Update the user properties with the new values
            existingUser.setEmail(user.getEmail());
            existingUser.setUserName(user.getUserName());
            existingUser.setName(user.getName());
            // ... update other user properties as needed
            
            // Save the updated user in the database
            User updatedUser = userRepository.save(existingUser);
            
            return updatedUser;
        }
        
        return null; // If the user is not found, return null or throw an exception
    }
}

