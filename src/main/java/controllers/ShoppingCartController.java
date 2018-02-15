package controllers;

import database.OrdersHasProducts;
import database.Products;
import database.ShoppingCart;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import services.CartService;
import services.ProductsService;
import services.UserHasProductsService;
import services.UserService;

@Controller
@RequestMapping(value = "client")
public class ShoppingCartController
{
    @Autowired
    private CartService cartServ;
    
    @Autowired
    private UserService userServ;
    
    @Autowired
    private ProductsService productsServ;
    
    @Autowired
    private UserHasProductsService userHasProductsServ;
    
    @RequestMapping(value = "cart")
    public String returnShoppingCart(Model model)
    {
        cartServ.returnShoppingCart();
        Set<OrdersHasProducts> ohp = cartServ.returnCartItems();
        HashSet set = new HashSet(ohp);
        ArrayList<String> list = new ArrayList<String>(set);

        if (!list.isEmpty())
        {
            model.addAttribute("products", list);
        }

        return "shoppingCart";
    }

    @RequestMapping(value = "cart_delete/{productid}")
    public ModelAndView deleteCartProduct(@PathVariable("productid") int productid, ModelAndView model)
    {
        ShoppingCart scart = cartServ.returnShoppingCart();
        
        userHasProductsServ.deleteItemFromCart(productid , scart.getId().getId());
        
        Set<OrdersHasProducts> ohp = cartServ.returnCartItems();
        HashSet set = new HashSet(ohp);
        ArrayList<String> list = new ArrayList<String>(set);

        if (!list.isEmpty())
        {
            model.addObject("products", list);
        }
        
        model.setView(new RedirectView("/client/cart"));
        
        return model;
    }

    @RequestMapping(value = "update_quantity/{id}/{quantity}")
    public String updateQuantity(@PathVariable("id") int id, @PathVariable("quantity") int quantity, Model model)
    {
        productsServ.updateQuantity(id, quantity);

        List<Products> productList = productsServ.getAllVisibleProducts();

        if (!productList.isEmpty())
        {
            model.addAttribute("products", productList);
        }

        return "shoppingCart";
    }
    
    @RequestMapping(value = "update_cart_quantity/{id}/{quantity}")
    public String updateCartQuantity(@PathVariable("id") int id, @PathVariable("quantity") int quantity, Model model)
    { 
        userHasProductsServ.updateQuantity(id, quantity, userServ.getUserById().getId());

        Set<OrdersHasProducts> ohp = cartServ.returnCartItems();
        HashSet set = new HashSet(ohp);
        ArrayList<String> list = new ArrayList<String>(set);

        if (!list.isEmpty())
        {
            model.addAttribute("products", list);
        }
        
        return "shoppingCart";
    }
    
    @RequestMapping(value = "addcart/{productid}/{quantity}")
    public ModelAndView addcart(@PathVariable("productid") int productid,@PathVariable("quantity") int quantity, ModelAndView model)
    {
        cartServ.insertItemToCart(productid, quantity);

        Set<OrdersHasProducts> ohp = cartServ.returnCartItems();
        HashSet set = new HashSet(ohp);
        ArrayList<String> list = new ArrayList<String>(set);

        if (!list.isEmpty())
        {
            model.addObject("products", list);
        }
        
        model.setViewName("shoppingCart");
        
        return model;
    }
}
