package com.purna.beltexam.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.purna.beltexam.models.LoginUser;
import com.purna.beltexam.models.User;
import com.purna.beltexam.repositories.UserRepository;

@Service
public class UserService {
	
	private final UserRepository userRepo;

	public UserService(UserRepository userRepo) {
		this.userRepo = userRepo;
	}
	
	public User createUser(User registeringUser) {
		String hashed = BCrypt.hashpw(registeringUser.getPassword(), BCrypt.gensalt());
		registeringUser.setPassword(hashed);
		return userRepo.save(registeringUser);
	}
	
	public User getUser(String Email) {
		Optional<User> potentialUser = userRepo.findByEmail(Email);
		return potentialUser.isPresent() ? potentialUser.get() : null;
	}
	
	public User getUser(Long Id) {
		Optional<User> potentialUser = userRepo.findById(Id);
		return potentialUser.isPresent() ? potentialUser.get() : null;
	}
	public User login(LoginUser loginUser, BindingResult result) {
		if(result.hasErrors()) {
			return null;
		}
		// making sure if user exists
		User existingUser = getUser(loginUser.getEmail());
		if(existingUser==null) {
			result.rejectValue("email", "unique","Bad Credintials");
			return null;
		}
		// making sure password match
		if(!BCrypt.checkpw(loginUser.getPassword(), existingUser.getPassword())) {
			result.rejectValue("email", "Unique" , "Bad Credintials");
			return null;
		}
		return existingUser;
	}
}
