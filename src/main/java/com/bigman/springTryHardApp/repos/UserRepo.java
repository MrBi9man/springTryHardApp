package com.bigman.springTryHardApp.repos;

import com.bigman.springTryHardApp.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
