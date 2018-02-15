package controllers;

import database.Products;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import services.ProductsService;
import services.UserService;
import services.WishListService;

@Controller
@RequestMapping(value = "client")
@SessionAttributes("userID")
public class WishlistController
{
    @Autowired
    private ProductsService productsServ;
    
    @Autowired
    private UserService userServ;
    
    @Autowired
    private WishListService wishListServ;
    
    @RequestMapping(value = "inserItem/{productId}")
    public ModelAndView inserItem(@PathVariable("productId") int id)
    {
        ModelAndView mav = new ModelAndView();

        if (wishListServ.insertItem(id))
        {
            mav.setView(new RedirectView("/products", true));
        } 
        else
        {
            mav.addObject("existsws", "alreadyinwishlist");
            mav.setViewName("productList");

            List<Products> productList = productsServ.getAllVisibleProducts();

            if (!productList.isEmpty())
            {
                mav.addObject("products", productList);
            }
        }

        return mav;
    }

    @RequestMapping(value = "/wishlist")
    public ModelAndView showWishList()
    {
        ModelAndView mav = new ModelAndView();

        List<Products> productList = wishListServ.getItems(userServ.getUserById().getId());

        mav.addObject("products", productList);
        mav.setViewName("wishlist");

        return mav;
    }

    @RequestMapping(value = "/wishlist_delete/{productId}")
    public ModelAndView deleteItem(@PathVariable("productId") int productID)
    {
        ModelAndView mav = new ModelAndView();

        wishListServ.deleteItem(userServ.getUserById().getId(), productID);
        List<Products> productList = wishListServ.getItems(userServ.getUserById().getId());

        mav.addObject("products", productList);
        mav.setViewName("wishlist");

        return mav;
    }
}
