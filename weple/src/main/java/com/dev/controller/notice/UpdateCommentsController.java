package com.dev.controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.controller.Controller;
import com.dev.service.notice.NoticeService;

public class UpdateCommentsController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/json;charset=utf-8");
		
		int repleNum = Integer.parseInt(req.getParameter("repleNum"));
		int bno = Integer.parseInt(req.getParameter("bno"));
		
		NoticeService noticeService = NoticeService.getInstance();
		noticeService.updateComments();

	}

}
