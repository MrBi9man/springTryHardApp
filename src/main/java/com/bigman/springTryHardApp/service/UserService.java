package com.bigman.springTryHardApp.service;

import com.bigman.springTryHardApp.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserService implements UserDetailsService {
//    -----using @autowired for old logic-----
    @Autowired
    private UserRepo userRepo;

//    ----new Spring check for enjections and autowires automaticly-----
//    private final UserRepo userRepo;
//    public UserService(UserRepo userRepo){
//        this.userRepo=userRepo;
//    }
//    -------------------------------------------------------------------

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepo.findByUsername(username);
    }
}
