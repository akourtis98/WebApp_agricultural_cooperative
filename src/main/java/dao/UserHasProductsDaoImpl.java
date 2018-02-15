package dao;

import database.OrdersHasProducts;

public interface UserHasProductsDaoImpl
{
    public void updateQuantity(int productid ,int quantity, int userid);
    
    public void deleteItemFromCart(int productid ,int cartid);
    
    public void deleteFromCartAddToOrders(OrdersHasProducts products, int orderId);
}
