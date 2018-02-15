package controllers;

import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import services.AccountService;
import services.ProductsService;
import services.TransactionsService;
import services.UserService;

@Controller
@RequestMapping(value = "member")
public class SellProductController
{

    @Autowired
    private ProductsService productsServ;

    @Autowired
    private TransactionsService transactionsServ;

    @Autowired
    private AccountService accountServ;

    @Autowired
    private UserService userServ;

    @RequestMapping(value = "sell")
    public String productssell()
    {
        return "sellProduct";
    }

    @RequestMapping(value = "sellProduct", method = RequestMethod.POST)
    public ModelAndView sell(HttpServletRequest request)
    {
        ModelAndView mav = new ModelAndView();

        double total = (Double.parseDouble(request.getParameter("price"))) * (Integer.parseInt(request.getParameter("quantity")));
        if (accountServ.getAmountFromId(userServ.getUserIdByRole("ADMIN")) >= total)
        {
            productsServ.addProduct(userServ.getUserById(), request.getParameter("name"), request.getParameter("price"), request.getParameter("quantity"), request.getParameter("description"));

            accountServ.setMoneyToMember(total, userServ.getUserById());
            accountServ.removeMoneyFromAdmin(total, userServ.getUserIdByRole("ADMIN"));

            double total2 = total * 1.5;
            accountServ.setMoneyForShare(total2, userServ.getUserIdByRole("ADMIN"));

            transactionsServ.updateTransactions(userServ.getUserIdByRole("ADMIN"), userServ.getUserById().getId(), total, new Date());

            mav.addObject("message1", "Your product will be processed.");
            mav.addObject("message2", "Admininstrator will decide if your offer will be accept.");
        } else
        {
            mav.addObject("message1", "Total cost of your products is huge");
            mav.addObject("message2", "Administrator cannot buy your product. His amount is smaller");
        }
        mav.setViewName("thankyou");

        return mav;
    }

}
