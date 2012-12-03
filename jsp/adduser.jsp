<%@page language="java" contentType="text/html"%>
<%@page import="java.sql.*"%>
<jsp:useBean id="dbconnection" class="com.DownloadThis.DatabaseBean" scope="session"/>

<%
    try {
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String email=request.getParameter("email");
	Class.forName("com.mysql.jdbc.Driver");
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cse201b-f12", "cse201b-f12", "ncFJtwzwZ6PCGHJp"); 
	String sql = "insert into downloadthis_users (username, password, email, isAdmin) values ('"+username+"','"+password+"','"+email+"',false)";
	Statement st = connection.createStatement();
	st.executeUpdate(sql);
	st.close();
    } catch(Exception e){
	System.out.println("Exception is ;"+e);
    }
%>

<h2>User successfully registered</h2>

<FORM METHOD="post" ACTION="index.jsp">
<INPUT TYPE="submit" VALUE="Back to login page">
</FORM>