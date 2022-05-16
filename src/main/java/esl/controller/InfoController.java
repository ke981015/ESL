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
import esl.pojo.Tutor;

@Controller
public class InfoController {

	@RequestMapping(value="/information.htm", method = RequestMethod.GET)
	public String handlePatientList(HttpServletRequest request, AppointmentDAO appointmentDao,ModelMap map,UserDAO userDao) {
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		if(action.equals("view")) {
			List<Tutor> tutorList = userDao.getTutor();
			map.addAttribute("tutorList", tutorList);
			return "student-view";
		}
		else if(action.equals("edit")) {
                        Tutor currentUser = (Tutor)session.getAttribute("user");
			map.addAttribute("tutor", currentUser);
			return "tutor-edit";
		}
		return null;
	}
        
        @RequestMapping(value = "/information.htm", method = RequestMethod.POST)
	public String handleAppointmentsRequests(HttpServletRequest request, UserDAO userDao, AppointmentDAO appointmentDao,
			ModelMap map) throws Exception {
		String action = request.getParameter("action");
		if (action.equals("edit")) {
			HttpSession session = request.getSession();
			String content = request.getParameter("content");
			Tutor currentUser = (Tutor)session.getAttribute("user");                        
			currentUser.setInformation(content);
			userDao.updateTutor(currentUser.getAccountid(),currentUser.getInformation());	
                        return "redirect:/information.htm?action=edit";
		}
		return null;
	}

}
