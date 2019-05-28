package com.weiyi.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.weiyi.service.UserService;
import com.weiyi.model.User;;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping("/getAllUser")
	public String getAllUser(HttpServletRequest request, Model model) {
		List<User> user = userService.findAll();
		model.addAttribute("userList", user);
		request.setAttribute("userList", user);
		return "/allUser";
	}

	@RequestMapping("/toAddUser")
	public String toAddUser() {
		return "/addUser";
	}

	@RequestMapping("/addUser")
	public String addUser(User user, Model model) {
		userService.save(user);
		return "redirect:/user/getAllUser";
	}

	@RequestMapping("/updateUser")
	public String updateUser(User user, HttpServletRequest request, Model model) {
		/*userService.update(user)) {
			user = userService.findById(user.getId());
			request.setAttribute("user", user);
			model.addAttribute("user", user);
			return "redirect:/user/getAlluser";
		} else {
			return "/error";
		}*/
		userService.update(user);
		return "redirect:/user/getAllUser";
	}

	@RequestMapping("/getUser")
	public String getUser(int id, HttpServletRequest request, Model model) {
		request.setAttribute("user", userService.findById(id));
		model.addAttribute("user", userService.findById(id));
		return "/editUser";
	}

	@RequestMapping("/delUser")
	public String delUser(int id, HttpServletRequest request, HttpServletResponse response) {
		/*
		 * String result = "{\"result\":\"error\"}"; if (userService.delete(id)) {
		 * result = "{\"result\":\"success\"}"; }
		 * response.setContentType("application/json"); try { PrintWriter out =
		 * response.getWriter(); out.write(result); } catch (IOException e) {
		 * e.printStackTrace(); }
		 */
		userService.delete(id);
		return "redirect:/user/getAllUser";
	}
}
