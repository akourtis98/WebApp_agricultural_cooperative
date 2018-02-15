package controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomePageController
{
    @RequestMapping(value = "/")
    public String homePage()
    {
        return "homepage";
    }

    @RequestMapping(value = "/home")
    public String homePage2()
    {
        return "homepage";
    }
}
