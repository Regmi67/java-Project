package com.purna.beltexam.models;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="babys")
public class Baby {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long Id;
	
	
	
	@Size(min=2, max=255,message="Model should not be blank")
	@NotNull
	private String newName;
	
	@Size(min=2, max=255,message="Please enter make of car")
	@NotNull
	private String gender;
	
	@Size(min=2, max=255,message="Please enter origin")
	@NotNull
	private String origin;
	
	
	@Size(min=2, max=255,message="Meaning is requiered")
	@NotNull
	private String meaning;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User userName;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;


	public Baby() {}

	


	public Long getId() {
		return Id;
	}




	public void setId(Long id) {
		Id = id;
	}




	public String getNewName() {
		return newName;
	}




	public void setNewName(String newName) {
		this.newName = newName;
	}




	public String getGender() {
		return gender;
	}




	public void setGender(String gender) {
		this.gender = gender;
	}




	public String getOrigin() {
		return origin;
	}




	public void setOrigin(String origin) {
		this.origin = origin;
	}




	public String getMeaning() {
		return meaning;
	}




	public void setMeaning(String meaning) {
		this.meaning = meaning;
	}




	public User getUserName() {
		return userName;
	}




	public void setUserName(User userName) {
		this.userName = userName;
	}




	public Date getCreatedAt() {
		return createdAt;
	}




	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}




	public Date getUpdatedAt() {
		return updatedAt;
	}




	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}




	@PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
	

}
