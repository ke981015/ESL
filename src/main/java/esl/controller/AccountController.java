package esl.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import esl.dao.UserDAO;
import esl.pojo.User;

@Controller
public class AccountController {

	@RequestMapping(value="/account.htm", method = RequestMethod.GET)
	public String showAccountInfo(HttpServletRequest request, ModelMap map) {
            return "account-password";
	}
	
	@RequestMapping(value="/account.htm", method = RequestMethod.POST)
	public String SaveAccountChange(HttpServletRequest request, UserDAO userDao, ModelMap map) throws Exception {
            HttpSession session = request.getSession();
            User currentUser = (User)session.getAttribute("user");
            String action = request.getParameter("action");
            int accountid = currentUser.getAccountid();

            if(action.equals("modify-password")) {
                    String oldPw = request.getParameter("oldPw");
                    String newPw = request.getParameter("newPw");
                    String rePw = request.getParameter("rePw");
                    if(currentUser.getPassword().equals(oldPw) && newPw.equals(rePw)) {
                            userDao.updateUserPw(accountid+"", newPw);
                            map.addAttribute("status", "changePwSuccess");
                    }
                    else if(!currentUser.getPassword().equals(oldPw))
                            map.addAttribute("status", "wrongPw");
                    else if(!newPw.equals(rePw))
                            map.addAttribute("status", "changePwFail");
            }
            return "account-result";
	}
}
