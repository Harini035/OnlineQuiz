<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>


<%
String n=request.getParameter("val");
session.setAttribute("quizname",n);
if(n.length()>0){
out.print("<br><font style='color:navy'><B>Quiz"+n+" containns 10 Question<br><br>Each question is of 1 point</B><br><br></font>");
out.print("<input type='submit' value='Start Quiz' />");

}
//end of if
%>