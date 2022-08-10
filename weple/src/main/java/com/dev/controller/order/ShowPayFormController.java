package com.dev.controller.order;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dev.common.Utils;
import com.dev.controller.Controller;

public class ShowPayFormController implements Controller {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Utils.forward(req, resp, "user/payForm.tiles"); //커밋돼라
	}

}
