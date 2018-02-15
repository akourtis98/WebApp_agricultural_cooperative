package dao;

import database.OrdersHasProducts;
import database.Products;
import database.ShoppingCart;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.springframework.stereotype.Repository;

@Repository
public class CartDao implements CartDaoImpl
{  
    public boolean insertItemToCart(OrdersHasProducts ohp)
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        session.save(ohp);

        session.getTransaction().commit();

        return true;
    }
    
    public boolean saveShoppingCart(ShoppingCart spc)
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        session.save(spc);

        session.getTransaction().commit();
        
        return true;
    }
    
    public Set<OrdersHasProducts> returnCartItems(int userId)
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        
        List<ShoppingCart> scl = new ArrayList();
        
        Query q = session.createSQLQuery(" select * from shopping_cart where users_id= :id").addEntity(ShoppingCart.class);
        q.setParameter("id", userId);
        
        scl = q.list();
        
        if (scl.isEmpty())
        {
            return null;
        }
        else
        {
            return scl.get(0).getOrdersHasProductses();
        }
    }

    public ShoppingCart returnShoppingCart(int userId)
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        List<ShoppingCart> scl = new ArrayList();

        Query q = session.createSQLQuery(" select * from shopping_cart where users_id= :id").addEntity(ShoppingCart.class);
        q.setParameter("id", userId);
        scl = q.list();
        
        if (scl.isEmpty())
            return null;
        else
            return scl.get(0);
    }

    public boolean checkIfItemExists(Products pr, ShoppingCart spc)
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        
        Set<OrdersHasProducts> ohp = spc.getOrdersHasProductses();
        Iterator<OrdersHasProducts> iterator = ohp.iterator();
        
        while (iterator.hasNext())
        {
            OrdersHasProducts ohpohpit = iterator.next();
            
            if (ohpohpit.getProducts().getId() == pr.getId())
            {
                Query q = session.createSQLQuery("update orders_has_products set quantity= :quantity where id = :id");
                q.setParameter("quantity", ohpohpit.getQuantity() + 1);
                q.setParameter("id", ohpohpit.getId());
                q.executeUpdate();
                
                session.getTransaction().commit();
                
                return true;
            }
        }
        
        return false;
    }
}
