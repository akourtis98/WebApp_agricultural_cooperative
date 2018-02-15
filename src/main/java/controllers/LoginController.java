package controllers;

import database.Users;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController
{

    @RequestMapping(value = "/signin")
    public String loginPage()
    {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login( ModelMap model, 
            @RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout)
    {
        
        if (error != null)
        {
            model.addAttribute("error", "Invalid username and password!");

            return "login";
        }

        if (logout != null)
        {
            model.addAttribute("msg", "You've been logged out successfully.");
            
            return "login";
        }
        
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Users thisUser = (Users)auth.getPrincipal();
        
        model.addAttribute("userName", thisUser.getUsername());
        model.addAttribute("id", thisUser.getId());
        
        return "login";
    }
    
    @RequestMapping(value = "/logout", method = RequestMethod.POST)
    public ModelAndView logout()
    {
        ModelAndView model = new ModelAndView();
        
        model.setViewName("home");
        
        return model;
    }
}
