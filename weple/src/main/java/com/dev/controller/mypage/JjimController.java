package com.dev.controller.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.product.ProductService;
import com.dev.vo.Product;

public class JjimController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		ProductService service = ProductService.getInstance();
		
		String userId = (String) session.getAttribute("userId");
		
		List<Product> myjjimProd = service.getMyJjimProd(userId);
		
		if(session.getAttribute("myjjimProd") != null) {
			session.removeAttribute("myjjimProd");
			session.setAttribute("myjjimProd", myjjimProd);
		} else {
			session.setAttribute("myjjimProd", myjjimProd);
		}
		
		
		Utils.forward(req, resp, "user/jjim.tiles");
	}

}
