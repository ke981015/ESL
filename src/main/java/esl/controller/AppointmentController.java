package esl.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import esl.dao.AppointmentDAO;
import esl.dao.UserDAO;
import esl.pojo.Appointment;
import esl.pojo.Tutor;
import esl.pojo.Student;
import esl.pojo.User;



@Controller
public class AppointmentController {
   
        @RequestMapping(value = "/leftFrame.htm", method = RequestMethod.GET)
	public String showLeftPage(HttpServletRequest request, UserDAO userDao, AppointmentDAO appointmentDao,
			ModelMap map) throws Exception {
            HttpSession session = request.getSession();
            User currentUser = (User) session.getAttribute("user");
            if (currentUser instanceof Student) {   
                return "student-left";
            }
            else if (currentUser instanceof Tutor) {   
                return "tutor-left";
            }
            return null;
	}
        
	@RequestMapping(value = "/appointments.htm", method = RequestMethod.GET)
	public String showAppointmentPage(HttpServletRequest request, UserDAO userDao, AppointmentDAO appointmentDao,
			ModelMap map) throws Exception {
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute("user");
		String action = request.getParameter("action");
		if (action.equals("view")) {
                        if (currentUser instanceof Student) {   
                            int receiverid = currentUser.getAccountid();
                            List<Appointment> appointmentList = appointmentDao.getByReceiverId(receiverid);
                            map.addAttribute("appointmentList", appointmentList);
                            return "appointments-manage";
                        } 
                        else if (currentUser instanceof Tutor) {
                            int senderid = currentUser.getAccountid();
                            List<Appointment> appointmentList = appointmentDao.getBySenderId(senderid);
                            map.addAttribute("appointmentList", appointmentList);
                            return "appointments-view";
                        }
		} 
                else if (action.equals("request")) {
                        if (currentUser instanceof Student) {   
                            List<Appointment> appointmentList = appointmentDao.getAllAppointment();
                            map.addAttribute("appointmentList", appointmentList);
                            return "appointments-schedule";
                        } 
                        else if (currentUser instanceof Tutor) {
                            map.addAttribute("sender", currentUser);
                            return "appointments-upload";
                        }
                }
                else if(action.equals("confirmed")) {
			String appointmentid = request.getParameter("appointmentid");
			System.out.println("here" + appointmentid);
			Appointment appointment = appointmentDao.getById(appointmentid);
                        appointment.setReceiver(currentUser);
			appointmentDao.confirm(appointmentid, currentUser);
			return "redirect:/appointments.htm?action=view";
                }
                else if(action.equals("cancel")) {
                        if (currentUser instanceof Student) {   
                            int appointmentid = Integer.parseInt(request.getParameter("appointmentid"));
                            appointmentDao.cancelbystudent(appointmentid);
                            return "redirect:/appointments.htm?action=view";
                        } 
                        else if (currentUser instanceof Tutor) {
                            int appointmentid = Integer.parseInt(request.getParameter("appointmentid"));
                            appointmentDao.cancelbytutor(appointmentid);
                            return "redirect:/appointments.htm?action=view";
                        }
		}
		return null;
	}
        
	@RequestMapping(value = "/appointments.htm", method = RequestMethod.POST)
	public String handleAppointmentsRequests(HttpServletRequest request, UserDAO userDao, AppointmentDAO appointmentDao,
			ModelMap map) throws Exception {
		String action = request.getParameter("action");
		if (action.equals("request")) {
			HttpSession session = request.getSession();
			String Date = request.getParameter("date");
			String Time = request.getParameter("time");

			Appointment appointment = new Appointment();

			User sender = (User) session.getAttribute("user");
                        
			appointment.setSender(sender);
			appointment.setDate(Date);
			appointment.setTime(Time);
			appointmentDao.create(appointment);	
                        return "redirect:/appointments.htm?action=view";
		}
		return null;
	}

}
