package dao;

import database.OrdersHasProducts;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.springframework.stereotype.Repository;

@Repository
public class SalesDao implements SalesDaoImpl {

    public List<OrdersHasProducts> getSaleOfProducts() {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        Query query = session.createSQLQuery("select * from orders_has_products where orders_id in(select id from orders) order by orders_id asc").addEntity(OrdersHasProducts.class);

        List<OrdersHasProducts> ordersList = query.list();

        return ordersList;
    }

    public List<OrdersHasProducts> getSaleOfProductsFilter(String date1, String date2) throws ParseException {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date frmDate = format.parse(date1);
        Date enDate = format.parse(date2);

        Query query = session.createSQLQuery("select * from orders_has_products where orders_id in(select id from orders where purchace_date between :data1 and :data2)").addEntity(OrdersHasProducts.class);
        query.setTimestamp("data1", frmDate);
        query.setTimestamp("data2", enDate);
        List<OrdersHasProducts> ordersList = query.list();

        return ordersList;
    }

}
