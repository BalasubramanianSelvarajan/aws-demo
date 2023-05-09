package com.drc.ec2demo.controller;

import com.drc.ec2demo.service.TestService;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/test")
@AllArgsConstructor
public class TestController {

    private TestService testService;

    @GetMapping
    public ResponseEntity<String> test() {
        return ResponseEntity.ok(testService.test());
    }
}
