package dao;

import database.Orders;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.springframework.stereotype.Repository;

@Repository
public class OrdersDao implements OrdersDaoImpl
{   
    public void addNewOrder(Orders order)
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        
        session.save(order);
        
        session.getTransaction().commit();
    }
}
