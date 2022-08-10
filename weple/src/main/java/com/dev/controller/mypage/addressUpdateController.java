package com.dev.controller.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.user.UserService;
import com.dev.vo.Addr;

public class addressUpdateController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
	
		UserService service = UserService.getInstance();
		
		String id = (String) session.getAttribute("userId");
		String pst = req.getParameter("post");
		String ard1 = req.getParameter("address1");
		String ard2 = req.getParameter("address2");
		String ard3 = req.getParameter("address3");
		
		Addr vo = new Addr();
		vo.setUserId(id);
		vo.setZipCode(Integer.parseInt(pst));
		vo.setAddr(ard1);
		vo.setAddr2(ard3);
		vo.setAddrDetail(ard2);
		
		service.modifyAddress(vo);
		
		
		req.setAttribute("user", vo);
		
		
		Utils.forward(req, resp, "mypage.do");
	}

}
