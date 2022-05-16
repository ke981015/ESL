package esl.dao;

import static esl.dao.DAO.close;
import static esl.dao.DAO.getSession;
import esl.pojo.Appointment;
import org.hibernate.HibernateException;
import org.hibernate.Query;

import esl.pojo.Tutor;
import esl.pojo.Student;
import esl.pojo.User;
import java.util.List;

public class UserDAO extends DAO{
	public User get(String username){
        try {
            begin();
            Query q = getSession().createQuery("from User where username = :username");
            q.setString("username", username);
            User user = (User) q.uniqueResult();
            close();
            return user;
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
            return null;   
    }
	
	public User get(int accountid){
        try {
            begin();
            Query q = getSession().createQuery("from User where accountid = :accountid");
            q.setInteger("accountid", accountid);
            User user = (User) q.uniqueResult();
            close();
            return user;
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
            return null;   
    }
        
        public List<Tutor> getTutor() {
		try {
			begin();
			Query q = getSession().createQuery("from Tutor");
			List<Tutor> tutors = q.list();
			close();
			return tutors;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	public User get(String username,String password){
        try {
            begin();
            Query q = getSession().createQuery("from User where username = :username and password = :password");
            q.setString("username", username);
            q.setString("password", password);
            User user = (User) q.uniqueResult();
            close();
            return user;
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
            return null;
    }
	
	public User register(User u) throws Exception {
        try {
            begin();
            System.out.println("inside DAO");
            getSession().save(u);
            commit();
            return u;

        } catch (HibernateException e) {
            rollback();
            throw new Exception("Exception while creating user: " + e.getMessage());
        }
    }
	
	public boolean updateUser(String username) throws Exception {
        try {
            begin();
            System.out.println("inside DAO");
            Query q = getSession().createQuery("from user where username = :username");
            q.setString("username", username);
            User user = (User) q.uniqueResult();
            if(user!=null){
                getSession().update(user);
                commit();
                return true;
            }else{
                return false;
            }

        } catch (HibernateException e) {
            rollback();
            throw new Exception("Exception while creating user: " + e.getMessage());
        }
    
    }
	
	public boolean updateUserPw(String accountid, String password) throws Exception {
        try {
            begin();
            System.out.println("inside DAO");
            Query q = getSession().createQuery("from User where accountid = :accountid");
            q.setString("accountid", accountid);
            User user = (User) q.uniqueResult();
            if(user!=null){
                user.setPassword(password);
                getSession().update(user);
                commit();
                return true;
            }else{
                return false;
            }

        } catch (HibernateException e) {
            rollback();
            throw new Exception("Exception while creating user: " + e.getMessage());
        } 
    }
        
        public boolean updateTutor(int accountid, String information) throws Exception {
        try {
            begin();
            System.out.println("inside DAO");
            Query q = getSession().createQuery("from Tutor where accountid = :accountid");
            q.setInteger("accountid", accountid);
            Tutor doctor = (Tutor) q.uniqueResult();
            if(doctor!=null){
            	doctor.setInformation(information);
                getSession().update(doctor);
                commit();
                close();
                return true;
            }else{
                return false;
            }

        } catch (HibernateException e) {
            rollback();
            throw new Exception("Exception while creating user: " + e.getMessage());
        }
        }

}
