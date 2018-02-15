package dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import database.Products;
import org.hibernate.cfg.AnnotationConfiguration;

@Repository
public class ProductsDao implements ProductsDaoImpl {

    public List<Products> getAllProducts() {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        Query query = session.createQuery(" from Products ");

        List<Products> productList = query.list();
        

        return productList;
    }

    public List<Products> getAllVisibleProducts() {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        Query query = session.createQuery(" from Products where visible=1");

        List<Products> productList = query.list();
          
        return productList;
    }

    public List<Products> getAllInvisibleProducts() {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        Query query = session.createQuery(" from Products where visible=0");

        List<Products> productList = query.list();
        

        return productList;
    }

    public int setVisible(String price, int id) {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        double money = Double.parseDouble(price);
        Query query = session.createQuery("update Products set price = :price, visible =:visible where id = :id");
        query.setParameter("price", money);
        query.setParameter("visible", (byte) 1);
        query.setParameter("id", id);
        int result = query.executeUpdate();
        session.getTransaction().commit();
        
        return result;
    }

    public Products getProductById(int productId) {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        Query query = session.createQuery(" from Products where id= :id");
        query.setParameter("id", productId);

        List<Products> productList = query.list();
        

        if (productList.isEmpty()) {
            return null;
        }

        return productList.get(0);
    }

    public void addProduct(Products product) {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        session.save(product);

        session.getTransaction().commit();
    }

    public void deleteProduct(int id) {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        Query q = session.createSQLQuery("delete from products where id = :id");
        q.setParameter("id", id);
        q.executeUpdate();

        session.getTransaction().commit();
    }

    public void updateQuantity(int id, int quantity) {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        Query q = session.createSQLQuery("update products set quantity = :quantity where id = :id");
        q.setParameter("quantity", quantity);
        q.setParameter("id", id);
        q.executeUpdate();

        session.getTransaction().commit();
    }
}
