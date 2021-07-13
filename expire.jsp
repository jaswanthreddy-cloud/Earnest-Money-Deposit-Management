<%@ page import="java.sql.*"%>
  <%@ page import="javax.sql.*"%>
<html>
<body style="background-color:#58D68D;">
 <%
        
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","project","project");
Statement st= con.createStatement(); 
ResultSet rs=st.executeQuery("select v_code as vcode,v.v_name as vname,v.v_add1 as vaddr1,v.v_add2 as vaddr2,v.v_city as vcity,et.EMD_VALID_TO as expiry_date,EMD_VALID_TO-SYSDATE as expires_in  from combine v natural join emdtab et where v_code in (SELECT emdtab.V_CODE FROM emdtab WHERE (SYSDATE<EMD_VALID_TO AND EMD_VALID_TO-SYSDATE <=20 and EMD_VALID_TO-SYSDATE >=0))"); %>

<table border="2"> 
	<th>Vendor code</th>
<th>NAME</th> 
<th>ADDR1</th> 
<th>ADDR2</th> 
<th>CITY</th> 
<th>EXPIRY_DATE</th> 
<th>EXPIRES IN</th> <br>
<%
 while(rs.next())
{ %>
		<tr>
            <td><%=rs.getString("vcode") %></td>
            <td><%=rs.getString("vname") %></td>
            <td><%=rs.getString("vaddr1") %></td>
            <td><%=rs.getString("vaddr2") %></td>
            <td><%=rs.getString("vcity") %></td>            
             <td><%=rs.getDate("expiry_date") %></td>   
             <td><%=rs.getInt("expires_in")+" days" %></td></tr><br>
               <% 
        }
     %>
</table>
	</body>
</html>
