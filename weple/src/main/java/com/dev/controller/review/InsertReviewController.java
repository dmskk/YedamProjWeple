package com.dev.controller.review;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.review.ReviewService;
import com.dev.vo.ReviewInfo;

public class InsertReviewController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ReviewService service = ReviewService.getInstance();
		
		HttpSession session = req.getSession();
		
		//String writer = (String) session.getAttribute("userId");	
		String writer = "cccc";
		String boardContent = req.getParameter("boardContent");
		//int bno = Integer.parseInt(req.getParameter("bno")); 
		//int prodId = Integer.parseInt(req.getParameter("prodId"));
		int prodId = 10018;
//		int bno = 10200;
		int rating = Integer.parseInt(req.getParameter("rating"));
		
		ReviewInfo rvo = new ReviewInfo();
		
		rvo.setWriter(writer);
		rvo.setBoardContent(boardContent);
		rvo.setProdId(prodId);
//		rvo.setBno(bno);
		rvo.setRating(rating);	
		
		System.out.println(rating);
//		System.out.println(bno);
		
		
		service.addReivew(rvo);
//		service.countStar(rvo);
		
		req.setAttribute("insertList", rvo);

		Utils.forward(req, resp, "reviewBoard/insertResult.jsp");	
	}
}
