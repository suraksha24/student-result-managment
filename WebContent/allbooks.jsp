<%@ include file="book.jsp" %>
<%@page import="java.sql.*" %>
<html>
<body>
<%
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/library","root","12345");
	Statement st = cn.createStatement();
	ResultSet rst=st.executeQuery("select * from books");
	%>
	<table border="2px">
	<thead>
	<th>STUDENT'S ROLL NUMBER:</th>
	<th>STUDENT NAME:</th>
	<th>STUDENT MARKS:</th>
	</thead>
	<tbody>
	
	<%while(rst.next() )
	{
		%>
		<tr>
		<td><%= rst.getString(1) %></td>
		<td><%=rst.getString(2) %></td>
		<td><%=rst.getString(3) %></td>
		
		</tr>
	    <%
	}
	%>
	
	</tbody>
	
	</table>
	
	<%
	
	
	 
}
catch(Exception ec)
{
	System.out.println(ec);
}
%>

</body>
</html>