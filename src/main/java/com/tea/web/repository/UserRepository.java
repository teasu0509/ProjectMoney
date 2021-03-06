package com.tea.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.tea.web.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	User findByUsernameAndPassword(String username, String password);

	User findById(int id);
}
