<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@page import="dao.UserDao,model.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%

int userId = Integer.parseInt(request.getParameter("id"));

User u = UserDao.getRecordById(userId);

u.setName(request.getParameter("name"));
u.setPassword(request.getParameter("password"));
u.setEmail(request.getParameter("email"));
u.setSex(request.getParameter("sex"));
u.setCountry(request.getParameter("country"));

int i = UserDao.update(u);
if (i > 0) {
    response.sendRedirect("viewusers.jsp");
} else {
    out.println("Failed to update user");
}
%>