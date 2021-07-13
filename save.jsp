<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*, java.text.*" %>

    <%@ page import="java.sql.*"%>
        <%@ page import="javax.sql.*"%>

<%
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","project","project");
            Statement st= con.createStatement(); 
            HttpSession hs=request.getSession();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

String d1=request.getParameter("d1");
String vcode=request.getParameter("vcode");
String tenfee=request.getParameter("tenfee");
String tenfeeno=request.getParameter("tenfeeno");
String tenfeedate = request.getParameter("tenfeedate");

String emdam=request.getParameter("emdam");
String emdno=request.getParameter("emdno");
String emddate=request.getParameter("emddate");
String emdfrom=request.getParameter("emdfrom"); 
String emdto=request.getParameter("emdto");

// String d1="dmd101";
// String vcode="v202" ;
// String tenfee="102";
// String tenfeeno="100";
// String tenfeedate="1997-02-03";

// String emdam="100";
// String emdno="100";
// String emddate="1997-02-03";
// String emdfrom="1997-02-03";
// String emdto="1997-02-03";

// String emdam=null;
// String emdno=null;
// String emddate=null;
// String emdfrom=null;
// String emdto=null;


 int p=Integer.parseInt(tenfee);
 int q=Integer.parseInt(tenfeeno);
if((emddate=="")&&(emdno=="")&&(emdfrom=="")&&(emdto=="")&&(emdam==""))
{
	String query = "call insert_napp(?,?,?,?,to_date(?,'YYYY-MM-DD'))";
    PreparedStatement pstatement = con.prepareStatement(query);
              pstatement.setString(1,d1);
              pstatement.setString(2,vcode);
              pstatement.setInt(3,p);
              pstatement.setInt(4,q);
              pstatement.setString(5,tenfeedate); 
              int j = pstatement.executeUpdate();

}

else{
 
 int r=Integer.parseInt(emdam);
String query = "call insert_app(?,?,?,?,to_date(?,'YYYY-MM-DD'),?,?,to_date(?,'YYYY-MM-DD'),to_date(?,'YYYY-MM-DD'),to_date(?,'YYYY-MM-DD'))";
PreparedStatement pstatement = con.prepareStatement(query);
              pstatement.setString(1,d1);
              pstatement.setString(2,vcode);
              pstatement.setInt(3,p);
              pstatement.setInt(4,(Integer.parseInt(tenfeeno)));
              pstatement.setString(5,tenfeedate);
              pstatement.setInt(6,(Integer.parseInt(emdam)));
              pstatement.setString(7,emdno);
              pstatement.setString(8,emddate);
              pstatement.setString(9,emdfrom);
              pstatement.setString(10,emdto);
              int i = pstatement.executeUpdate();
            
}
%>