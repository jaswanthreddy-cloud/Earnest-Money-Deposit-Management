<html>
<body>
	<script language="javascript">
	function expire()
	{
	    var myWindow = window.open("expire.jsp", "_parent", top=300, left=200, width=200, height=300);
	 }
	 function between()
	 {			                document.getElementById("some").style.display='block';

	 		   document.getElementById("startdate").style.display='block';
                document.getElementById("enddate").style.display='block';
                document.getElementById("find").style.display='block';

	 }
	 function check()
      {
        if((document.getElementById("startdate").value=="")||(document.getElementById("enddate").value==""))
          {alert("Please enter demandno!");
        
        return false;}
        else
        {
          

          document.getElementById("myform").submit();
        }
      }
	
	</script> 
	<input type="button" value="Monitor" id="mon" onclick="expire()">
		<input type="button" value="Report" id="rep" onclick="between()">
		<br>
		
					<h id="some" style="display:none"><b>ENTER RANGE OF DATES TO FIND EMD IN IT</b></h>
								<form id="myform" action="between.jsp" method="post" onsubmit="return check()">
<input type="date" id="startdate" name="startdate" value="yyyy-mm-dd" id="start" class="input-medium search-query" onkeypress="return false" style="display:none">
<input type="date" id="enddate" name="enddate" value="yyyy-mm-dd" id="end" class="input-medium search-query" onkeypress="return false" style="display:none">
<input type="submit" id="find" value="search" style="display:none">
</form>
</body>
</html>