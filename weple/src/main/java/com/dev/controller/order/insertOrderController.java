package com.dev.controller.order;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.addr.AddrService;
import com.dev.service.buy.BuyService;
import com.dev.service.order.OrderService;
import com.dev.vo.Addr;
import com.dev.vo.Buy;
import com.dev.vo.Cart;
import com.dev.vo.Order;

public class insertOrderController implements Controller {


	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 서비스 선언
		OrderService orderService = OrderService.getInstance();
		AddrService addrService = AddrService.getInstance();
		BuyService buyService = BuyService.getInstance();
	
		// 세션에서 userId 받아오기
		HttpSession session = req.getSession();
		String userId = (String) session.getAttribute("userId");
		
		
		@SuppressWarnings("unchecked")
		List<Cart> cartList = (List<Cart>) session.getAttribute("cartList");
		
		int prodId;
		String prodName;
		int isShare;
		int prodAmount;
		int totalPrice;
		int orderPrice = 0;
		
		// orderService에서 주문번호(sequence)가장 높은거 select해오기
		// 아직 주문 하고 새로운 orderNum이 들어오지 않았으므로 +1하자
		Order order = orderService.selectNewOrder();
		int orderNum = order.getOrderNum();
		
		System.out.println(orderNum);
		
		// for문돌면서 안의 상품정보를 업데이트하기
		// totalPrice로 orderPrice계산하기
		for(int i = 0; i < cartList.size(); i++) {
			totalPrice = cartList.get(i).getTotalPrice();
			
			Buy buyProd = new Buy();
			buyProd.setUserId(userId);
			buyProd.setProdId(cartList.get(i).getProdId());
			buyProd.setOrderNum(orderNum+1);
			
			buyService.updateOrderComplete(buyProd);
			
			orderPrice += totalPrice;
		}
		
		for(Cart cart : cartList) {
			System.out.println(cart);
		}
		
		// 주문내역 목록 orders테이블에 넣기
		// userId, orderNum(시퀀스), orderPrice, orderInfo, orderDate
		String orderInfo = req.getParameter("orderInfo");

		Date date = new Date();
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		String nowDate = dateFormat.format(date);

		Order order1 = new Order();
		
		order1.setUserId(userId);
		order1.setOrderDate(nowDate);
		order1.setOrderInfo(orderInfo);
		order1.setOrderPrice(orderPrice);

		orderService.insertIntoOrders(order1);

		
		Utils.forward(req, resp, "user/orderComplete.tiles");
	}
}
	
	
