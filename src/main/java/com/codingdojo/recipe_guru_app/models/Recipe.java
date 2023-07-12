package com.codingdojo.recipe_guru_app.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.lang.Nullable;


@Entity
@Table(name="recipes")	
public class Recipe {
	
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    
    @NotNull
    @Size(min = 2, max = 50)
    private String name;
    
    @Size(min = 2, max = 455)
    private String image_source;
    
    @Nullable
    private int numberOfRatings = 0;
    
    
    @Size(min = 15, max = 455, message = "Ingredients list cannot be less than 15 characters ")
    @Lob
    private String ingredients;
    
//    @Max(value = 625, message = "Description cannot be greater than 625 characters")
    @Size(min = 15, max = 455, message = "Description cannot be less than 40 characters")
    @Lob
    private String description;
    
    @Max(value = 5, message = "Rating cannot be greater than 5")
    private Double rating = 0.0;
    
    @Column(updatable=false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;
    
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedAt;
    
    @Nullable
    @ManyToMany(mappedBy = "recipes")
    private List<User> users;
    
    @Nullable
    private Long creatorId;
    
    public Recipe() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getRating() {
        return rating;
    }

    public void setRating(Double rating) {
        this.rating = rating;
        System.out.println("@@@@@@@@@@@@@@@@ THE RATING @@@@@@@@@@@@@@@@@");
        System.out.println(rating);
        System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    }


    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
    
	public Date getUpdatedAt() {
		return updatedAt;
	}

	public Date getCreatedAt() {
		return createdAt;
	}
	
    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }



	public Long getCreatorId() {
		return creatorId;
	}

	public void setCreatorId(Long creatorId) {
		this.creatorId = creatorId;
	}

	public int getNumberOfRatings() {
		return numberOfRatings;
	}

	public void setNumberOfRatings(int numberOfRatings) {
		this.numberOfRatings = numberOfRatings;
		System.out.println("@@@@@@@@@@@@@@@@ THE NUM OF RATINGS @@@@@@@@@@@@@@@@@");
		System.out.println(numberOfRatings);
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
	}

	public String getIngredients() {
		return ingredients;
	}

	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}


	public String getImage_source() {
		return image_source;
	}

	public void setImage_source(String image_source) {
		this.image_source = image_source;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}


    
}
