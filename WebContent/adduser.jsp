<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="dao.UserDao,model.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%

String name = request.getParameter("name");
String password = request.getParameter("password");
String email = request.getParameter("email");
String sex = request.getParameter("sex");
String country = request.getParameter("country");

User u = new User();
u.setName(name);
u.setPassword(password);
u.setEmail(email);
u.setSex(sex);
u.setCountry(country);

int i = UserDao.save(u);

if(i > 0) {
    response.sendRedirect("adduser-success.jsp");
} else {
    response.sendRedirect("adduser-error.jsp");
}
%>