package dao;

import org.hibernate.cfg.AnnotationConfiguration;
import database.Users;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao
{

    public Users findByUserName(String login)
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        Query query = sessionFactory.openSession().createQuery("from Users where username = :login");
        query.setParameter("login", login);

        List<Users> users = new ArrayList<Users>();
        users = query.list();

        if (users.size() > 0)
        {
            return users.get(0);
        } else
        {
            return null;
        }
    }

    public Users getByUserId(int userId)
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        Query query = sessionFactory.openSession().createQuery("from Users where id = :id");
        query.setParameter("id", userId);

        Users users = (Users) query.uniqueResult();

        if (users != null)
        {
            return users;
        } else
        {
            return null;
        }
    }

    public int getUserIdByRole(String role)
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        Query query = sessionFactory.openSession().createQuery("select id from Users where role = :role");
        query.setParameter("role", role);

        int role2 = (Integer) query.uniqueResult();
        return role2;
    }

    public void addUser(Users newUser)
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        session.save(newUser);

        session.getTransaction().commit();
    }

    public List<Users> getAllMembers()
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        Query query = session.createQuery(" from Users where role='MEMBER'");

        List<Users> usersList = query.list();
        

        return usersList;
    }

    public List<Users> checkIfUserExist(String username)
    {
        SessionFactory sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
        Session session = sessionFactory.getCurrentSession();
        session.beginTransaction();

        Query query = sessionFactory.openSession().createQuery("from Users where username = :username ");
        query.setParameter("username", username);

        List<Users> users = new ArrayList<Users>();
        users = query.list();

        if (users.size() > 0)
        {
            return users;
        } else
        {
            return null;
        }
    }
}
