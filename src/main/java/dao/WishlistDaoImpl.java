package dao;

import database.Products;
import java.util.List;

public interface WishlistDaoImpl
{
    public boolean insertItem(int productId);
    
    public List<Products> getItems(int userID);
    
    public void deleteItem(int userID, int productID);
}
