package esl.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import esl.dao.UserDAO;
import esl.pojo.User;
import esl.pojo.Tutor;
import esl.pojo.Student;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@RequestMapping(value = "/user/login.htm", method = RequestMethod.GET)
	public String showLoginForm() {
		return "user-login";
	}

	@RequestMapping(value = "/user/login.htm", method = RequestMethod.POST)
	public String handleLoginForm(HttpServletRequest request, UserDAO userDao, ModelMap map) {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		try {
			User u = userDao.get(username, password);

			if (u != null) {
				HttpSession session = request.getSession();
				session.setAttribute("user", u);
				session.setMaxInactiveInterval(120*60);
				 
				if (u instanceof Student) {
					return "redirect:/student/dashboard.htm";
				} else if (u instanceof Tutor) {
					return "redirect:/tutor/dashboard.htm";
				}
			}
			else {
				map.addAttribute("errorMessage", "Invalid username/password!");
				return "error";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/student/dashboard.htm", method = RequestMethod.GET)
	public String handlePatientDashboard(HttpServletRequest request, UserDAO userDao, ModelMap map) {
                return "student-home";

	}

	@RequestMapping(value = "/tutor/dashboard.htm", method = RequestMethod.GET)
	public String handleDoctorDashboard(HttpServletRequest request, UserDAO userDao, ModelMap map) {
                return "tutor-home";
	}

	@RequestMapping(value = "/user/register.htm", method = RequestMethod.GET)
	public String showCreateForm() {

		return "user-register";
	}

	@RequestMapping(value = "/user/register.htm", method = RequestMethod.POST)
	public String handleCreateForm(HttpServletRequest request, UserDAO userDao, ModelMap map) throws Exception {
            
            try {
                    String username = request.getParameter("username");
                    String password = request.getParameter("password");
                    String name = request.getParameter("name");
            
                    HttpSession session = request.getSession();

                    String role = request.getParameter("role");
                    if (role.equals("student")) {
                        Student s = new Student();
                        s.setUsername(username);
                        s.setPassword(password);
                        s.setName(name);
                        User u = userDao.register(s);
                        return "user-created";
                    } 
                    else if (role.equals("tutor")) {
                        Tutor t = new Tutor();
                        t.setUsername(username);
                        t.setPassword(password);
                        t.setName(name);
                        User u = userDao.register(t);
                        return "user-created";
            }
            } catch (Exception e) {
                    map.addAttribute("errorMessage", "Registration failed!");
                    return "error";
            }
            
            return null;
            
	}

}
