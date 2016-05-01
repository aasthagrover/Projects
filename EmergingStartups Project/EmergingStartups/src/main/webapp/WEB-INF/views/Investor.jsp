<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Creative - Start Bootstrap Theme</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css">

    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css" type="text/css">

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="resources/css/animate.min.css" type="text/css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="resources/css/creative.css" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<script>
var xmlHttp;
xmlHttp = GetXmlHttpObject();
function function1(){
	
    
    if(xmlHttp==null){
        alert("Yor browser does not support ajax");
        return;
    }
    
   var x=document.getElementById("search").value; 
  if(x=="Manufacturing" || x=="Engineering" || x=="Finance"){
	  
 
   var query1="action=search&roleType=Entrepreneur&category="+x;
  
	
   xmlHttp.onreadystatechange=function stateChanged(){
       if(xmlHttp.readyState==4){   
    	   document.getElementById("searchResult").style.display="block";
    
            var json=JSON.parse(xmlHttp.responseText);
            
            if (json.file.length > 0) {

                for (var count = 0; count < json.file.length; count++) {

                	for(var q in json.file[count]){
                		
                	//	alert(json.file[count][q]);
                	
                   var y = document.createElement("TR");
                    y.setAttribute("id", "myTr" + count);
                     document.getElementById("minetable").appendChild(y);
                   
                     var z = document.createElement("TD");
                     var t = document.createTextNode(json.file[count][q]);
                     z.appendChild(t);
                     document.getElementById("myTr" + count).appendChild(z);
                     
                     var z = document.createElement("TD");
                	 var openBtn = document.createElement("input");
                	 var id = json.file[count][q];
                	 openBtn.setAttribute("type","button");
                	 openBtn.setAttribute("value","Select");
                	 openBtn.setAttribute("name","querybtn");
                	 openBtn.style.marginLeft = "20px";
                	 openBtn.style.marginTop = "20px";
                	 //openBtn.setAttribute("onclick","openInvestorProfile(id)"); 
                     z.appendChild(openBtn);
                     document.getElementById("myTr" + count).appendChild(z);
                     openBtn.onclick=(function (id) {
                         return function () {
                         openInvestorProfile(id);
                     }
                })(id);
                                           
                	}

              }
            }
           }
	      }
   

   xmlHttp.open("POST", "investor.htm", true);
   xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
   xmlHttp.send(query1);
   return false;
   }else{
	 document.getElementById("error").innerHTML="Enter a valid category";
   }
}


function openInvestorProfile(id){
	
	document.getElementById("entrepreneurProfile").style.display="block";
	var x=document.getElementById("profile");
	x.setAttribute("value",id);
}

function investorFormDisplay() {
    if (document.getElementById("investorForm").style.display == "none") {
        document.getElementById("investorForm").style.display = "block";
         document.getElementById("myForm").reset();
         document.getElementById("success").innerHTML = "";
//         document.getElementById("searchForm").style.display = "none"
    } else {
        document.getElementById("investorForm").style.display = "none"
    }
}


		function saveUser() {
		    
		    if(xmlHttp==null){
		        alert("Yor browser does not support ajax");
		        return;
		    }
		    
		    var investorName=document.getElementById("investorName").value;
		    var investorContact=document.getElementById("investorContact").value;
		    var description=document.getElementById("description").value;
		    var user=document.getElementById("user").value;
		   if(investorName && investorContact && description && user ){ 
		    var query="action=saveUser&investorName="+investorName+"&investorContact="+investorContact+"&description="+description+"&user="+user;
		  
		  xmlHttp.onreadystatechange=function stateChanged(){
		
			 
		      if(xmlHttp.readyState==4){
		    	  
		         
		         
		          document.getElementById("success").innerHTML="Your Proposal has been submitted successfully";
		      }
		  }
		   xmlHttp.open("POST","investor.htm",true);
		   xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded"); 
		   xmlHttp.send(query);
		   return false;
		   }
		   else{
			  document.getElementById("new").innerHTML="Not A Valid Submission"; 
		   }
		}

function GetXmlHttpObject()
{
    var xmlHttp = null;
    try
    {
        // Firefox, Opera 8.0+, Safari
        xmlHttp = new XMLHttpRequest();
    } catch (e)
    {
        // Internet Explorer
        try
        {
            xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e)
        {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
    }
    return xmlHttp;
}
</script>

<body id="page-top">

    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
               
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="signup.htm">SignUp</a><br><br>
                    </li>
                    
                    <li>
                        <a href="investor.htm?action=Notifications&userID=${requestScope.userID}">Notifications</a>
                    </li>
                    <li>
                        <a href="signIn.htm?action=logout">Logout</a>
                    </li>
                </ul>
            </div>
            
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <header>
        <div class="header-content">
            <div class="header-content-inner">
                <h3>Our Mission is to help bring Startups to Life</h3>
               

                <div align="center" style="color:silver;">
                   <h1>Investor</h1>
<p>Hello <c:out value="${user.firstName} ${user.lastName}"></c:out></p>

		<form>
		Search By Category: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <input type="text" id="search" onchange="return function1();"/><br><br>
		<span id="error"></span>
		<div id="searchResult" style="display: none">
		<table id="minetable" border="1" style="color:white;">
		<tr>
		    <th>Entrepreneur Name</th>
		</tr>
		</table>
		</div>
		</form><br><br>

<div id="entrepreneurProfile" style="display: none">
<form action="investor.htm" method="POST">
<input type="text" id="profile" name="entrepreneurName"/>
<input type="hidden" name="action" value="open"/>
<input type="hidden" name="userID" value="${user.userID}"/>
<input type="submit" value="OpenProfile" />
<!-- <table id="profile"> -->
<!-- </table> -->
</form>
</div>

					<form action ="investor.htm" method="POST">
					<table>
				   <tr><td>EntrepreneurName :</td><td><input name="entrepreneurName" value="${entrepreneur.entrepreneurName}" required/><br><br></td></tr>
					 <tr><td>Entrepreneur Contact:</td><td> <input name="entrepreneurContact" value="${entrepreneur.entrepreneurContact}" required/><br><br></td></tr>
					<tr><td>Business Proposal:</td><td><input name="proposal" value="${entrepreneur.proposal}" required/><br><br></td></tr>
					<tr><td>Your Investment Share:</td><td> <input name="selfInvestmentShare" required/><br><br></td></tr>
					<tr><td><input type="submit" value="Like It? Aceept to Invest"/></td>
					<td><input type="hidden" name="action" value="sendproposal"/></td>
					<td><input type="hidden" name="userID" value="${requestScope.userID}"/></td></tr>
					</table>
					<span id="success" style="color:green;" ><c:out value="${requestScope.msg}"></c:out></span>
					</form>
				
						<form action="pdf.htm" method = "POST">
						<table>
				        <tr><td>Entrepreneur Name:</td><td><input name="entrepreneurName" required/></td></tr><br><br>
						<tr>
						<td>Your Investment Share:</td><td> <input name="selfInvestmentShare" required/></td>
						<td><input type="submit" value="Generate Contract"/></td>
						<td><input type="hidden" name="action" value="InvestorPDF"/></td>
						<td><input type="hidden" value="${requestScope.userID}"/></td>
						<td style="color:green;"><c:out value="${requestScope.share}"></c:out></td></tr>
						</table>
						</form><br>

<button onclick="investorFormDisplay()">Want to Invest?</button>
		<div id="investorForm" style="display: none;" >
		     <h6 style="color:green;">Fill the form below</h6>
		     
			<form id="myForm" onsubmit="return saveUser();">
				   <table>
				   <tr><td>Your Name :</td><td> <input id="investorName" type="text" required/></td></tr> 
			
			        <tr><td>Your Contact :</td><td> <input id="investorContact" type="text" required/></td></tr> 
			           
			        <tr><td>   Your Description :</td><td><textarea id="description" required ></textarea></td>
			        <td><input type="hidden" id="user" value="${user.userID}"/></td>
			         <td><input type="hidden" name="action" value="saveUser"/></td>
			         <td><input type="submit" value="Submit"></td>
			         <td><span id="new" style="color:green;"></span></td>
			           </tr> 
			       </table>    
			</form>
			<br><br>
			<span id="success"></span>
		</div>
						
            </div>
                <p><b>Become an Entrepreneur !! Make your Dream Come True</b></p>
            
            </div>
        </div>
    </header>  


    <!-- jQuery -->
    <script src="resources/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="resources/js/jquery.easing.min.js"></script>
    <script src="resources/js/jquery.fittext.js"></script>
    <script src="resources/js/wow.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="resources/js/creative.js"></script>

</body>

</html>
