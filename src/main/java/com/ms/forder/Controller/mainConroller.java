package com.ms.forder.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ms.forder.Domain.Store;
import com.ms.forder.Service.StoreService;

@Controller
@RequestMapping("/forder")
public class MainConroller {
	
	@Autowired
	StoreService storeService;
	
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
	
	@PostMapping("/kakaoLogin")
	public String kakaoLogin(@RequestParam("name") String name, HttpSession session) throws Exception{
		
		System.out.println("kakao user: " + name);
		session.setAttribute("name", name);
		
		return null;
	}
}
