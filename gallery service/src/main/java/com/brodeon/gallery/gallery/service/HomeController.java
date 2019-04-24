package com.brodeon.gallery.gallery.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
@RequestMapping("/")
public class HomeController {

    @Autowired
    Environment env;

    @GetMapping("/info")
    public String home() {
        System.out.println("jestem tutaj");
        return "this is a message from gallery service at port:" + env.getProperty("local.server.port");
    }

    @GetMapping("/userinfo")
    public String userinfo(Principal principal) {
        return "username: " + principal.getName();
    }
}
