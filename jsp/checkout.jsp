<jsp:include page="header.jsp"/>
<%
	if (session.getAttribute("user") == null && session.getAttribute("admin") == null) {
		session.setAttribute( "status", "Invalid session, please login again.");
		response.sendRedirect("index.jsp");
	}
%>

<div class="navbar">
  <ul class="nav">
    <li><a href="list.jsp">Home</a></li>
    <li><a href="search.jsp">Search</a></li>
    <li><a href="cart.jsp">Shopping Cart</a></li>
    <li><a href="logout.jsp">Logout</a></li>
  </ul>
<!-- end .navbar --></div>

<div class="content">
  <h2>Process Payment</h2>
  <form method="post" action="confirmation.jsp" onsubmit="return checkform(this);">
  <table>	
    <tr>
	<td>Name:</td>
	<%
	if (session.getAttribute("user") != null) {
	%>
		<td><%=session.getAttribute("user")%></td>
	<%
	} else if (session.getAttribute("admin") != null) {
	%>
		<td><%=session.getAttribute("admin")%></td>
	<%
	}
	%>
    </tr>
    <tr>
	<td>Total:</td>
<%
	if(session.getAttribute("total") == null) {
%>
	  <td>$0.00</td>
<%
	} else {
%>
	  <td>$<%= session.getAttribute("total")%></td>
<%
	}
%>
    </tr>
    <tr>
	<td>Payment type:</td>	
	<td>
	  <select name="payment">
	    <option value="visa">Visa</option>
	    <option value="mastercard">MasterCard</option>
	    <option value="amex">American Express</option>
	    <option value="discover">Discover</option>
	  </select>
	</td>
    <tr>
	<td>Credit Card number:</td>
	<td><input type="text" name="cardnum" maxlength="16"/></td>
    </tr>
    <tr>
	<td>Expiration date:</td>
	<td><input type="text" name="cardexpr" maxlength="5"/></td>
    </tr>
    <tr>
	<td>Shipping address:</td>
	<td><textarea name ="ship" rows="5" cols="30"></textarea></td>
    </tr>
    <tr>
	<td><a href=list.jsp>Cancel Order</a></td>
 	<td colspan="2"><input type="submit" value="Submit Order"/></td>
    </tr>	
  </table>

<!-- end .content --></div>

<script language="JavaScript" type="text/javascript">
<!--
function checkform(form) {
  if (form.cardnum.value == 0) {
    alert("Please enter credit card number.");
    form.cardnum.focus();
    return false;
  }

  if (isNaN(form.cardnum.value)) {
    alert("Credit card must be a number.");
    form.cardnum.focus();
    return false;
  }

  if (form.cardnum.value > 9999999999999999 || form.cardnum.value < 1000000000000000) {
    alert("Credit card number must be 16 digits.");
    form.cardnum.focus();
    return false;
  }

  if (form.cardexpr.value == "" || form.cardexpr.value == null) {
    alert("Please enter credit card expiration date.");
    form.cardexpr.focus();
    return false;
  }

  if (form.ship.value == "" || form.ship.value == null) {
    alert("Please enter shipping address.");
    form.ship.focus();
    return false;
  }
  return true;
}
//-->
</script>

<jsp:include page="footer.jsp"/>