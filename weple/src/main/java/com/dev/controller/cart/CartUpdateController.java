package com.dev.controller.cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.controller.Controller;
import com.dev.service.cart.CartService;
import com.dev.service.product.ProductService;

public class CartUpdateController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		HttpSession session = req.getSession();
		
		int prodId = Integer.parseInt(req.getParameter("prodId"));
		int prodAmount = Integer.parseInt(req.getParameter("prodAmount"));
		int isShare = Integer.parseInt(req.getParameter("isShare"));
		String userId = (String) session.getAttribute("userId");
		System.out.println("" + prodId + prodAmount + isShare + userId);
		
		CartService cartService = CartService.getInstance();
		
		boolean result = cartService.updateCart(prodId, prodAmount, userId, isShare);
		
		System.out.println(result);
		
		// 공동구매일 경우 그 수량만큼 participate_people 업데이트
		if (isShare == 1) {
			ProductService productService = ProductService.getInstance();
			int nowParticipate = productService.ParticipatePeopleNum(prodId);
			int upParticipate = nowParticipate + prodAmount;
			
			productService.updateParticipatePeople(upParticipate, prodId);
			}
		resp.getWriter().print(result);
	
	}

}
