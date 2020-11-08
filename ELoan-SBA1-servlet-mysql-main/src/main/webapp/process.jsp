<%@page import="com.iiht.evaluation.eloan.model.LoanInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
#loanInfo{
font-family:GEORGIA;
border-collapse:collapse;
width:100%;

}
#loanInfo td,tr,th{
border : 1px solid;
font-family:GEORGIA;
}
#loanInfo th{
background:#8d82e6;
color:White;

}
#e{
padding-bottom:5px
}


</style>
<meta charset="ISO-8859-1">
<title>Process Loan</title>
</head>
<body style="background-color:lightgrey;">
	<!-- write the code to read application number, and send it to admincontrollers
	     callemi method to calculate the emi and other details also provide links
	     to logout and admin home page
	-->
	<jsp:include page="header.jsp" />
	<%
	if(request.getAttribute("fetchedLoanData")==null){ 
	%>
	
	<form action="admin?action=process" method="POST">
	<div align="center">
		<div id="e">
			<label for="Application Number">Enter your application number</label>
		</div>
		<div>
			<input type="text" id="applicationnumber" name="applicationnumber"	required placeholder="Enter your application number">
		</div>


		<div>
			<input type="submit" id="editapplication" name="editapplication" value="Process Application">
		</div>
		</div>
	</form>

	<% 
	request.removeAttribute("fetchedLoanData");
	
	} else {
	
		LoanInfo loaninfo = (LoanInfo) request.getAttribute("fetchedLoanData");
		session.setAttribute("loaninfo", loaninfo);	%>
	
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
	
	
	<br>
	<br>
	
	<form action="admin?action=calemi&status=Approved" method="post">
	        <h2> Add Loan Sanction Details</h2>
			<div>
				<div>
					<label for="amountsanctioned">Amount Sanctioned</label>
				</div>
				<div>
					<input type="text" id="amountsanctioned" name="amountsanctioned" placeholder="Enter amount sanctioned" required>
				</div>
			</div>
			
			<div>
				<div>
					<label for="loanterm">Loan Term</label>
				</div>
				<div>
					<input type="number" id="loanterm" name="loanterm" placeholder="Enter Loan Term" required>
				</div>
			</div>
			
			<div>
				<div>
					<label for="interestrate">Interest Rate</label>
				</div>
				<div>
					<input type="number" id="interestrate" name="interestrate" placeholder="Enter Interest Rate"required>
				</div>
			</div>
			
			<div>
				<div>
					<label for="paymentstartdate">Payment Start Date</label>
				</div>
				<div>
					<input type="date" id="paymentstartdate" name="paymentstartdate" placeholder="yyyy-dd-mm" required>
				</div>
			</div>
	
			<input type="submit" value="Approve" id="approve">
	</form>
	
	
	
	
	<!-- <a href="admin?action=calemi&status=Approved"><input type="button" value="Approve" id="approve"></a> -->
	<a href="admin?action=calemi&status=Declined"><input type="button" value="Decline" id="decline"></a>
	
	<% } %>
	
	<br><a href="adminhome1.jsp"><div align="center"><input type="button" name="adminhome" value="Admin Home"></div></a>
	<jsp:include page="footer.jsp" />

</body>
</html>