package com.dev.controller.cart;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.controller.Controller;
import com.dev.service.buy.BuyService;
import com.dev.service.cart.CartService;
import com.dev.service.product.ProductService;
import com.dev.vo.Cart;

public class CartDeleteAllController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		HttpSession session = req.getSession();
		
		String userId = (String) session.getAttribute("userId");
		CartService cartService = CartService.getInstance();
		
		// 장바구니 삭제 클릭시 공동구매 상품의 prodId들고와서 
		// participate_people을 그 수만큼 삭제하기
		int buyAmount = 0;
		int delParticipate = 0;
		int nowParticipate = 0;
		int prodId = 0;
		
		BuyService buyService = BuyService.getInstance();
		ProductService productService = ProductService.getInstance();
		
		List<Cart> cartList = buyService.showCart(userId);
		for(int i = 0; i < cartList.size(); i++) {
			if(cartList.get(i).getIsShare() == 1) {
				buyAmount = cartList.get(i).getBuyAmount();
				prodId = cartList.get(i).getProdId();
				nowParticipate = productService.ParticipatePeopleNum(prodId);
				delParticipate = nowParticipate - buyAmount;
				productService.updateParticipatePeople(delParticipate, prodId);
			}
		}
		// 장바구니 삭제
		boolean result = cartService.deleteAllCart(userId);
		System.out.println(result);
		
	
		
		resp.getWriter().print(result);
	}

}
