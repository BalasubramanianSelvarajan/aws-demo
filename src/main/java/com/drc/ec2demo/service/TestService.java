package com.drc.ec2demo.service;

import org.springframework.stereotype.Service;

@Service
public class TestService {

    public String test() {
        return "Response from Test with New Changes after Github Actions!";
    }
}
