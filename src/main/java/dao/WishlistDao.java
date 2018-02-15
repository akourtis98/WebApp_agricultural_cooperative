package dao;

import database.Products;
import database.Wishlist;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.springframework.stereotype.Repository;

@Repository
public class WishlistDao
{
    public boolean insertItem(Wishlist wsl)
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        session.save(wsl);

        session.getTransaction().commit();
        
        return true;
    }

    public List<Products> getItems(int userID)
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
      
        Query query = session.createSQLQuery(" select * from wishlist where users_id = :id").addEntity(Wishlist.class);
        query.setParameter("id", userID);
        
        List<Products> products = new ArrayList();
        List<Wishlist> wishlist = query.list();
        
        for (int i  = 0; i < wishlist.size(); i++)
        {
            products.add(wishlist.get(i).getProducts());
        }
         
        

        return products;
    }

    public void deleteItem(int userID, int productID)
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        Query query = session.createSQLQuery(" delete from wishlist where users_id = :userID and products_id = :productId");
        query.setParameter("userID", userID);
        query.setParameter("productId", productID);
        query.executeUpdate();
        
        session.getTransaction().commit();
    }

    public boolean checkIfItemExists(int productId,int userId)
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        List<Wishlist> wl = new ArrayList<Wishlist>();

        Query q = session.createSQLQuery(" select * from wishlist where users_id= :userid and products_id= :productId");
        q.setParameter("userid", userId);
        q.setParameter("productId", productId);
        wl = q.list();

        if (wl.isEmpty())
            return true;
        else
            return false;
    }
}
