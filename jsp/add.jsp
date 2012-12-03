<jsp:include page="header.jsp" />
<%
	if (session.getAttribute("admin") == null) {
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
<%
	out.print("Welcome, " + session.getAttribute("admin") + ".");
%>
<br/>
<h2> Enter Product Information</h2>

<form method=post action="addproducts.jsp" onsubmit="return checkform(this);">
<table border="1">

 <tr>
   <th>Artist:</th> <td><input name="artist" type="text" width="40"/></td>
 </tr>
 <tr>
   <th>Album:</th> <td><input name="album" type="text" width="40"/></td>
 </tr>
 <tr>
   <th>Year:</th> <td><input name="year" type="text" width="40"></td>
 </tr>
 <tr>
   <th>Genre:</th> <td><input name="genre" type="text" width="40"/></td>
 </tr>
 <tr>
   <th>Price:</th> <td><input name="price" type="text" width="40"/></td>
 </tr>
 <tr>
   <th>Filename:</th> <td><input name="albumart" type="text" width="40"/></td>
 </tr>
 
 <tr>
   <th colspan="2"><input type="submit" value="Add Product"/></th>
 </tr>
 
</table>
</form>

<!-- end .content --></div>

<script language="JavaScript" type="text/javascript">
<!--
function checkform(form) {
  if (isNaN(form.price.value)) {
    alert("Year must be a number.");
    form.price.focus();
    return false;
  }

  if (isNaN(form.year.value)) {
    alert("Year must be a number.");
    form.year.focus();
    return false;
  }

  if (form.artist.value == "" || form.artist.value == null) {
    alert("Please enter artist name.");
    form.artist.focus();
    return false;
  }

  if (form.album.value == "" || form.album.value == null) {
    alert("Please enter album name.");
    form.album.focus();
    return false;
  }

  if (form.year.value == 0) {
    alert("Please enter a year.");
    form.year.focus();
    return false;
  }

  if (form.genre.value == "" || form.genre.value == null) {
    alert("Please enter a genre.");
    form.genre.focus();
    return false;
  }

  if (form.price.value == 0) {
    alert("Please enter a price.");
    form.price.focus();
    return false;
  }
  return true;
}
//-->
</script>

<jsp:include page="footer.jsp" />
