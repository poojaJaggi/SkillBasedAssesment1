<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.iiht.evaluation.eloan.model.LoanInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script type="text/javascript" src="js/viewDetails.js"></script>
<style>
label {
	font-weight: bold;
}

</style>
<title>Loan Application Form</title>
</head>
<body style="background-color:lightgrey;">

	<!--
	write the html code to accept laon info from user and send to placeloan servlet
-->


	<jsp:include page="header.jsp" />
	
	
  	<% if(request.getAttribute("state").equals("new") ){ 
		//request.setAttribute("state", "submitted");
	%>
	
	<form action="user?action=placeloan" method="POST">
		<div align="center">

             <h2>Loan Application Form</h2>
			<!--  <table>
			<tr><td>Loan Amount</td><td><strong>${loan.fullName }</strong></td></tr>
			
		</table>-->
			<!--  <div>
			<div><label for="loginid">Enter your full name</label> </div>
			<div><input type="text" id="loginid" name="loginid"> </div>
		</div>-->

			<div>
				<div>
					<label for="Loan Name">Loan Name</label>
				</div>
				<div>
					<input type="text" id="loanname" name="loanname" required>
				</div>
			</div>

			<div>
				<div>
					<label for="amount">Enter your amount</label>
				</div>
				<div>
					<input type="number" id="loanamount" name="loanamount" required>
				</div>
			</div>

			<%
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				String todayDate = dtf.format(LocalDateTime.now());
				session.setAttribute("todayDate", todayDate);
			%> 
			<div>
				<div>
					<label for="Loan Application Date">Loan Application Date</label>
				</div>
				<div>
					<input type="text" id="loanapplicationdate"
						name="loanapplicationdate" readonly disabled value="<%=todayDate %>">
				</div>
			</div>



			<div>
				<div>
					<label for="BusinessStruture">BusinessStruture</label>
				</div>
				<div>

					<input type="radio" id="Individual" name="BusinessStruture"
						value="Individual" required> <label for="Individual">Individual</label>
					<input type="radio" id="Organisation" name="BusinessStruture"
						value="Organisation" required> <label for="Organisation">Organisation</label>

				</div>
			</div>

			<div>
				<div>
					<label for="BillingIndicator">BillingIndicator</label>
				</div>
				<div>
					<input type="radio" id="Salaried Person" name="BillingIndicator"
						value="Salaried Person" required> <label
						for="Salaried Person">Salaried Person</label> <input type="radio"
						id="Non Salaried Person" name="BillingIndicator"
						value="Non Salaried Person" required> <label
						for="Non Salaried Person">Non Salaried Person</label>
				</div>
			</div>

			<!--  <div>
				<div>
					<label for="TaxIndicator">TaxIndicator</label>
				</div>
				<div>
					<input type="radio" id="TaxPayee" name="TaxIndicator" value="Yes" required>
					<label for="Yes">Yes</label> 
					<input type="radio" id="No" name="TaxIndicator" value="No" required> 
						<label for="No">No</label>
				</div>
			</div>-->

			<div>
				<div>
					<label for="Address">Address</label>
				</div>
				<div>
					<Textarea id="address" name="address" required></Textarea>
				</div>
			</div>

			<div>
				<div>
					<label for="Mobile">Mobile</label>
				</div>
				<div>
					<input type="tel" id="mobile" name="mobile" required pattern="[1-9]{1}[0-9]{9}">
				</div>
			</div>

			<div>
				<div>
					<label for="Email">Email</label>
				</div>
				<div>
					<input type="email" id="email" name="email" required>
				</div>
			</div>

			<input type="submit" value="Submit">
		</div><br>
		<div align="left"><a href="userhome1.jsp"><input type="button" name="navigateback" value="Navigate Back"></a></div>
		
	</form>
	
	  <% } else { 
		
		String state = request.getAttribute("state").toString();

		if(state.equalsIgnoreCase("submitted"))
		{
			LoanInfo loanData =	(LoanInfo) request.getAttribute("loanDetails");
			String applicationID = loanData.getApplno();
		
		%>
			<h4>Loan details submitted successfully !!</h4>
			<h4>Your App Number is : <%=applicationID %></h4>
			<p> Details will be verified by Admin..</p>
		<% }
		else
		{ %>
			<p>Loan submission process is unsuccessful, Try again !!</p>
		
	<% } %>
		
		<div align="center"><a href="userhome1.jsp"><input type="button" name="navigateback" value="Navigate Back"></a></div>
	<!--  <a href="userhome1.jsp">Navigate Back</a>-->
	<% } %>
	
	
	
	<jsp:include page="footer.jsp" />


</body>
</html>