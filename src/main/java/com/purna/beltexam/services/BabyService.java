package com.purna.beltexam.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.purna.beltexam.models.Baby;
import com.purna.beltexam.repositories.BabyRepository;

@Service
public class BabyService {

	private final BabyRepository babyRepo;
	public BabyService(BabyRepository babyRepo) {
		this.babyRepo = babyRepo;
	}
	
	public Baby getOne(Long id) {
		Optional<Baby> baby = babyRepo.findById(id);
		return baby.isPresent() ? baby.get() : null;
	}

	public List<Baby> getAll() {
		return (List<Baby>) babyRepo.findAll();
	}

	public Baby create(Baby baby) {
		return babyRepo.save(baby);
	}

	public Baby update(Baby baby) {
		return babyRepo.save(baby);
	}

	public void delete(Long id) {
		babyRepo.deleteById(id);
	}

}