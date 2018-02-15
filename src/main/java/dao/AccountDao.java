package dao;

import database.Account;
import database.Users;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDao implements AccountDaoImpl
{
    public int setMoneyToMember(double money, Users user)
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        money = getAmountFromId(user.getId()) + money;
        Query query = session.createQuery("update Account set amount = :money where id = :id");
        query.setParameter("money", money);
        query.setParameter("id", user.getId());
        int result = query.executeUpdate();

        session.getTransaction().commit();

        return result;
    }

    public double getAmountFromId(int id)
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        Query query = session.createQuery(" select amount from Account where id= :id");
        query.setParameter("id", id);

        double amount = (Double) query.uniqueResult();
        

        return amount;
    }

    public double getShareMoneyFromId(int id)
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        Query query = session.createQuery(" select moneyShare from Account where id= :id");
        query.setParameter("id", id);

        double amount = (Double) query.uniqueResult();
        

        return amount;
    }

    public List<Account> getAllAccounts()
    {

        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        Query query = session.createQuery(" from Account");

        List<Account> accountList = query.list();
        

        return accountList;

    }

    public int removeMoneyFromAdmin(double money, int id)
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        money = getAmountFromId(id) - money;
        Query query = session.createQuery("update Account set amount = :money where id = :id");
        query.setParameter("money", money);
        query.setParameter("id", id);
        int result = query.executeUpdate();

        session.getTransaction().commit();

        return result;
    }

    public int removeShareMoneyFromAdmin(double money, int id)
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        money = getShareMoneyFromId(id) - money;
        Query query = session.createQuery("update Account set moneyShare = :money where id = :id");
        query.setParameter("money", money);
        query.setParameter("id", id);
        int result = query.executeUpdate();

        session.getTransaction().commit();

        return result;
    }

    public int setMoneyForShare(double money, int id)
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        money = getShareMoneyFromId(id) + money;
        Query query = session.createQuery("update Account set moneyShare = :money where id = :id");
        query.setParameter("money", money);
        query.setParameter("id", id);
        int result = query.executeUpdate();

        session.getTransaction().commit();

        return result;
    }

}
