package com.codingdojo.recipe_guru_app.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.recipe_guru_app.models.Recipe;
import com.codingdojo.recipe_guru_app.models.User;
import com.codingdojo.recipe_guru_app.services.RecipeService;
import com.codingdojo.recipe_guru_app.services.UserService;
import com.codingdojo.recipe_guru_app.validator.UserValidator;

@Controller
public class Users {
	
    private final UserService userService;
    private final RecipeService recipeService;
    private final UserValidator userValidator;
    
    // NEW
    public Users(UserService userService, UserValidator userValidator, RecipeService recipeService) {
        this.userService = userService;
        this.recipeService = recipeService;
        this.userValidator = userValidator;
    }
	
	@RequestMapping("/")
	public String index() {
		
		return "frontpage.jsp";
	}
	@RequestMapping("/login")
	public String login() {
		
		return "loginPage.jsp";
	}
    @RequestMapping("/home")
    public String home(HttpSession session, Model model) {
        // get user from session, save them in the model and return the home page
        Long userId =  (Long) session.getAttribute("userId");
        List<Recipe> recipes = recipeService.findAll();
        User user = userService.findUserById(userId);
        List<Recipe> likedRecipes = user.getRecipes();
        
        model.addAttribute( "recipes", recipes);
        model.addAttribute( "likedRecipes", likedRecipes);
        
        if (userId == null) {
            // User ID not in session, redirect to homepage
            return "redirect:/";
        }
        
        User u = userService.findUserById(userId);
        model.addAttribute("user", u);
        return "homepage.jsp";
    }
    
	@RequestMapping("/signup")
	public String signup(@Valid @ModelAttribute("user") User user) {
		
		return "signupPage.jsp";
	}
	
	
    @RequestMapping(value="/signup", method=RequestMethod.POST)
    public String signup(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
        userValidator.validate(user, result);
        if(result.hasErrors()) {
            return "signupPage.jsp";
        }
        User u = userService.signup(user);
        session.setAttribute("userId", u.getId());
        System.out.println("*******************************");
        System.out.println(u);
        System.out.println("*******************************");
        return "redirect:/home";
    }
	
    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {
        // if the user is authenticated, save their user id in session
        // else, add error messages and return the login page
    	boolean isAuthenticated = userService.authenticateUser(email, password);
    	if(isAuthenticated) {
    		User u = userService.findByEmail(email);
    		session.setAttribute("userId", u.getId());
    		System.out.println("@@@@@@@@@@@@@@@@@@@@@@ User signed in sucessfully @@@@@@@@@@@@@@@@@@");
    		return "redirect:/home";
    	} else {
    		model.addAttribute("error", "Invalid Credentials, Please try again");
    		System.out.println("@@@@@@@@@@@@@@@@@@@@@@ User NOT signed in sucessfully @@@@@@@@@@@@@@@@@@");
    		return "loginPage.jsp";
    	}
    }
	



	  @RequestMapping("/logout")
	   public String logout(HttpSession session) {
	        // invalidate session
	        // redirect to login page
	    	session.invalidate();
	    	return "redirect:/login";
	   }
	  
	  
}
