package services;

import dao.UserHasProductsDao;
import database.Orders;
import database.OrdersHasProducts;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserHasProductsService
{
    @Autowired
    private UserHasProductsDao userHasProductsDao;
    
    @Autowired
    private ProductsService productServ;
    
    @Autowired
    private CartService cartServ;
    
    public void updateQuantity(int productid ,int quantity, int userid)
    {  
        userHasProductsDao.updateQuantity(productid, quantity, userid);
    }
    
    public void deleteItemFromCart(int productid ,int cartid)
    {
        userHasProductsDao.deleteItemFromCart(productid, cartid);
    }
    
    public void deleteFromCartAddToOrders(Orders order)
    {
        Set<OrdersHasProducts> products = cartServ.returnCartItems();

        for(OrdersHasProducts orderHasPro : products)
        {
            productServ.updateQuantity(orderHasPro.getProducts().getId(), orderHasPro.getProducts().getQuantity() - orderHasPro.getQuantity());
            userHasProductsDao.deleteFromCartAddToOrders(orderHasPro, order.getId());
        }
    }
}
