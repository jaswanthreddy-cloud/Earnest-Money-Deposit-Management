<%@ page import="java.sql.*"%>
  <%@ page import="javax.sql.*"%>
  <%@ page import = "java.util.Date,java.text.SimpleDateFormat,java.text.ParseException"%>

<html>
<body style="background-color:#58D68D;">
	
 <%
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","project","project");
Statement st= con.createStatement(); 
SimpleDateFormat in = new SimpleDateFormat("yyyy-MM-dd"); 

String startdate = request.getParameter("startdate");
String enddate=request.getParameter("enddate");
//String startdate = "2017-01-03";
//String enddate = "2017-03-03";
//Date date1 = in.parse(startdate); 
//Date date2 = in.parse(enddate); 
%>
<%
ResultSet rs=st.executeQuery("SELECT V_CODE as vcode,v.v_name as vname,et.emd_amount as emdamt,et.emd_amount_dd_no as emdddno,et.EMD_AMOUNT_DD_DATE as emddate from combine v natural join emdtab et where et.EMD_AMOUNT_DD_DATE>=to_date('"+startdate+"','YYYY-MM-DD') and et.EMD_AMOUNT_DD_DATE<=to_date('"+enddate+"','YYYY-MM-DD')"); 
%>

<h2>FROM <%= startdate %> to <%= enddate %></h2>
<table border="2"> 
<th>EMD DATE</th>
	<th>Vendor code</th>
	<th>Vendor Name</th>
	<th>Emd amount</th>
	<th>Emd DD No</th>
<%
 while(rs.next())
{ %>
		<tr>            
      <td><%=rs.getString("emddate") %></td>    
      <td><%=rs.getString("vcode") %></td>
      <td><%=rs.getString("vname") %></td>
      <td><%=rs.getString("emdamt") %></td>
      <td><%=rs.getString("emdddno") %></td>
      </tr><br>
               <% 
        }
     
%>
</table>
	</body>
</html>
