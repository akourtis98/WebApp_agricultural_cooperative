package dao;

import database.OrdersHasProducts;
import database.ShoppingCart;
import java.util.Set;

public interface CartDaoImpl
{
    public boolean insertItemToCart(OrdersHasProducts ohp);
    
    public Set<OrdersHasProducts> returnCartItems(int userId);
    
    public ShoppingCart returnShoppingCart(int userId);
   
}
