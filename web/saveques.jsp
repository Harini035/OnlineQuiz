<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<%! static int counter=0; %>
<%
counter++;
 try {
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinequiz","root","");
String question= request.getParameter("question");
String option1= request.getParameter("option1");
String option2= request.getParameter("option2");
String option3= request.getParameter("option3");
String option4= request.getParameter("option4");
String answer=request.getParameter("answer");
String description=request.getParameter("description");
String qid=request.getParameter("qid");
PreparedStatement ps1=con.prepareStatement("select * from quizinfo where time = (select max(time) from quizinfo)");
ResultSet rs=ps1.executeQuery();
while(rs.next()){
String quizname= rs.getString(1);
//ps1.setString(3, "true");
System.out.print(quizname);

PreparedStatement ps=con.prepareStatement("insert into quizques values(?,?,?,?,?,?,?,?,?)");

ps.setString(1,question);
ps.setString(2,option1);
ps.setString(3,option2);
ps.setString(4,option3);
ps.setString(5,option4);
ps.setString(6,answer);
ps.setString(7,quizname);
ps.setString(8,description);
ps.setString(9,qid);
int s= ps.executeUpdate();

//PreparedStatement ps2=con.prepareStatement("select label from quizques where label IS NULL");
//ResultSet rs1=ps2.executeQuery();





}

}
catch(Exception e){e.printStackTrace();}

%>
<% 
request.setAttribute("counter",counter);

%>
<jsp:forward page="createquiz1.jsp"></jsp:forward>
