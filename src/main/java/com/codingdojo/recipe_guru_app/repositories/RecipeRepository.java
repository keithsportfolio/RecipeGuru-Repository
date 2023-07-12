package com.codingdojo.recipe_guru_app.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.codingdojo.recipe_guru_app.models.Recipe;


@Repository
public interface RecipeRepository extends CrudRepository<Recipe, Long> {
	
    // this method retrieves all the users from the database
    List<Recipe> findAll();
    
    List<Recipe> findByDescriptionContaining(String search);
    
    List<Recipe> findAllByCreatorId(@Param("creator_id") Long creator_id);
    
    List<Recipe> findFirst5ByOrderByRatingDesc();

}