package controllers;

import database.Products;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import services.ProductsService;

@Controller
public class ProductsController
{
    @Autowired
    private ProductsService productServ;
    
    @RequestMapping("/products")
    public String getProductsList(Model model)
    {
        List<Products> productList = productServ.getAllVisibleProducts();

        if (!productList.isEmpty())
        {
            model.addAttribute("products", productList);
        }
        
        return "productList";
    }

    @RequestMapping("/admin/products")
    public String getAdminProductsList(Model model)
    {
        List<Products> productList = productServ.getAllVisibleProducts();

        if (!productList.isEmpty())
        {
            model.addAttribute("products", productList);
        }

        return "productList";
    }
}
