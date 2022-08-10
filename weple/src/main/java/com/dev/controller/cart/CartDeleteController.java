package com.dev.controller.cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.controller.Controller;
import com.dev.service.cart.CartService;

public class CartDeleteController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		int prodId = Integer.parseInt(req.getParameter("prodId"));
		String userId = (String) session.getAttribute("userId");
		
		CartService service = CartService.getInstance();
		boolean result = service.deleteFromCart(prodId, userId);
		
		resp.getWriter().print(result);
		
	}

}
