package com.bigman.springTryHardApp.controller;
import com.bigman.springTryHardApp.domain.Role;
import com.bigman.springTryHardApp.domain.User;
import com.bigman.springTryHardApp.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collections;
import java.util.Map;

@Controller
public class RegistrationController {
    @Autowired
    private UserRepo userRepo;
    @GetMapping("/registration")
    public String registration(){

        return "registration";
    }
    @PostMapping("/registration")
    public String addUser(User user, Map<String, Object> model){
        User userFromDB = userRepo.findByUsername(user.getUsername());

        if (userFromDB!=null){
            model.put("message","User already been created");
            return "registration";
        }

        user.setActive(true);
//        only one role atm so can use singletone for testing
        user.setRoles(Collections.singleton(Role.USER));
        userRepo.save(user);

        return "redirect:/login";
    }
}
