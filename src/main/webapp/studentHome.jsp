<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>

<%
	try{
		String regNo = request.getParameter("pass");
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("SELECT * FROM StudentMarks where RegNo = '"+regNo+"'");
		if(rs.next()){
	    
%>


<center><img src="sgp.png" width="150" height="150">
</center>
    
  <hr class="new1">
<style>
table{
  width:100%;
  table-layout: fixed;
}
th{
  padding: 20px 15px;
  text-align: left;
  font-weight: 500;
  font-size: 12px;
  color: #fff;
  text-transform: uppercase;
 border: 2px solid rgba(255,255,255,0.3);
}


/* demo styles */

@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);
body{
  background: -webkit-linear-gradient(left, #25c481, #25b7c4);
  background: linear-gradient(to right, #25c481, #25b7c4);
  font-family: 'Roboto', sans-serif;
}

</style>
  <!--for demo wrap-->
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>institution Name: SGP</th>
          <th>Course Name: B.Tech</th>
          <th>Branch Name: Computer Science</th>
          <th><center>RollNo: <%=rs.getString(1) %></center></th>
        </tr>
      </thead>
      <thead>
        <tr>
          <th>Name: <%=rs.getString(2)%></th>
          <th>Registration: <%=rs.getString(8)%></th>
          <th>Gender: <%=rs.getString(9)%></th>
          <th><a titlt="print screen" alt="print screen" onclick="window.print();" target="_blank" style="cursor:pointer;"><center><img src="print.png"></center></a></th>
        </tr>
      </thead>
    </table>
  </div>
<style>
html {
  font-family:arial;
  font-size: 25px;
}

td {
  border: 2px solid #726E6D;
  padding: 15px;
  color:black;
  text-align:center;
}

thead{
  font-weight:bold;
  text-align:center;
  background: #625D5D;
  color:white;
}

table {
  border-collapse: collapse;
}

.footer {
  text-align:right;
  font-weight:bold;
}

tbody >tr:nth-child(odd) {
  background: #D1D0CE;
}

</style>
<head>

</head>
<body>
  <table>
    <thead>
      <tr>
        <td colspan="3">Course</td>
        <td rowspan="2">Type</td>
        <td rowspan="2">Full Marks</td>
        <td rowspan="2">Passing Marks</td>
        <td rowspan="2">Obtained Marks</td>
        
      </tr>
      <tr>
        <td>Code </td>
        <td colspan="2"> Name </td>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>NAS101</td>
        <td colspan="2">Operating System</td>
        <td>Theory</td>
        <td>100</td>
        <td> 30 </td>
        <td><%=rs.getString(4)%></td>
      </tr>
      <tr>
        <td>NAS102</td>
        <td colspan="2">DBMS</td>
        <td>Theory</td>
        <td>100</td>
        <td>30</td>
        <td><%=rs.getString(6)%> </td>
      </tr>
      <tr>
        <td>NAS103</td>
        <td colspan="2">Computer Networking</td>
        <td>Theory</td>
        <td>100</td>
        <td> 30 </td>
        <td> <%=rs.getString(5)%></td>
      </tr>
      <tr>
        <td>NEE101</td>
        <td colspan="2">Software Engineering</td>
        <td>Theory</td>
        <td>100</td>
        <td> 30 </td>
        <td> <%=rs.getString(7)%></td>
      </tr>
      <tr>
        <td>NEC101</td>
        <td colspan="2">OOPS in Java</td>
        <td>Theory</td>
        <td>100</td>
        <td> 30 </td>
        <td> <%=rs.getString(3)%> </td>
      </tr>
      
    </tbody>
    <tfoot>
      <tr>
        <td colspan="4" class="footer">Total Marks</td>
        <td>500</td>
        <td>180</td>
        <td><%int sum=rs.getInt(3)+rs.getInt(4)+rs.getInt(5)+rs.getInt(6)+rs.getInt(7); out.println(sum); %> </td>
      </tr>
      <tr>
        <td colspan="4" class="footer">Percentage</td>
        <td colspan="3"><%out.println((sum*100)/500); %>%</td>
      </tr>
  </table>
    <hr class="new1">
  
  <hr class="new1">
</body>

<%
		}
else{
	response.sendRedirect("errorindex.html");
	}
}
catch(Exception e){
	
}%>







