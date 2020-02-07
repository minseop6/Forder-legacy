package com.ms.forder.Controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ms.Vo.Purchase;
import com.ms.forder.Domain.Orders;
import com.ms.forder.Domain.Product;
import com.ms.forder.Domain.Store;
import com.ms.forder.Domain.User;
import com.ms.forder.Service.OrdersServices;
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
	@Autowired
	OrdersServices ordersService;
	
	@GetMapping("")
	public ModelAndView main() {

		ModelAndView model = new ModelAndView("main");
		
		return model;
	}
	
	@GetMapping("/alarm")
	public ModelAndView alarm(HttpSession session) {

		ModelAndView model = new ModelAndView();
		if(session.getAttribute("id") != null) {
			model.setViewName("alarm");
			int uno = (int) session.getAttribute("uno");
			List<Orders> list = ordersService.userOrders(uno);
//			for(int i=0; i<list.size(); i++) {
//				
//			}
			model.addObject("list", list);
		}else {
			model.setViewName("nologin");
		}
		
		
		return model;
	}
	
	@GetMapping(value="/map", produces="text/plain;charset=UTF-8")
	public ModelAndView map(HttpSession session) {

		ModelAndView model = new ModelAndView();
		if(session.getAttribute("id") != null) {
			model.setViewName("map");
			List<Store> list = storeService.stores();
			model.addObject("list", list);
			
		}else {
			model.setViewName("nologin");
		}
		
		return model;
	}
	
	@GetMapping(value="/store/{sno}")
	public ModelAndView store(@PathVariable int sno, HttpSession session) {
		
		ModelAndView model = new ModelAndView();
		if(session.getAttribute("id") != null) {
			model.setViewName("store");
			List<Product> list = productService.storeProduct(sno);
			model.addObject("list", list);
			
		}else {
			model.setViewName("nologin");
		}
		
		return model;
	}
	
	@GetMapping("/purchase")
	public ModelAndView purchase(@ModelAttribute Purchase purchase, HttpSession session) throws Exception {

		ModelAndView model = new ModelAndView();
		if(session.getAttribute("id") != null) {
			model.setViewName("purchase");
			List<Product> productList = new ArrayList<Product>();
			
			for(int i=0; i<purchase.getPurchase().size(); i++) {
				if(purchase.getPurchase().get(i).getAmount() != 0) {
					Product product = productService.product(purchase.getPurchase().get(i).getProduct().getPno()); //임시
					productList.add(product); //임시
				}
			}
			model.addObject("productList", productList);
			model.addObject("purchase", purchase.getPurchase());
			
		}else {
			model.setViewName("nologin");
		}
		
		return model;
	}
	
	
	
	
	@PostMapping("/purchase")
	public String purchase(@RequestParam("pno") Integer[] pnos, 
			@RequestParam("amount") Integer[] amounts, HttpSession session) throws Exception {

		for(int i=0; i<pnos.length; i++) {
			Orders info = new Orders();
			//info.setPno(pnos[i]); 임시
			info.setAmount(amounts[i]);
			info.setUno((int)session.getAttribute("uno"));
			ordersService.insertOrders(info);
		}
		
		return "redirect:/forder";
	}
	
	@GetMapping("/like")
	public ModelAndView like(HttpSession session) {

		ModelAndView model = new ModelAndView();
		if(session.getAttribute("id") != null) {
			model.setViewName("like");
			
		}else {
			model.setViewName("nologin");
		}
		
		return model;
	}
	
	@GetMapping("/mypage")
	public ModelAndView mypage(HttpSession session) {

		String name = (String)session.getAttribute("name");
		
		ModelAndView model = new ModelAndView("mypage");
		if(name != null) {
			System.out.println("mypage: " + name);
			model.addObject("session", name);
		}
		
		return model;
	}
	
	@GetMapping("/signup")
	public ModelAndView signup() {

		ModelAndView model = new ModelAndView("signup");
		
		return model;
	}
	
	@GetMapping("/kakaoSignup")
	public ModelAndView kakaoSignup(@RequestParam("id") String id, 
			@RequestParam("pw") String pw) {

		ModelAndView model = new ModelAndView("kakaoSignup");
		User info = new User();
		info.setId(id);
		info.setPw(pw);
		model.addObject("info", info);
		
		return model;
	}
	
	@PostMapping("/signup")
	public String signup(User user) {
		
		userService.signup(user);
		
		return "redirect:/forder";
	}
	
	//로그인
	@PostMapping("/login")
	public String login(HttpServletRequest request, HttpSession session) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		if(userService.login(id, pw)) {
			session.setAttribute("id", id);
			
			return "mypage";
		}else {
			return "fail";
		}
	}
	
	//카카오 로그인
	@PostMapping("/kakaoLogin")
	@ResponseBody
	public String kakaoLogin(@RequestParam("name") String name, @RequestParam("id") String id, 
			HttpSession session) throws Exception{
		String result = null;
		
		List<User> list = userService.allUser();
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getId().equals(id)) {
				System.out.println("kakao user: " + id);
				session.setAttribute("id", id);
				session.setAttribute("uno", list.get(i).getUno());
				result = "success";
			}else {
				result = "fail";
			}
		}
		return result;
	}
	
	//로그아웃
	@PostMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "mypage";
	}
}
