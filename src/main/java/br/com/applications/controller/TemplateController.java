package br.com.applications.controller;

import br.com.applications.generic.GetMapping;
import org.springframework.stereotype.Controller;

@Controller
// @RequestMapping("/login")
public class TemplateController {

    @GetMapping(name = "login")
    public String getLoginView() {
        return "login";
    }

  //   video 02:29:05
}
