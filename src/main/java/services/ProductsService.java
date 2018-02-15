package services;

import dao.ProductsDao;
import database.Categories;
import database.Products;
import database.Users;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductsService
{
    @Autowired
    ProductsDao productsDao;

    @Autowired
    CartService cartServ;

    public List<Products> getAllProducts()
    {
        return productsDao.getAllProducts();
    }

    public List<Products> getAllVisibleProducts()
    {
        return productsDao.getAllVisibleProducts();
    }

    public List<Products> getAllInvisibleProducts()
    {
        return productsDao.getAllInvisibleProducts();
    }

    public int setVisible(String price, int id)
    {
        return productsDao.setVisible(price, id);
    }

    public Products getProductById(int productId)
    {
        return productsDao.getProductById(productId);
    }

    public void addProduct(Users user, String name, String price, String quantity, String description)
    {
        Categories ctg = new Categories();

        if (name.equals("olives") || name.equals("tomatoes") || name.equals("onions"))
        {
            ctg.setId(1);
        } else
        {
            ctg.setId(2);
        }

        double money = Double.parseDouble(price);
        String image = "/resources/images/" + name + ".jpg";

        Products newProduct = new Products();
        newProduct.setName(name);
        newProduct.setPrice(money);
        newProduct.setImage(image);
        newProduct.setQuantity(Integer.parseInt(quantity));
        newProduct.setDescription(description);
        newProduct.setCategories(ctg);
        newProduct.setVisible((byte) 0);
        Set set1 = new HashSet();
        set1.add(user);
        newProduct.setUserses(set1);

        productsDao.addProduct(newProduct);
    }

    public void deleteProduct(int id)
    {
        productsDao.deleteProduct(id);
    }

    public void updateQuantity(int id, int quantity)
    {
        productsDao.updateQuantity(id, quantity);
    }
}
