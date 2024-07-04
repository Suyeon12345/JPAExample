package com.example.JpaExample.controller;

import com.example.JpaExample.dto.JpaRequest;
import com.example.JpaExample.entity.JpaEntity;
import com.example.JpaExample.service.JpaService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Log4j2
@RestController
@RequestMapping("/api/jpatest")
public class JpaController {

    @Autowired
    private JpaService jpaService;

    @PostMapping("/submit")
    public ResponseEntity<JpaEntity> jpaInsert(@RequestBody JpaRequest jpaRequest) {
        log.info("testRequest"+jpaRequest.getText());
        JpaEntity jpaTest = jpaService.saveJpaTest(jpaRequest.getText());
        return new ResponseEntity<>(jpaTest, HttpStatus.CREATED);
    }

    @GetMapping("/list")
    public ResponseEntity<List<JpaEntity>> jpaSelect() {
        log.info("jpaSelect");
        List<JpaEntity> jpaTest = jpaService.getAllJpaTests();
        return ResponseEntity.ok().body(jpaTest);
    }

}
