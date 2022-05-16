package esl.dao;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import esl.pojo.Appointment;
import esl.pojo.User;

public class AppointmentDAO extends DAO {
    
	public Appointment getById(String appointmentid) {
		try {
			begin();
			Query q = getSession().createQuery("from Appointment where appointmentid = :appointmentid");
			q.setString("appointmentid", appointmentid);
			Appointment appointment = (Appointment) q.uniqueResult();
			close();
			return appointment;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	public List<Appointment> getAllAppointment() {
		try {
			begin();
			Query q = getSession().createQuery("from Appointment where receiver = null");
			List<Appointment> appointments = q.list();
			close();
			return appointments;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
        
        public List<Appointment> getByReceiverId(int senderid) {
		try {
			begin();
			Query q = getSession().createQuery("from Appointment where receiver = :sender");
			q.setInteger("sender", senderid);
			List<Appointment> appointments = q.list();
			close();
			return appointments;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
        
        public List<Appointment> getBySenderId(int senderid) {
		try {
			begin();
			Query q = getSession().createQuery("from Appointment where sender = :sender");
			q.setInteger("sender", senderid);
			List<Appointment> appointments = q.list();
			close();
			return appointments;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	public Appointment create(Appointment appointment) throws Exception{
		try {
			begin();
			System.out.println("inside DAO");
			getSession().save(appointment);
			commit();
			return appointment;
		}catch(HibernateException e) {
			rollback();
			throw new Exception("Exception while creating appointment: " + e.getMessage());
		}
	}
	
	public void cancelbystudent(int appointmentid) throws Exception{
		try {
			begin();
			System.out.println("inside DAO");
			Query q = getSession().createQuery("update Appointment set receiver = null where appointmentid = :appointmentid");
			q.setInteger("appointmentid", appointmentid);
                        q.executeUpdate();
                        commit();
		}catch(HibernateException e) {
			rollback();
			throw new Exception("Exception while editing appointment :" + e.getMessage());
		}
	}
        
        public void cancelbytutor(int appointmentid) throws Exception{
		try {
			begin();
			System.out.println("inside DAO");
			Query q = getSession().createQuery("delete from Appointment where appointmentid = :appointmentid");
			q.setInteger("appointmentid", appointmentid);
                        q.executeUpdate();
                        commit();
		}catch(HibernateException e) {
			rollback();
			throw new Exception("Exception while editing appointment :" + e.getMessage());
		}
	}
	
	public boolean confirm(String appointmentid,User confirmedTimes) throws Exception{
		try {
			begin();
			System.out.println("inside DAO");
			Query q = getSession().createQuery("from Appointment where appointmentid = :id");
			q.setString("id", appointmentid);
			Appointment appointment = (Appointment)q.uniqueResult();
			if(appointment != null) {
				appointment.setReceiver(confirmedTimes);
				getSession().update(appointment);
				commit();
				return true;
			}else {
				return false;
			}
		}catch(HibernateException e) {
			rollback();
			throw new Exception("Exception while editing appointment :" + e.getMessage());
		}
	}

}
