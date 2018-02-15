package services;

import dao.CartDao;
import database.OrdersHasProducts;
import database.Products;
import database.ShoppingCart;
import database.ShoppingCartId;
import database.Users;
import java.util.Date;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartService
{
    @Autowired
    private CartDao cartDao;
    
    @Autowired
    private UserService userServ;
    
    @Autowired
    private ProductsService productServ;

    public void insertItemToCart(int productId, int quantity)
    {
        ShoppingCart spc = returnShoppingCart();     
        Products pr = productServ.getProductById(productId);
        
        if (cartDao.checkIfItemExists(pr, spc))
        {
            return;
        }
        
        OrdersHasProducts ohp = new OrdersHasProducts();
        ohp.setShoppingCart(spc);
        ohp.setQuantity(quantity);
        ohp.setPrice(quantity * pr.getPrice());
        ohp.setProducts(pr);
        
        cartDao.insertItemToCart(ohp);
    }
    
    public Set<OrdersHasProducts> returnCartItems()
    {
        int userID = userServ.getUserById().getId();
        
        return cartDao.returnCartItems(userID);
    }
    
    public ShoppingCart returnShoppingCart()
    {
        int userID = userServ.getUserById().getId();
        
        ShoppingCart spc = cartDao.returnShoppingCart(userID);
        
        if (spc == null)
        {
            spc = new ShoppingCart();
            Users user = userServ.getUserById();
            
            ShoppingCartId spcid = new ShoppingCartId();
            spcid.setUsersId(userID);
            spc.setShoppingCartDate(new Date());
            spc.setId(spcid);
            spc.setUsers(user);
            
            cartDao.saveShoppingCart(spc);
        }
        
        return spc;
    } 
}
