package com.saad;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InsertController {

    @RequestMapping(value = "/insertJsp", method = RequestMethod.POST)
    public String printHelloWorld(ModelMap modelMap){
        // return the name of the file to be loaded "hello_world.jsp"
        return "InsertPage";
    }
}

