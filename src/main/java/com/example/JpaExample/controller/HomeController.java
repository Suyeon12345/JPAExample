package com.example.JpaExample.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Log4j2
@Controller
public class HomeController {
    @GetMapping("/")
    public String index() {
        log.info("index 호출");
        return "index";
    }
}
