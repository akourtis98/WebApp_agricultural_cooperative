package controllers;

import database.Products;
import database.Users;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import services.ProductsService;
import services.UserService;

@Controller
public class ConfirmController
{
    @Autowired
    private ProductsService productsServ;
    
    @Autowired
    private UserService userServ;
    
    @RequestMapping("/admin/confirm")
    public String getAdminProductstoConfirmList(Model model)
    {
        List<Products> productList = productsServ.getAllInvisibleProducts();
        List<Users> usersList = userServ.getAllMembers();

        if (!productList.isEmpty())
        {
            model.addAttribute("products", productList);
        }

        if (!usersList.isEmpty())
        {
            model.addAttribute("members", usersList);
        }

        return "confirmProducts";
    }

    @RequestMapping(value = "/admin/confirmCheck/{id}", method = RequestMethod.POST)
    public String confirmByAdmin(@PathVariable("id") int id, HttpServletRequest request)
    {
        productsServ.setVisible(request.getParameter("price"), id);

        return "confirmProducts";
    }

}
