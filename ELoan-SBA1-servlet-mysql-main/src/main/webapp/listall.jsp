<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.iiht.evaluation.eloan.model.LoanInfo"%>
<%@page import="java.util.ArrayList"%>
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


</style>
<meta charset="ISO-8859-1">

<title>Display All Loans</title>


<body style="background-color:lightgrey;">
<jsp:include page="header.jsp" />
	<form action="admin?action=listall" method="POST">
		<!-- write code to display all the loan details 
             which are received from the admin controllers' listall method
	-->

		<% ArrayList<LoanInfo> list_loans = (ArrayList) request.getAttribute("list_loans");%>


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

				<c:forEach items="${list_loans}" var="loan">


					<tr>
						<td><c:out value="${loan.userName}" /></td>
						<td><c:out value="${loan.applno}" /></td>
						<td><c:out value="${loan.purpose}" /></td>
						<td><c:out value="${loan.amtrequest}" /></td>
						<td><c:out value="${loan.doa}" /></td>
						<td><c:out value="${loan.bstructure}" /></td>
						<td><c:out value="${loan.bindicator}" /></td>
						<td><c:out value="${loan.address}" /></td>
						<td><c:out value="${loan.email}" /></td>
						<td><c:out value="${loan.mobile}" /></td>
						<td><c:out value="${loan.status}" /></td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
		<br>
		












	</form>
	
	</head>
	<a href="adminhome1.jsp"><div align="center"><input type="button" name="adminhome" value="Admin Home"></div></a>
	<jsp:include page="footer.jsp" />
</body>


</html>