package jspboard.service;

import javax.servlet.http.HttpServletRequest;

public class MainService implements Service {

	@Override
	public String process(HttpServletRequest request) {
		return "main";
	}
}
