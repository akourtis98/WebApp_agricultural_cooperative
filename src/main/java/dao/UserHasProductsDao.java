package dao;

import database.OrdersHasProducts;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.springframework.stereotype.Repository;

@Repository
public class UserHasProductsDao implements UserHasProductsDaoImpl
{
    public void updateQuantity(int productid ,int quantity, int userid)
    {   
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        Query q = session.createSQLQuery("update orders_has_products set quantity = :quantity where shopping_cart_users_id = :userid and products_id= :productid");
        q.setParameter("quantity", quantity);
        q.setParameter("userid", userid);
        q.setParameter("productid", productid);
        q.executeUpdate();
        
        session.getTransaction().commit();
    }
    
    public void deleteItemFromCart(int productid ,int cartid)
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        Query q = session.createSQLQuery("delete from orders_has_products where shopping_cart_id = :cartid and products_id= :productid");
        q.setParameter("cartid", cartid);
        q.setParameter("productid", productid);
        q.executeUpdate();
        
        session.getTransaction().commit();
    }
    
    public void deleteFromCartAddToOrders(OrdersHasProducts products, int orderId)
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        
        Query q = session.createSQLQuery("update orders_has_products set orders_id = :orderid , shopping_cart_id = :cartid where id = :productsid");
        q.setParameter("orderid",orderId);
        q.setParameter("cartid",null);
        q.setParameter("productsid",products.getId());
        
        q.executeUpdate();
        
        session.getTransaction().commit();
    }
}
