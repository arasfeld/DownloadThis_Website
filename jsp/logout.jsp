<jsp:useBean id="dbconnection" class="com.DownloadThis.DatabaseBean" scope="session"/>
<jsp:include page="header.jsp"/>

<%
    dbconnection.close();
    session.invalidate();
%>

<div class="page">

  <h2>User logged out successfully.</h2>

  <FORM METHOD="post" ACTION="index.jsp">
  <INPUT TYPE="submit" VALUE="Login">
  </FORM>

<!-- end .page --></div>

<jsp:include page="footer.jsp"/>