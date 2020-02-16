package com.ms.forder.Controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ms.forder.Domain.Orders;
import com.ms.forder.Domain.Product;
import com.ms.forder.Domain.Store;
import com.ms.forder.Domain.User;
import com.ms.forder.Service.OrdersServices;
import com.ms.forder.Service.ProductService;
import com.ms.forder.Service.StoreService;
import com.ms.forder.Service.UserService;

@Controller
@RequestMapping("/forder/seller")
public class SellerController {

	@Autowired
	StoreService storeService;
	@Autowired
	UserService userService;
	@Autowired
	ProductService productService;
	@Autowired
	OrdersServices ordersService;
	
	@GetMapping("")
	public ModelAndView main(HttpSession session) {
		
		ModelAndView model = new ModelAndView();
		if(session.getAttribute("id") != null) {
			model.setViewName("seller/main");
		}else {
			model.setViewName("nologin");
		}
		
		return model; 
	}
	
	@GetMapping("/menu")
	public ModelAndView menu(HttpSession session) {
		
		ModelAndView model = new ModelAndView();
		if(session.getAttribute("id") != null) {
			model.setViewName("seller/menu");
		}else {
			model.setViewName("nologin");
		}
		
		return model; 
	}
	
	@PostMapping("/menu")
	public String menu(HttpSession session, HttpServletRequest request,
			@RequestParam MultipartFile image) throws IOException {
		
		Store store = storeService.storeInfoByUno((int)session.getAttribute("uno"));
		
		//이미지 처리
		System.out.println("save : " + image.getOriginalFilename());
		UUID uid = UUID.randomUUID(); //중복 방지하기 위해 임의로 이름 생성
		String savedName = uid.toString() + "_" + image.getOriginalFilename();
		File target = new File("src/main/resources/static/img/product/", savedName);
		FileCopyUtils.copy(image.getBytes(), target); //업로드 디렉토리에 저장
		
		Product product = new Product();
		product.setPname(request.getParameter("pname"));
		product.setPrice(Integer.parseInt(request.getParameter("price")));
		product.setImage(savedName);
		product.setSno(store.getSno());
		product.setStack(0);
		product.setStatus(1);

		productService.addProduct(product);
		
		return "redirect:/forder/seller/";
	}
	
	@GetMapping("/store")
	public ModelAndView store(HttpSession session) {
		
		ModelAndView model = new ModelAndView();
		if(session.getAttribute("id") != null) {
			model.setViewName("seller/store");
			
			Store store = storeService.storeInfoByUno((int)session.getAttribute("uno"));
			List<Product> productList = productService.storeAllProduct(store.getSno());
			
			model.addObject("store", store);
			model.addObject("productList", productList);
		}else {
			model.setViewName("nologin");
		}
		
		return model; 
	}
	
	@PutMapping("/store")
	public String store(Store store, HttpServletRequest request) {
		
		String status = request.getParameter("storeStatus");
		if(status != null) {
			store.setStatus(1);
		}else {
			store.setStatus(0);
		}
		
		storeService.storeUpdate(store);
		
		return "redirect:/forder/seller/";
	}
	
	@PutMapping("/product")
	public String store(@RequestParam("pno") Integer[] pno, 
			@RequestParam("pname") String[] pname,
			@RequestParam("price") Integer[] price,
			HttpServletRequest request) {
		
		for(int i=0; i<pno.length; i++) {
			Product product = new Product();
			product.setPno(pno[i]);
			product.setPname(pname[i]);
			product.setPrice(price[i]);
			String status = request.getParameter(pno[i].toString());
			if(status != null) {
				product.setStatus(1);
			}else {
				product.setStatus(0);
			}
			productService.addProduct(product);
		}
		
		return "redirect:/forder/seller/";
	}
	
	@GetMapping("/order")
	public ModelAndView order(HttpSession session) {
		
		ModelAndView model = new ModelAndView();
		if(session.getAttribute("id") != null) {
			model.setViewName("seller/order");
			
			List<Orders> ordersList = ordersService.storeOrders(1);
			List<User> userList = new ArrayList<User>();
			for(int i=0; i<ordersList.size(); i++) {
				User user = userService.user(ordersList.get(i).getUno());
				userList.add(user);
			}
			
			model.addObject("ordersList", ordersList);
			model.addObject("userList", userList);
			
		}else {
			model.setViewName("nologin");
		}
		
		return model; 
	}
}
