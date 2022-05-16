package esl.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import esl.dao.UserDAO;
import esl.pojo.User;

@Controller
public class AjaxController {

	@RequestMapping(value = "/checkUserExistence.htm", method = RequestMethod.POST)
	@ResponseBody
	public String checkUserNameExisted(HttpServletRequest request, UserDAO userDao) {
		String username = request.getParameter("username");
		User existUser = userDao.get(username);
		if (existUser == null) {
			return "You can use this username!";
		} else {
			return "Username has already been used!";
		}
	}

}
