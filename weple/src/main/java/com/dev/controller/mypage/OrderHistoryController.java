package com.dev.controller.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.order.OrderService;
import com.dev.vo.Order;

public class OrderHistoryController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// order테이블에 userId로 정보 조회
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("userId");
		
		OrderService orderService = OrderService.getInstance();
		List<Order> orderList = orderService.showOrderList(userId);
		// orderHistoryMain으로 넘겨준다.
		
		req.setAttribute("orderList", orderList);
		Utils.forward(req, resp, "user/orderHisMain.tiles");
	}

}
