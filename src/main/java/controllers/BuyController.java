package controllers;

import dao.UserDao;
import database.Orders;
import database.OrdersHasProducts;
import database.Products;
import database.Users;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import services.AccountService;
import services.CartService;
import services.OrdersService;
import services.UserHasProductsService;
import services.UserService;

@Controller
@RequestMapping(value = "client")
public class BuyController
{
    @Autowired
    private UserDao usersDao;

    @Autowired
    private CartService cartServ;

    @Autowired
    private OrdersService ordersServ;

    @Autowired
    private UserService userServ;
    
    @Autowired
    private UserHasProductsService userHasProductsServ;
    
    @Autowired
    private AccountService accountsServ;

    @RequestMapping(value = "checkout/{totalPrice}")
    public ModelAndView checkout(ModelAndView mav, @PathVariable("totalPrice") int totalPrice)
    {
        Set<OrdersHasProducts> cartItems = cartServ.returnCartItems();
        HashSet set = new HashSet(cartItems);
        ArrayList<String> list = new ArrayList<String>(set);

        ArrayList<String[]> itemsDontExist = new ArrayList();
        Iterator<OrdersHasProducts> iterator = cartItems.iterator();

        while (iterator.hasNext())
        {
            OrdersHasProducts thisOrdHasProd = iterator.next();
            Products thisProduct = thisOrdHasProd.getProducts();

            if (thisOrdHasProd.getQuantity() > thisProduct.getQuantity())
            {
                itemsDontExist.add(new String[]
                {
                    thisProduct.getName(), String.valueOf(thisProduct.getQuantity())
                });
            }

        }

        if (itemsDontExist.isEmpty())
        {
              mav.addObject("totalPrice", totalPrice);
              mav.setViewName("buyWithCredit");
        }
        else
        {
            mav.addObject("itemsDontExistList", itemsDontExist);
            mav.setViewName("shoppingCart");
        }

        if (!list.isEmpty())
        {
            mav.addObject("products", list);
        }

        return mav;
    }
    
    @RequestMapping(value = "checkout2/{totalPrice}")
    public ModelAndView checkout2(ModelAndView mav, @PathVariable("totalPrice") int totalPrice)
    {
        mav.addObject("message1", "Thank you for your purchase.");
        mav.addObject("message2", "We hope you like it.");
        mav.setViewName("thankyou");

        Users user = userServ.getUserById();
        Orders order = ordersServ.addNewOrder(totalPrice, user);

        accountsServ.setMoneyToMember(totalPrice, usersDao.getByUserId(userServ.getUserIdByRole("ADMIN")));

        userHasProductsServ.deleteFromCartAddToOrders(order);
        
        return mav;
    }
}
