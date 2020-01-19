package com.ms.forder.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/forder")
public class mainConroller {
	
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
	
	@GetMapping("/map")
	public ModelAndView map() {

		ModelAndView model = new ModelAndView("map");
		
		return model;
	}
	
	@GetMapping("/like")
	public ModelAndView like() {

		ModelAndView model = new ModelAndView("like");
		
		return model;
	}
	
	@GetMapping("/user")
	public ModelAndView user() {

		ModelAndView model = new ModelAndView("user");
		
		return model;
	}
}
