
<%@page import="java.sql.*" %>
<html>
<body>
<%
String usid = request.getParameter("idd");
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/library","root","12345");
	PreparedStatement ps = cn.prepareStatement("select * from books where id=?");
	ps.setString(1,usid);
	ResultSet rst = ps.executeQuery();
	%>
	<form action="up.jsp">
	<table border="2px">
	<thead>
	<th>STUDENT ROLL NO::</th>
	<th>STUDENT  NAME:</th>
	<th> STUDENT MARKS:</th>
	</thead>
	<tbody>
	
	<%if(rst.next() )
	{
		%>
		<tr>
		<td><input type="text" value=<%=rst.getString(1) %> name="idd" readonly></td>
		<td><input type="text" value=<%=rst.getString(2) %> name="nam" readonly></td>
		<td><input type="text" value=<%=rst.getString(3) %> name="quan" ></td>
		
		
		</tr>
		<tr><button>UPDATE</button></tr>
	    <%
	}
	else
	{
		%>
		<jsp:include page="book.jsp"></jsp:include>
		<h4>ENTER CORRECT STUDENT ROLL NO</h4>
		<%
		}
	%>
	
	</tbody>
	
	</table>
	</form>
	
	<%
	
	
	 
}
catch(Exception ec)
{
	System.out.println(ec);
}
%>

</body>
</html>