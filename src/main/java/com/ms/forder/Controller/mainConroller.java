package com.ms.forder.Controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ms.forder.Domain.Product;
import com.ms.forder.Domain.Store;
import com.ms.forder.Service.ProductService;
import com.ms.forder.Service.StoreService;
import com.ms.forder.Service.UserService;

@Controller
@RequestMapping("/forder")
public class MainConroller {
	
	@Autowired
	StoreService storeService;
	@Autowired
	UserService userService;
	@Autowired
	ProductService productService;
	
	@GetMapping("")
	public ModelAndView main() {

		ModelAndView model = new ModelAndView("main");
		
		return model;
	}
	
	@GetMapping("/alarm")
	public ModelAndView alarm() {

		ModelAndView model = new ModelAndView("alarm");
		
		return model;
	}
	
	@GetMapping(value="/map", produces="text/plain;charset=UTF-8")
	public ModelAndView map() {

		ModelAndView model = new ModelAndView("map");
		List<Store> list = storeService.stores();
		model.addObject("list", list);
		
		return model;
	}
	
	@GetMapping(value="/store/{sno}")
	public ModelAndView store(@PathVariable int sno) {
		
		ModelAndView model = new ModelAndView("store");
		List<Product> list = productService.storeProduct(sno);
		System.out.println(sno);
		System.out.println(list);
		model.addObject("list", list);
		
		return model;
	}
	
	@GetMapping(value="/purchase")
	public ModelAndView purchase(@RequestBody Map<String, String> map) {
		
		ModelAndView model = new ModelAndView("purchase");
		System.out.println(map);
		
		return model;
	}
	
	@GetMapping("/like")
	public ModelAndView like() {

		ModelAndView model = new ModelAndView("like");
		
		return model;
	}
	
	@GetMapping("/mypage")
	public ModelAndView user(HttpSession session) {

		String name = (String)session.getAttribute("name");
		
		ModelAndView model = new ModelAndView("mypage");
		if(name != null) {
			System.out.println("mypage: " + name);
			model.addObject("session", name);
		}
		
		return model;
	}
	
	//로그인
	@PostMapping("/login")
	public String login(HttpServletRequest request, HttpSession session) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		if(userService.login(id, pw)) {
			session.setAttribute("name", id);
			
			return "mypage";
		}else {
			return "fail";
		}
	}
	
	//카카오 로그인
	@PostMapping("/kakaoLogin")
	public String kakaoLogin(@RequestParam("name") String name, HttpSession session) throws Exception{
		
		System.out.println("kakao user: " + name);
		session.setAttribute("name", name);
		
		return "redirect:/mypage";
	}
	
	//로그아웃
	@PostMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "mypage";
	}
}
