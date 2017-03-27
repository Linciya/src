package org.chatbot.util;

import javax.servlet.http.HttpServlet;

public class ReloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void init() {
		ChatbotQueryList.loadParameters();
		
	}

}
