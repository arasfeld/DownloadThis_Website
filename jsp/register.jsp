<jsp:include page="header.jsp"/>

<div class="page">
  <h2>Register an Account</h2>
    
  <form method=post action="adduser.jsp">
  <table>
  <tr>
    <th><label for="username">Username:</label></th>
    <td><input type="text" name="username"/></td>
  </tr>
  <tr>
    <th><label for="password">Password:</label></th>
    <td><input type="password" name="password"/></td>
  </tr>
  <tr>
    <th><label for="email">Email:</label></th>
    <td><input type="text" name="email"/></td>
  </tr>
  <tr>
    <th colspan="2"><input type="submit" class="floatright" value="Register"/></th>
  </tr>
  </table>
  </form>

<FORM METHOD="post" ACTION="index.jsp">
<INPUT TYPE="submit" VALUE="Cancel Registration">
</FORM>

<!-- end .page --></div>

<jsp:include page="footer.jsp"/>
