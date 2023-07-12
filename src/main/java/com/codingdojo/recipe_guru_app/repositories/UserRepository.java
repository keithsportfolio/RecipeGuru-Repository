package com.codingdojo.recipe_guru_app.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.recipe_guru_app.models.User;





@Repository
public interface UserRepository extends CrudRepository<User, Long>{
	
    // this method retrieves all the users from the database
    List<User> findAll();
    User findByEmail(String email);
    

}