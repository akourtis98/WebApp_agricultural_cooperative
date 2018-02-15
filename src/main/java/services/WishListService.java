package services;

import dao.WishlistDao;
import database.Products;
import database.Users;
import database.Wishlist;
import database.WishlistId;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WishListService
{
    @Autowired
    private WishlistDao wishListDao;
    
    @Autowired
    private UserService userServ;
    
    @Autowired
    private ProductsService productsServ;

    public boolean insertItem(int productId)
    {
        int userId = userServ.getUserById().getId();

        if (!wishListDao.checkIfItemExists(productId, userId))
        {
            return false;
        }
        
        Products product = productsServ.getProductById(productId);
        Users user = userServ.getUserById();
        
        WishlistId wslId = new WishlistId();
        wslId.setProductsId(productId);
        wslId.setUsersId(userId);

        Wishlist wsl = new Wishlist();
        wsl.setId(wslId);
        wsl.setProducts(product);
        wsl.setUsers(user);

        return wishListDao.insertItem(wsl);
    }
    
    public List<Products> getItems(int userID)
    {
        return wishListDao.getItems(userID);
    }
    
    public void deleteItem(int userID, int productID)
    {
        wishListDao.deleteItem(userID, productID);
    }
    
    public boolean checkIfItemExists(int productId,int userId)
    {
        return wishListDao.checkIfItemExists(productId, userId);
    }
}
