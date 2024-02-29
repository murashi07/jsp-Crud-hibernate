package dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import model.User;
import usermanagement.util.HibernateUtil;

public class UserDao {

    public static int save(User u) {
        int status = 0;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction t = session.beginTransaction();
            session.persist(u);
            t.commit();
            status = 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static int update(User u) {
        int status = 0;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction t = session.beginTransaction();
            session.update(u);
            t.commit();
            status = 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static int delete(User u) {
        int status = 0;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Transaction t = session.beginTransaction();
            session.delete(u);
            t.commit();
            status = 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static List<User> getAllRecords() {
        List<User> list = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            list = session.createQuery("from User", User.class).list();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static User getRecordById(int id) {
        User u = null;
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            u = session.get(User.class, id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }
}
