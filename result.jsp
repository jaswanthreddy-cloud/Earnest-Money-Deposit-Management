<%@ page import="java.sql.*"%>
  <%@ page import="javax.sql.*"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">

    <head>
      <%
        String demand=request.getParameter("dno");
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","project","project");
        Statement st= con.createStatement(); 
        HttpSession hs=request.getSession();
 %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script language="javascript">
          function search() {
            var myWindow = window.open("result.jsp", "_parent", top = 300, left = 200, width = 480, height = 340);
          }

          function change($i, j) {
            if ($i == "Applicable") {
              document.getElementById("emdtype" + j).disabled = false;
              document.getElementById("emdam" + j).disabled = false;
              document.getElementById("emdno" + j).disabled = false;
              document.getElementById("emddate" + j).disabled = false;
              document.getElementById("emdfrom" + j).disabled = false;
              document.getElementById("emdto" + j).disabled = false;
            } else if ($i == "Not Applicable") {
              document.getElementById("emdtype" + j).disabled = true;
              document.getElementById("emdam" + j).disabled = true;
              document.getElementById("emdno" + j).disabled = true;
              document.getElementById("emddate" + j).disabled = true;
              document.getElementById("emdfrom" + j).disabled = true;
              document.getElementById("emdto" + j).disabled = true;
            }
          }

          function insertRecord(i) {
            var d1 = document.getElementById("d1" + i).value;
            var vcode = document.getElementById("vcode" + i).value;
            var tenfee = document.getElementById("tenfee" + i).value;
            var tenfeeno = document.getElementById("tenfeeno" + i).value;
            var tenfeedate = document.getElementById("tenfeedate" + i).value;

            var emdam = document.getElementById("emdam" + i).value;
            var emdno = document.getElementById("emdno" + i).value;
            var emddate = document.getElementById("emddate" + i).value;
            var emdfrom = document.getElementById("emdfrom" + i).value;
            var emdto = document.getElementById("emdto" + i).value;

            // if (d1.length != 0||emdam.length!=0||emdno.length!=0||emddate.length!=0||emdfrom.length!=0||emdto.length!=0)
            // {
            $.ajax({
              type: 'POST',
              url: './save.jsp',
              data: {
                'd1': d1,
                'vcode': vcode,
                'tenfee': tenfee,
                'tenfeeno': tenfeeno,
                'tenfeedate': tenfeedate,
                'emdam': emdam,
                'emdno': emdno,
                'emddate': emddate,
                'emdfrom': emdfrom,
                'emdto': emdto
              },
              success: function (msg) {
                alert('details saved');
              },
            });

            // }

          }

          function expire() {
            var myWindow = window.open("expire.jsp", "_parent", top = 300, left = 200, width = 200, height = 300);
          }

          function between() {
            document.getElementById("some").style.display = 'block';

            document.getElementById("startdate").style.display = 'block';
            document.getElementById("enddate").style.display = 'block';
            document.getElementById("find").style.display = 'block';

          }

          function check() {
            if ((document.getElementById("startdate").value == "") || (document.getElementById("enddate").value == "")) {
              alert("Please enter demandno!");

              return false;
            } else {


              document.getElementById("myform").submit();
            }
          }
        </script>

    </head>

    <body style="background:#DCDCE0; font-size:20px;">

      <% 
 ResultSet rs1=st.executeQuery("select * from demand where demand_no = '"+demand+"'");
 while(rs1.next())
        {
            %>
        <h STYLE=""><b>DEMAND_NO:  </b>
          <%= rs1.getString("DEMAND_NO")%>
            </h1> <br>
            <h STYLE=""><b>DESCRIPTION:</b>
              <%= rs1.getString("DESCRIPTION")%>
                </h1> <br><br> <br> <br>
                <%
          
        }
      
    ResultSet rs=st.executeQuery("select * from step where demand_no='"+demand+"'");
 %>
                  <table border="1">
                    <tr>
                      <th>Res</th>
                      <th>Demand no</th>
                      <th>Vcode</th>
                      <th>Vendor</th>
                      <th>Address1</th>
                      <th>Address2</th>
                      <th>City</th>
                      <th>Tender fee</th>
                      <th>Tender Fee dd no</th>
                      <th>Tender fee dd date</th>
                      <th>EMD App/Non App</th>
                      <th>EMD type</th>
                      <th>EMD amount</th>
                      <th>Emd amount DD/BG no</th>
                      <th>Emd amount DD/BG date</th>
                      <th>Emd amount DD/BG valid from</th>
                      <th>Emd amount DD/BG valid to</th>


                    </tr>
                    <%
            
            int i=0;
 while(rs.next())
        {
          i++;
            %>
                      <tr>
                        <td><input type="checkbox" value="false" id="res"></td>
                        <td>
                          <%=rs.getString("DEMAND_NO")%>
                        </td>
                        <input type="hidden" id="d1<%=i%>" value="<%=rs.getString("DEMAND_NO")%>" />
                        <td>
                          <%=rs.getString("V_code") %>
                        </td>
                        <input type="hidden" id="vcode<%=i%>" value="<%=rs.getString("V_code")%>" />
                        <td>
                          <%=rs.getString("V_Name") %>
                        </td>
                        <td>
                          <%=rs.getString("V_ADD1")%>
                        </td>
                        <td>
                          <%=rs.getString("V_add2") %>
                        </td>
                        <td>
                          <%=rs.getString("V_City") %>
                        </td>
                        <td><input type=text id="tenfee<%= i%>" name="tenfee" style="width:55px"></td>
                        <td><input type=text id="tenfeeno<%= i%>" name="tenfeeno" style="width:65px"></td>
                        <td><input type="date" id="tenfeedate<%=i%>" value="yyyy-mm-dd" id="d1<%= i%>" class="input-medium search-query"
                            onkeypress="return false"></td>
                        <%--<p></p>--%>
                          <td>
                            <select id="emdap<%= i%>" onchange="change(value,<%= i%>)">
              <option value="Not Applicable">Not Applicable</option>
               <option value="Applicable">Applicable</option>
                </select>
                          </td>
                          <td>
                            <select id="emdtype<%= i%>" disabled>
              <option value="Bank">Bank</option>
               <option value="DD">DD</option>
                </select>
                          </td>
                          <td><input type=text id="emdam<%= i%>" name="emdam" style="width:65px" disabled></td>
                          <td><input type=text id="emdno<%= i%>" name="emdno" style="width:85px" disabled></td>
                          <td><input type="date" id="emddate<%= i%>" name="emddate" style="width:100px" value="yyyy-mm-dd" class="input-medium search-query"
                              onkeypress="return false" disabled></td>
                          <td><input type="date" id="emdfrom<%= i%>" name="emdfrom" style="width:100px" value="yyyy-mm-dd" class="input-medium search-query"
                              onkeypress="return false" disabled></td>
                          <td><input type="date" id="emdto<%= i%>" name="emdto" style="width:100px" value="yyyy-mm-dd" class="input-medium search-query"
                              onkeypress="return false" disabled></td>
                          <td><input type="button" id="ins<%= i%>" value="save" onclick="insertRecord(<%= i%>)"></td>

                      </tr>


                      <%
        }
     
 %>



                  </table>
                  <br><br><br>
                  <div style="margin-left:500px;">
                    <input type="button" value="Monitor" id="mon" onclick="expire()">
                    <input type="button" value="Report" id="rep" onclick="between()">
                    <br>

                    <h id="some" style="display:none"><b>ENTER RANGE OF DATES TO FIND EMD IN IT</b></h><br><br>

                    <form id="myform" action="between.jsp" method="post" onsubmit="return check()">

                      <input type="date" id="startdate" name="startdate" value="yyyy-mm-dd" id="start" class="input-medium search-query" onkeypress="return false"
                        style="display:none"><br>
                      <input type="date" id="enddate" name="enddate" value="yyyy-mm-dd" id="end" class="input-medium search-query" onkeypress="return false"
                        style="display:none"><br>
                      <input type="submit" id="find" value="search" style="display:none">
                    </form>

                  </div>
    </body>

    </html>