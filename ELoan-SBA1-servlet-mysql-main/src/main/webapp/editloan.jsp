<%@page import="com.iiht.evaluation.eloan.model.LoanInfo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Loan Application</title>
<link rel="stylesheet" type="text/css" href="css/editLoan.css" />
</head>
<body style="background-color:lightgrey;">
<jsp:include page="header.jsp" />
	<!-- read the application number to edit from user and send to 
	     user controller to edit info
	-->
	
	<%
		if(request.getAttribute("editStatus")==null) {
	%>
	
	<form action="user?action=editloan" method="POST">
	<div align="center">
		<div>
			<label for="Application Number">Enter your application number</label><br>
		</div>
		<div>
			<input type="text" id="applicationnumber" name="applicationnumber"	required placeholder="Enter your application number"><br>
		</div>


		<div>
			<input type="submit" id="editapplication" name="editapplication" value="Edit"><br><br>
		</div>

		<div></div>
		</div>
	</form>
	
	<% } 
	else { 
		
		LoanInfo loaninfo = (LoanInfo) request.getAttribute("updtLoanInfo");
		
		if(request.getAttribute("editStatus").equals("done")) {
			
		%>
		<%} else { %>
		<h2>Loan edit unsuccessful !!!</h2>
		<% 	}
		request.removeAttribute("editStatus");	
		%>
				
		<h2>Loan edit successful !!!</h2>
		<table id="loanInfo">
		<thead>
			<tr>
				<th>User Name</th>
				<th>Application Number</th>
				<th>Purpose</th>
				<th>Amount Request</th>
				<th>Loan Date</th>
				<th>Business Structure</th>
				<th>Business Indicator</th>
				<th>Address</th>
				<th>Email</th>
				<th>Mobile</th>
				<th>Status</th>
			</tr>
		</thead>
		
		<tbody>
			<tr>
				<td><%=loaninfo.getUserName() %></td>
				<td><%=loaninfo.getApplno() %></td>
				<td><%=loaninfo.getPurpose() %></td>
				<td><%=loaninfo.getAmtrequest() %></td>
				<td><%=loaninfo.getDoa() %></td>
				<td><%=loaninfo.getBstructure() %></td>
				<td><%=loaninfo.getBindicator() %></td>
				<td><%=loaninfo.getAddress() %></td>
				<td><%=loaninfo.getEmail() %></td>
				<td><%=loaninfo.getMobile() %></td>
				<td><%=loaninfo.getStatus() %></td>
			</tr>
		</tbody>
	</table>
	
	
	<%} %>
		<div align="center"><a href="userhome1.jsp"><input type="button" name="navigateback" value="Navigate Back"></a></div>
		
	<jsp:include page="footer.jsp" />
</body>
</html>