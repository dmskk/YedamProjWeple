package com.dev.controller.cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.controller.Controller;
import com.dev.service.cart.CartService;

public class CartDeleteAllController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		HttpSession session = req.getSession();
		
		String userId = (String) session.getAttribute("userId");
		
		CartService cartService = CartService.getInstance();
		
		boolean result = cartService.deleteAllCart(userId);
		
		System.out.println(result);
		
		resp.getWriter().print(result);
	}

}
