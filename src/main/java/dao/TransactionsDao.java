package dao;

import database.Transactions;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.springframework.stereotype.Repository;

@Repository
public class TransactionsDao implements TransactionsDaoImpl
{

    public List<Transactions> getAllTransactions()
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        Query query = session.createQuery(" from Transactions");

        List<Transactions> transactionsList = query.list();
       

        return transactionsList;
    }

    public void updateTransactions(Transactions transaction)
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        session.save(transaction);

        session.getTransaction().commit();
    }

}
