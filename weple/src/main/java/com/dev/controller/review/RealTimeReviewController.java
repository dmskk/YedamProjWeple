package com.dev.controller.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dev.common.Utils;
import com.dev.controller.Controller;
import com.dev.service.review.ReviewService;
import com.dev.vo.ProdReview;

public class RealTimeReviewController implements Controller {
	// 실시간 리뷰
	// 별점이 높으면서 최신순으로 정렬
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		ReviewService service = ReviewService.getInstance();
		
		List<ProdReview> list = service.realTimeReviewList();
		
		if(session.getAttribute("realTimeReviewList") != null) {
			session.removeAttribute("realTimeReviewList");
			session.setAttribute("realTimeReviewList", list);
		} else {
			session.setAttribute("realTimeReviewList", list);
		}
		
		Utils.forward(req, resp, "main/realTimeReviewList.tiles");
	}

}
