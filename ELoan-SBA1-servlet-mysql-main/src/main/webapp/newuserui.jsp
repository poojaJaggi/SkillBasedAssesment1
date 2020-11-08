<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New user registration</title>
</head>
<body style="background-color:lightgrey;">
<jsp:include page="header.jsp"/>
	<!-- read user name and password from user to create account
	     and send to usercontrollers registeruser method
	     
	-->
	<% if(request.getAttribute("newUser")!=null) {%>
		<form action="user?action=registernewuser" method="post">
		<div align="center">
		
		    <h2>New User SignUp</h2>
			<div>
				<div><label for="firstname">First Name</label> </div>
				<div><input type="text" id="firstname" name="firstname" minlength="3" required> </div>
			</div>
			<div>
				<div><label for="lastname">Last Name</label> </div>
				<div><input type="text" id="lastname" name="lastname" minlength="3" required> </div>
			</div>
			<div>
				<div><label for="dob">Date of Birth</label> </div>
				<div><input type="date" placeholder="yyyy-mm-dd" id="dob" name="dob" required> </div>
			</div>
			<div>
				<div><label for="mobile">Mobile</label> </div>
				<div><input type="tel" id="mobile" name="mobile" pattern="[1-9]{1}[0-9]{9}" required> </div>
			</div>
			<div>
				<div><label for="email">Email</label> </div>
				<div><input type="email" id="email" name="email" required> </div>
			</div>
			<div>
				<div><label for="city">City</label> </div>
				<div><input type="text" id="city" name="city" required> </div>
			</div>
			<div>
				<div><label for="state">State</label> </div>
				<div><input type="text" id="state" name="state" required> </div>
			</div>
			<div>
				<div><label for="country">Country</label> </div>
				<div><input type="text" id="country" name="country" required> </div>
			</div>
			<div>
				<div><label for="pincode">Pincode</label> </div>
				<div><input type="text" id="pincode" name="pincode" required> </div>
			</div>
			<div>
				<div><label for="address">Address</label> </div>
				<div><TextArea id="address" name="address" required></TextArea> </div>
			</div>
			<br>
			<br>
			
			<div>
				<div><label for="usernameLabel">********User Name for the new user will be auto-generated*******</label></div>
			</div>
			<div>
				<div><label for="password">Enter Password for the Account : </label> </div>
				<div><input type="password" id="password" name="password" required minlength="4"> </div>
			</div>
			<div>
				<div><input type="submit" value="Register" id="register"></div>
			</div>
			<br/>
			</div>
		</form>
		
		<%} else 
		{ 
		if(request.getAttribute("userCreation").toString().equals("success")) 
		{
		%>
			<h1>New User successfully created !!</h1>
			<br>
			<h3>Login Details are mentioned below</h3>
			<h4>UserName : <%=request.getAttribute("newUserName") %></h4>
			<h4>Password : <%=request.getAttribute("newPassword") %></h4>
			
		<% } 
		else 
		{ %>
		
		<h1>New User creation failed !!</h1>
		
		
		<%} %>
		
		
		
		<%} %>
		
		<div align="center"><a href="index.jsp"><input type="button" value="Home" name="home"/></a></div>
		<jsp:include page="footer.jsp"/>
</body>
</html>