package com.dev.controller.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.user.UserService;
import com.dev.vo.Addr;

public class addressChangeController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("addrchange");
		
		HttpSession session = req.getSession();
		UserService service = UserService.getInstance();
		
		
		String addrName = req.getParameter("addrName");
		String userId = (String) session.getAttribute("userId");
		
		System.out.println("addrName: " + addrName);
		System.out.println("userId: " + userId);
		
		// 기존 기본주소지
		List<Addr> curr = service.addressListD(userId);
		System.out.println("curr: " + curr);
		for(Addr ad : curr) {
			// default 값 없애기
			service.outAddress(ad);
		}
		
		// 새로운 기본주소지
		Addr newad = new Addr();
		newad.setAddrName(addrName);
		newad.setUserId(userId);
		System.out.println("newad.addrName: " + newad.getAddrName());
		System.out.println("newad.userId: " + newad.getUserId());
		service.changeAddress(newad);
		
		
		
		Utils.forward(req, resp, "addressUpdateForm.do");		
	}

}
