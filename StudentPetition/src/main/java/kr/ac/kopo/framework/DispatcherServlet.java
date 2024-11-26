package kr.ac.kopo.framework;

import java.io.IOException;

import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.ac.kopo.controller.Controller;

/*
 * 
 * 기능				uri						controller
 * 
 * 
 * 
 * 
 */

public class DispatcherServlet extends HttpServlet {

	private HandlerMapping mappings;

	@Override
	public void init(ServletConfig config) throws ServletException {
		String propName = config.getInitParameter("propName");
		mappings = new HandlerMapping(propName);
	}

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String contextPath = request.getContextPath();

		String uri = request.getRequestURI().substring(contextPath.length());
		System.out.println("요청 uri : " + uri);
		System.out.println("contextPath : " + contextPath);

		try {
			Controller control = mappings.getController(uri);

			String callPage = control.handleRequest(request, response);
			if(callPage.startsWith("redirect:")) {
				callPage = callPage.substring("redirect:".length());
				response.sendRedirect(request.getContextPath() + callPage);
			} else {
				request.getRequestDispatcher(callPage).forward(request, response);				
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException();
		}

	}

}
