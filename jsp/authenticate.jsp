<jsp:useBean id="dbconnection" class="com.DownloadThis.DatabaseBean" scope="session"/>
<jsp:useBean id="login" class="com.DownloadThis.Login" scope="session"/>
<jsp:setProperty name="login" property="*"/>

<%
    if (login.verifyUser(dbconnection.getConnection())) {
	if(login.isAdmin(dbconnection.getConnection())) {
	    session.setAttribute( "admin", login.getUsername());
	}
	else {
	    session.setAttribute( "user", login.getUsername());
	}
	response.sendRedirect("list.jsp");
    }
    else {
	session.setAttribute( "status", "Username or password incorrect, please try again.");
	response.sendRedirect("index.jsp");
    }
%>
