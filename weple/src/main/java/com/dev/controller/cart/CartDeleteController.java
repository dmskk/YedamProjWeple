package com.dev.controller.cart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.controller.Controller;
import com.dev.service.cart.CartService;
import com.dev.service.product.ProductService;

public class CartDeleteController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		
		int prodId = Integer.parseInt(req.getParameter("prodId"));
		String userId = (String) session.getAttribute("userId");
		int isShare = Integer.parseInt(req.getParameter("isShare"));
		int prodAmount = Integer.parseInt(req.getParameter("prodAmount"));
		
		CartService service = CartService.getInstance();
		boolean result = service.deleteFromCart(prodId, userId, isShare);
		
		// 사진으로 삭제 클릭시 공동구매 상품의 prodId들고와서 
		// participate_people을 그 수만큼 삭제하기
		ProductService productService = ProductService.getInstance();
		int nowParticipate = productService.ParticipatePeopleNum(prodId);
		int delParticipate = nowParticipate - prodAmount;
		if(isShare == 1) {
			productService.updateParticipatePeople(delParticipate, prodId);
		}
		resp.getWriter().print(result);
		
	}

}
