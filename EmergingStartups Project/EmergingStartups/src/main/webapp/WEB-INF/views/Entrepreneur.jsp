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
    	  
     
	   var query1="action=search&roleType=Investor&category="+x;
	  
		
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
	   

	   xmlHttp.open("POST", "entrepreneur.htm", true);
       xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
       xmlHttp.send(query1);
       return false;
	   }else{
		 document.getElementById("success").innerHTML="Enter a valid category";
	   }
	}
	
	
	function openInvestorProfile(id){
		
		document.getElementById("investorProfile").style.display="block";
		var x=document.getElementById("profile");
		x.setAttribute("value",id);
	}
	
/*	function openInvestorProfile(id){
		
		
		 if (xmlHttp == null)
         {
             alert("Your browser does not support AJAX!");
             return;
         }

         var query = "action=open&investorName=" + id;
         
         
         xmlHttp.onreadystatechange = function stateChanged()
         {
             if (xmlHttp.readyState == 4)
             {

            	var json=JSON.parse(xmlHttp.responseText);
            	
            	 for (var count = 0; count < json.investor.length; count++) {

            		 alert(json.investor.length);
                 	for(var q in json.investor[count]){
                 		
            	        //alert("come in");
            	        alert(json.file[count][q]);
            	     // alert(json.investor[count]);
            	    //    var table=document.getElementById("profile");
            	    
//             	        var y = document.createElement("TR");
//                         y.setAttribute("id", "myTr" + count);
//                          document.getElementById("profile").appendChild(y);
                         
//                          var z = document.createElement("TD");
//                          var t = document.createTextNode(json.file[count][q]);
//                          z.appendChild(t);
//                          document.getElementById("myTr" + count).appendChild(z);
            	       
//             	        var y= document.createElement("input");
//             	        y.setAttribute("type","text");
//                    	    y.setAttribute("value",json.investor[count][q]);
//                    	    y.setAttribute("name",json.investor[count]);
//             	        document.getElementById("investorProfile").style.display="block";
            	        
                 	}
            	 }
            	// alert(json.investor.investorContact);
//                  var row = document.getElementById(rowID);
//                  row.parentNode.removeChild(row);
             }
         }
         
         xmlHttp.open("POST", "entrepreneur.htm", true);
         xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
         xmlHttp.send(query);
         return false;
	}*/

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
                        <a href="entrepreneur.htm?action=Notification&userID=${requestScope.userID}">Notifications</a>
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
               

                <p> <div align="center" style="color:silver;">
                   <h1>Entrepreneur</h1>
<h4>Hello <c:out value="${user.firstName} ${user.lastName}"></c:out></h4>
<form>
Search By Category:  <input type="text" id="search" onchange="return function1();"/>&nbsp&nbsp<br><br>

<div id="searchResult" style="display: none">
<table id="minetable" style="color:white;">
<tr>
    <th>Investor Name</th>
</tr>
</table>
</div>
</form><br><br>

<div id="investorProfile" style="display: none">
<form action="entrepreneur.htm" method="POST">
<input type="text" id="profile" name="investorName"/>
<input type="hidden" name="action" value="open"/>
<input type="hidden" name="userID" value="${user.userID}"/>
<input type="submit" value="OpenProfile" />
<!-- <table id="profile"> -->
<!-- </table> -->
</form>
</div>
<form action ="entrepreneur.htm" method="POST">
 <table>
    <tr>
		<td>Investor Name :</td>
		<td><input name="investorName" value="${investor.investorName}" required></td>
	</tr>
	<tr></tr>
	<tr>
		<td>Investor Contact:</td>
		<td><input name="investorContact" value="${investor.investorContact}" required></td>
	</tr>
	<tr></tr>
	<tr>
		<td>Description:</td>
		<td><input name="description" value="${investor.description}" required></td>
	</tr>
	<tr></tr>
    <tr>
      <td><input type="hidden" name="action" value="sendproposal"/></td>
    </tr>
    
    <tr></tr>  
    <tr>
    <td><b>Enter Your Details</b></td>
    </tr>
	<tr>
	<td>Name :</td>
	<td><input type="text" name="entrepreneurName" required/></td>
	</tr>
	<tr></tr>
	<tr>
	<td>Contact :</td>
	<td><input type="text" name="entrepreneurContact" required/></td>
	</tr>
	<tr></tr>
	<tr>
	<td>Your Business Proposal :</td>
	<td><input type="text" height="50" name="proposal" required/></td>
	</tr>
	<tr></tr>
	<tr>
	<td><input type="hidden" name="userID" value="${requestScope.userID}"/></td>
	</tr>
	<tr>
    <td><input type="submit" value="Send Proposal"/></td>
    </tr>
</table>
<span id="success"><c:out value="${requestScope.msg}"></c:out></span>
</form>
<a href="entrepreneur.htm?action=View&userID=${requestScope.userID}">Click Here To View your Submissions</a>
						
                </div></p>
                <p><b>Become an Entrepreneur !! Make your Dream Come True</b></p>
            
            </div>
        </div>
    </header>

   

    <section id="services">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">At Your Service</h2>
                    <hr class="primary">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-diamond wow bounceIn text-primary"></i>
                        <h3>Sturdy Templates</h3>
                        <p class="text-muted">Our templates are updated regularly so they don't break.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-paper-plane wow bounceIn text-primary" data-wow-delay=".1s"></i>
                        <h3>Ready to Ship</h3>
                        <p class="text-muted">You can use this theme as is, or you can make changes!</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-newspaper-o wow bounceIn text-primary" data-wow-delay=".2s"></i>
                        <h3>Up to Date</h3>
                        <p class="text-muted">We update dependencies to keep things fresh.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-heart wow bounceIn text-primary" data-wow-delay=".3s"></i>
                        <h3>Made with Love</h3>
                        <p class="text-muted">You have to make your websites with love these days!</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="no-padding" id="portfolio">
        <div class="container-fluid">
            <div class="row no-gutter">
                <div class="col-lg-4 col-sm-6">
                    <a href="#" class="portfolio-box">
                        <img src="resources/img/portfolio/1.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                    Project Name
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="#" class="portfolio-box">
                        <img src="resources/img/portfolio/2.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                    Project Name
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="#" class="portfolio-box">
                        <img src="resources/img/portfolio/3.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                    Project Name
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="#" class="portfolio-box">
                        <img src="img/portfolio/4.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                    Project Name
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="#" class="portfolio-box">
                        <img src="resources/img/portfolio/5.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                    Project Name
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="#" class="portfolio-box">
                        <img src="resources/img/portfolio/6.jpg" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                    Project Name
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
   *     </div>
    </section>

    <aside class="bg-dark">
        <div class="container text-center">
            <div class="call-to-action">
                <h2>Free Download at Start Bootstrap!</h2>
                <a href="#" class="btn btn-default btn-xl wow tada">Download Now!</a>
            </div>
        </div>
    </aside>

    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">Let's Get In Touch!</h2>
                    <hr class="primary">
                    <p>Ready to start your next project with us? That's great! Give us a call or send us an email and we will get back to you as soon as possible!</p>
                </div>
                <div class="col-lg-4 col-lg-offset-2 text-center">
                    <i class="fa fa-phone fa-3x wow bounceIn"></i>
                    <p>123-456-6789</p>
                </div>
                <div class="col-lg-4 text-center">
                    <i class="fa fa-envelope-o fa-3x wow bounceIn" data-wow-delay=".1s"></i>
                    <p><a href="mailto:your-email@your-domain.com">feedback@startbootstrap.com</a></p>
                </div>
            </div>
        </div>
    </section>

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
