<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.Map" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script>
$(document).ready(function(){
	$("#saveData").on("click",function(){
		if($("#clmsUserID").val()=="")
		{
			alert("Please Enter User ID");
			$("#clmsUserID").focus();
		}
		else if($("#cifNo").val()=="")
		{
			alert("Please Enter CIF Number");
			$("#cifNo").focus();
		}
		else if($("#rmCodeOld").val()=="")
		{
			alert("Please Enter Old RM Code");
			$("#rmCodeOld").focus();
		}
		else if($("#rmCodeNew").val()=="")
		{
			alert("Please Enter New RM Code");
			$("#rmCodeNew").focus();
		}
		else if($("#itrs").val()=="")
		{
			alert("Please Enter ITRS Number");
			$("#itrs").focus();
		}
		else{
		var clmsUserID=$("#clmsUserID").val();
		var cifNumber=$("#cifNo").val();
		var rmCodeOld=$("#rmCodeOld").val();
		var rmCodeNew=$("#rmCodeNew").val();
		var itrs=$("#itrs").val();
		var remarks=$("#remarks").val();
		
		$.get("http://localhost:8080/AngularJSExample/SaveAudit",{"clmsUserID":clmsUserID,"cifNumber":cifNumber,"rmCodeOld":rmCodeOld,"rmCodeNew":rmCodeNew,"itrs":itrs,"remarks":remarks},function(status,data){
			if(status="success")
			{
				//alert("RM CODE CHANGED SUCCESSFULLY");
				$("#showAuditStatus").html("<span style='color:green;font-weight:bolder'>RM CODE SUCCESSFULLY CHANGED FOR USER ID "+clmsUserID+"</span>");
				
				$("#clmsUserID").val("");
				$("#cifNo").val("");
				$("#rmCodeOld").val("");
				$("#rmCodeNew").val("");
				$("#itrs").val("");
				$("#remarks").val("");
				setTimeout(function(){
					$("#showAuditStatus").html("&nbsp;");					
				},5000);
				
				
			}	
		});
		}
	});
});
</script>
</head>
<body>
<div class="row" style="height:100px">
<div class="col-sm-12">&nbsp;</div>
</div>

<div class="row" >
<div class="col-sm-3">&nbsp;</div>
<div class="col-sm-6" style="border:3px solid blue">
<div class="row">
<div class="col-sm-12" style="text-align:center;">CHANGE RM OF USER</div>
</div>
<div class="row">
<div class="col-sm-12"><div id="showAuditStatus" style="text-align:center">&nbsp;</div></div>
</div>
<div class="row" >
<div class="col-sm-3"></div>
<div class="col-sm-3"><label>CLMS User ID</label></div>
<div class="col-sm-3"><input type="text" name="clmsUserID" id="clmsUserID"/></div>
<div class="col-sm-3"></div>
</div>
<div class="row">
<div class="col-sm-12">&nbsp;</div>
</div>
<div class="row">
<div class="col-sm-3"></div>
<div class="col-sm-3"><label>CIF</label></div>
<div class="col-sm-3"><input type="text" name="cifNo" id="cifNo"/></div>
<div class="col-sm-3"></div>
</div>
<div class="row">
<div class="col-sm-12">&nbsp;</div>
</div>
<div class="row">
<div class="col-sm-3"></div>
<div class="col-sm-3"><label>RM Code old</label></div>
<div class="col-sm-3"><input type="text" name="rmCodeOld" id="rmCodeOld"/></div>
<div class="col-sm-3"></div>
</div>
<div class="row">
<div class="col-sm-12">&nbsp;</div>
</div>
<div class="row">
<div class="col-sm-3"></div>
<div class="col-sm-3"><label>RM Code New</label></div>
<div class="col-sm-3"><input type="text" name="rmCodeNew" id="rmCodeNew"/></div>
<div class="col-sm-3"></div>
</div>
<div class="row">
<div class="col-sm-12">&nbsp;</div>
</div>
<div class="row">
<div class="col-sm-3"></div>
<div class="col-sm-3"><label>ITRS</label></div>
<div class="col-sm-3"><input type="text" name="itrs" id="itrs"/></div>
<div class="col-sm-3"></div>
</div>
<div class="row">
<div class="col-sm-12">&nbsp;</div>
</div>
<div class="row">
<div class="col-sm-3"></div>
<div class="col-sm-3"><label>Remarks</label></div>
<div class="col-sm-3"><textarea rows="5" cols="22" name="remarks" id="remarks"></textarea></div>
<div class="col-sm-3"></div>
</div>
<div class="row">
<div class="col-sm-12">&nbsp;</div>
</div>
<div class="row">
<div class="col-sm-3"></div>
<div class="col-sm-3"><button type="button" class="btn btn-primary" id="saveData">SAVE</button></div>
<div class="col-sm-3"><button type="button" class="btn btn-primary" id="cancel">CANCEL</button></div>
<div class="col-sm-3"></div>
</div>
</div>
<div class="col-sm-3">&nbsp;</div>
</div>
</body>
</html>