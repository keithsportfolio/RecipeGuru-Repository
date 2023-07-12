package com.codingdojo.recipe_guru_app.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.codingdojo.recipe_guru_app.models.Recipe;
import com.codingdojo.recipe_guru_app.models.User;
import com.codingdojo.recipe_guru_app.services.RecipeService;
import com.codingdojo.recipe_guru_app.services.UserService;
import org.springframework.web.bind.annotation.*;

@Controller
public class Recipes {
	
	private final RecipeService recipeService;
	private final UserService userService;
	
    public Recipes(RecipeService recipeService, UserService userService) {
        this.recipeService = recipeService;
        this.userService = userService;
    }
    
	
    @RequestMapping("/recipes")
    public String recipeAdd() {
        return "recipesAdd.jsp";
    }
    
    @RequestMapping("/recipes/all")
    public String recipesAll(Model model) {
    	
    	List<Recipe> Recipes = recipeService.findAll();
    	
        model.addAttribute("Recipes", Recipes);
        return "recipesAll.jsp";
    }
    
    @RequestMapping("/about")
    public String aboutPage() {
        return "aboutPage.jsp";
    }
 
    @RequestMapping(value="/recipes", method=RequestMethod.POST)
    public String createRecipe(@Valid @ModelAttribute("recipe") Recipe recipe, BindingResult result, HttpSession session) {
    	if (result.hasErrors()) {
    		System.out.println("@@@@@@ There's an error, redirecting @@@@");
    		return "redirect:/recipes";
    	} else {
    		System.out.println("@@@@@@@@@@@@ Creating recipe object @@@@@@");
    		recipeService.createRecipe(recipe, session);
    		System.out.println(recipe);
    		return "redirect:/home";
    	}
    }
    
    
    @RequestMapping(value="/add_rating/{id}/{rating}", method=RequestMethod.POST)
    public String add_rating(@PathVariable("id") Long id, @PathVariable("rating") Double rating) {
    	Recipe recipe = recipeService.findRecipe(id);
    	 if (recipe != null) {
    	        // Update the recipe's rating and number of ratings using the service method
    	        recipeService.updateRecipeRating(recipe, rating);
    	  }
    	return "redirect:/home";
    }
    
    
    @RequestMapping(value="/recipe/rates/{id}")
    public String add_rating(@PathVariable("id") Long id, Model model) {
    	Recipe recipe = recipeService.findRecipe(id);
 	   model.addAttribute("recipe", recipe);
 	   model.addAttribute("recipeId", id);
 	   return "recipeRating.jsp";
    	
    }
    
    @GetMapping("/myrecipes")
    public String getAllRecipes(Model model, HttpSession session) {
    	Long creator_id = (Long) session.getAttribute("userId");
    	
    	if (creator_id == null) {
            // User ID not in session, redirect to homepage
            return "redirect:/";
        }
    	
        List<Recipe> recipes = recipeService.getRecipesByCreatorId(creator_id);
        User currentUser = userService.findUserById(creator_id);
        model.addAttribute("recipes", recipes);
        model.addAttribute("currentUser", currentUser);
        System.out.println(recipes);
        return "myrecipes.jsp";
    }
    
    // Catch-all route for any other URL
    @RequestMapping(value = "/*")
    public String handleCatchAll() {
        return "redirect:/";
    }
    
    @RequestMapping("/recipes/popular")
    public String getTopRecipes(Model model) {
        List<Recipe> topRecipes = recipeService.getTop5Recipes();
        model.addAttribute("topRecipes", topRecipes);
        return "top_recipes.jsp";
    }
    
    @RequestMapping(value = "recipe/like/{recipeId}", method = RequestMethod.GET)
    public String likeRecipe(@PathVariable("recipeId") Long recipeId, HttpSession session) {
    	System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        Long userId = (Long) session.getAttribute("userId");
    	System.out.println(userId);
    	System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        if (userId == null) {
            // User is not logged in, redirect to login page or handle the case accordingly
            return "redirect:/login";
        }
    	System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    	System.out.println("This is the user object");
        User user = userService.findUserById(userId);
        System.out.println(user);
    	System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    	System.out.println("This is the recipe object");
        Recipe recipe = recipeService.findRecipe(recipeId);
        System.out.println(recipe);
    	System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        
        if (user != null && recipe != null) {
            List<Recipe> likedRecipes = user.getRecipes();
            System.out.println("This is the list of the users currently liked recipes");
            System.out.println(likedRecipes);
            if (!likedRecipes.contains(recipe)) {
                likedRecipes.add(recipe);
                user.setRecipes(likedRecipes);
                userService.updateUser(user);
                
                List<User> recipeUsers = recipe.getUsers();
                recipeUsers.add(user);
                System.out.println(recipeUsers);
                recipe.setUsers(recipeUsers);
                recipeService.updateRecipe(recipe);
            } else {
            	System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
            	System.out.println("This recipe is already liked");
            	return "redirect:/home";
            }
        }
        
        return "redirect:/home";
    }
    
    @RequestMapping(value = "recipe/unlike/{recipeId}", method = RequestMethod.GET)
    public String unlikeRecipe(@PathVariable("recipeId") Long recipeId, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");
        if (userId == null) {
            // User is not logged in, redirect to login page or handle the case accordingly
            return "redirect:/login";
        }

        User user = userService.findUserById(userId);
        Recipe recipe = recipeService.findRecipe(recipeId);

        if (user != null && recipe != null) {
            List<Recipe> likedRecipes = user.getRecipes();
            if (likedRecipes.contains(recipe)) {
                likedRecipes.remove(recipe);
                user.setRecipes(likedRecipes);
                userService.updateUser(user);
                
                List<User> recipeUsers = recipe.getUsers();
                recipeUsers.remove(user);
                recipe.setUsers(recipeUsers);
                recipeService.updateRecipe(recipe);
            }
        }
        
        return "redirect:/home";
    }

    
    @RequestMapping("/recipes/favorites")
    public String home(HttpSession session, Model model) {
        // get user from session, save them in the model and return the home page
        Long userId =  (Long) session.getAttribute("userId");
        User user = userService.findUserById(userId);
        List<Recipe> likedRecipes = user.getRecipes();
        
        model.addAttribute( "likedRecipes", likedRecipes);
        
        
        User u = userService.findUserById(userId);
        model.addAttribute("user", u);
        return "favorites.jsp";
    }
}
