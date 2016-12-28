<%@ page contentType="text/plain; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
out.clear();
out.flush();
%>
=============================================================
RefererURL : <%= request.getHeader("referer") %>
RequestURL : <%= request.getRequestURL() %>
RequestURI : <%= request.getRequestURI() %>
RemoteAddr : <%= request.getRemoteAddr() %>
LocalAddr  : <%= request.getLocalAddr() %>
=============================================================
<%

	System.out.println("REQUEST: " + request.getMethod() + ", URL: " + request.getRequestURL());
	Enumeration params = request.getParameterNames();
	
	System.out.println("----- vvv START KEY: VALUE vvv -----");
	while (params.hasMoreElements()) {
		
		String name = (String) params.nextElement();
		String value = (String) request.getParameter(name);
		out.println(name + ": " + value);
		
		System.out.println(name + ": " + value);
	}
	
	System.out.println("----- ^^^ END KEY: VALUE ^^^ -----");
%>
