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
import com.dev.vo.Criteria;
import com.dev.vo.Page;
import com.dev.vo.Product;
import com.dev.vo.ReviewInfo;

public class JjimController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Criteria cri = new Criteria();
		ProductService service = ProductService.getInstance();
	
		String userId = (String) session.getAttribute("userId");
		String pageNum = req.getParameter("pageNum");
		String amount = req.getParameter("amount");
		
		cri.setPageNum(Integer.parseInt(pageNum));
		cri.setAmount(Integer.parseInt(amount));
		
		List<Product> jjimList = service.jjimListPaging(cri, userId);
		
		if(session.getAttribute("myjjimProd") != null) {
			session.removeAttribute("myjjimProd");
			session.setAttribute("myjjimProd", jjimList);
		} else {
			session.setAttribute("myjjimProd", jjimList);
		}
		
		List<Product> myjjimProd = service.getMyJjimProd(userId);
		
		int total = myjjimProd.size();
		
		req.setAttribute("pageInfo", new Page(cri, total));
		
		Utils.forward(req, resp, "user/jjim.tiles");
	}

}
