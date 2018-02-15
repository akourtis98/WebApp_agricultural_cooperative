package controllers;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import services.UserService;

@Controller
public class RegisterController
{
    private UserService userService;

    @Autowired(required = true)
    public void setPersonService(UserService us)
    {
        this.userService = us;
    }

    @RequestMapping(value = "/signup")
    public String registerPage()
    {
        return "register";
    }

    @RequestMapping(value = "/complete_register", method = RequestMethod.POST)
    public ModelAndView registerUser(HttpServletRequest request)
    {
        ModelAndView mav = new ModelAndView();

        boolean insertUserResult = userService.registerUser(request.getParameter("name"), request.getParameter("password"), request.getParameter("email"), request.getParameter("address"));

        if (insertUserResult)
        {
            mav.addObject("message1", "Thank you for your registration.");
            mav.addObject("message2", "You can now buy our products.");
            mav.setViewName("thankyou");
            return mav;
        } else
        {
            mav.addObject("exists", "exists");
            mav.setViewName("register");
            return mav;
        }
    }
}
