package com.codingdojo.recipe_guru_app.services;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.data.crossstore.ChangeSetPersister.NotFoundException;
import org.springframework.stereotype.Service;

import com.codingdojo.recipe_guru_app.models.Recipe;
import com.codingdojo.recipe_guru_app.models.User;
import com.codingdojo.recipe_guru_app.repositories.RecipeRepository;
import com.codingdojo.recipe_guru_app.repositories.UserRepository;



@Service
public class RecipeService {
    private final RecipeRepository recipeRepository;
    private final UserRepository userRepository;

    public RecipeService(RecipeRepository recipeRepository, UserRepository userRepository) {
        this.recipeRepository = recipeRepository;
        this.userRepository = userRepository;
    }
    
    public Recipe createRecipe(Recipe r, HttpSession session) {
    	Long userId = (Long) session.getAttribute("userId");
    	System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    	System.out.println(userId);
    	r.setCreatorId(userId);
        return recipeRepository.save(r);
    }
    
    public List<Recipe> getRecipesByCreatorId(Long creator_id) {
        return recipeRepository.findAllByCreatorId(creator_id);
    }
    
    public User getUserById(Long Id) {
    	Optional<User> optionalUser = userRepository.findById(Id);
        if(optionalUser.isPresent()) {
            return optionalUser.get();
        } else {
            return null;
        }
    }
    
    // retrieves a Recipe
    public Recipe findRecipe(Long Id) {
        Optional<Recipe> optionalRecipe = recipeRepository.findById(Id);
        if(optionalRecipe.isPresent()) {
            return optionalRecipe.get();
        } else {
            return null;
        }
    }

	public List<Recipe> findAll() {
		// TODO Auto-generated method stub
		return recipeRepository.findAll();
	}
	
    public Recipe updateRecipeRating(Recipe recipe, Double rating) {
        int totalNumRatings = recipe.getNumberOfRatings();
        Double averageRating = recipe.getRating();

        if (totalNumRatings == 0) {
            totalNumRatings = 1;
            averageRating = rating;
        } else {
            averageRating = (averageRating * totalNumRatings + rating) / (totalNumRatings + 1);
            totalNumRatings++;
        }

        recipe.setRating(averageRating);
        recipe.setNumberOfRatings(totalNumRatings);

        return recipeRepository.save(recipe);
    }
    
    public List<Recipe> getTop5Recipes() {
        return recipeRepository.findFirst5ByOrderByRatingDesc();
    }
    
    
    
    public Recipe updateRecipe(Recipe recipe) {
        // Retrieve the existing recipe from the database using the recipe's ID
        Recipe existingRecipe = recipeRepository.findById(recipe.getId()).orElse(null);
        System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        System.out.println("Made it to update method");
        System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        // Check if the existing recipe is found
        if (existingRecipe != null) {
            // Update the recipe properties with the new values
            existingRecipe.setName(recipe.getName());
            existingRecipe.setDescription(recipe.getDescription());
            existingRecipe.setIngredients(recipe.getIngredients());
            // ... update other recipe properties as needed
            
            // Save the updated recipe in the database
            Recipe updatedRecipe = recipeRepository.save(existingRecipe);
            
            return updatedRecipe;
        }
        
        return null; // If the recipe is not found, return null or throw an exception
    }
}







