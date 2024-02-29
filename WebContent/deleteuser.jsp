<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@page import="dao.UserDao,model.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
int id = Integer.parseInt(request.getParameter("id"));
User u = UserDao.getRecordById(id);
if (u != null) {
    UserDao.delete(u);
}
response.sendRedirect("viewusers.jsp");
%>