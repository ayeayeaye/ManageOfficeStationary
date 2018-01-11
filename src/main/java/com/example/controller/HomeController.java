package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.Employee;
import com.example.model.User;
import com.example.service.UserService;


@Controller
public class HomeController {
	
	@Autowired
	UserService uService;

	@RequestMapping(value = {"/","/home"}, method = RequestMethod.GET)
	public ModelAndView home( )
	{		
		return new ModelAndView("home", "user", new User());
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute("user") User user, BindingResult result, HttpSession session )
	{		
		List<User> userList = uService.findAllUser();
		User validLoginUser =  new User();
		String msg ="";
		
		if(user.getUserName() != null && user.getPassword() != null)
		{
			try
			{		
			
				for (User auser : userList) 
				{	
					if( user.getUserName().equals(auser.getUserName()) && user.getPassword().equals(auser.getPassword()) )
					{
						validLoginUser = auser;
					}
				}	
						
					if(validLoginUser.getuEmpModel().getDepartment().equals("STOR"))
					{
						msg = "redirect:/store/dashboard";
					}
					else
					{
						if(validLoginUser.getuEmpModel().getDesignation().equals("manager"))
						{
							msg = "redirect:/manager/dashboard";
						}
						else
						{
							msg = "redirect:/staff/dashboard";
						}
					}	
			}
			catch (NullPointerException e) {
				msg = "redirect:/home";
			}
		}
		else
		{
			msg = "redirect:/home";
		}
					

			
			UserSession userSession = new UserSession();
			userSession.setSessionId(session.getId());
			userSession.setUser(validLoginUser);
			
			session.setAttribute("USERSESSION", userSession);
			
			return msg;
	}
	
	@RequestMapping(value="/logout")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:/home";
		
	}
	
}
