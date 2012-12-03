<jsp:include page="header.jsp"/>

<script language="JavaScript" type="text/javascript">
<!--
function checkform ( form )
{
  if (form.username.value == "") {
    alert( "Please enter your username." );
    form.username.focus();
    return false ;
  }

  if (form.password.value == "") {
    alert( "Please enter your password." );
    form.password.focus();
    return false ;
  }
  return true ;
}
//-->
</script>

<div class="page">
  <div class="sidebar">
  <a class="twitter-timeline" href="https://twitter.com/DownloadThisMU" data-widget-id="266002230497378304">Tweets by @DownloadThisMU</a>
  <script>
	!function(d,s,id){
		var js,fjs=d.getElementsByTagName(s)[0];
		if(!d.getElementById(id)){
			js=d.createElement(s);
			js.id=id;
			js.src="//platform.twitter.com/widgets.js";
			fjs.parentNode.insertBefore(js,fjs);
		}
	}
	(document,"script","twitter-wjs");
  </script>
  <!-- end .sidebar --></div>
  <tr>
    <td><br/>
        <br/>
        <br/>
	 <% 
	 	if (session.getAttribute("status") != null)
		out.print("<p id='status'>" + session.getAttribute("status") + "</p>");
	 %>
	 <form method=post action="authenticate.jsp" onsubmit="return checkform(this);">
          Username: <input type="text" name="username"/><br/>
          Password: <input type="password" name="password"/><br/>
        <input type="submit" value="Login"/>
        <p>
        Don't have an account?
    <a href="register.jsp">Register Here!</a>
   	 </p>
        </form>
    </td>
  </tr>
<!-- end .page --></div>

<jsp:include page="footer.jsp"/>