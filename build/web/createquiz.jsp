<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<% try {
String subject= request.getParameter("subject");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinequiz","root","");
PreparedStatement ps=con.prepareStatement("insert into quizinfo(subject, quizname) values('"+subject+"', '"+subject+"') " );

int s= ps.executeUpdate();
PreparedStatement pstmt = con.prepareStatement("insert into quizinfo(time) values(?)");
pstmt.setTimestamp(3, new java.sql.Timestamp(new java.util.Date().getTime()));
pstmt.executeUpdate();

 }
catch(Exception e){e.printStackTrace();}
%> 

<jsp:forward page="createquiz1.jsp"></jsp:forward>
