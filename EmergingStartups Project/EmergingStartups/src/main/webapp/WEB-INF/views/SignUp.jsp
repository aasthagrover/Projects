<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="src/main/webapp/WEB-INF/views/SignUp.jsp""IE=edge">
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
function checkusername(){
	

	 if(xmlHttp==null){
         alert("Yor browser does not support ajax");
         return;
     }
	 
	 var x=document.getElementById("username").value;
	 if(x.length!=0 && x!=null){
		
	 var query="action=checkusername&usern="+x;
	 
	 xmlHttp.onreadystatechange=function stateChanged(){
         if(xmlHttp.readyState==4){  
        	 var json=JSON.parse(xmlHttp.responseText);
        	// alert(JSON.stringify(json));
        	// alert(json.username);
        	document.getElementById("errorusername").innerHTML=json.username;
//         	alert(json.username);
//         	if(json.username.localeCompare("Username approved")){
        		
//         		//document.getElementById("use").disabled=false;
           
//         	}
        	var col=document.getElementById("errorusername");
        	 col.style.color="red";
         }
       }
	 
	 xmlHttp.open("POST", "signIn.htm", true);
     xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
     xmlHttp.send(query);
     return false;
	 }
}


function checkEmail(){
	
	var inputText=document.getElementById("email");
	var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;  
	if(inputText.value.match(mailformat))  
	{  
		document.getElementById("submit").disabled=false;
// 	document.form1.text1.focus();  
	return true;  
	 }  
    else  
	{  
    	document.getElementById("erroremail").innerHTML='<span style="color:#FF0000"> Enter a valid email address</span>';
	  
//	document.form1.text1.focus();  
	return false;  
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
                    
						<form:form action="signup.htm" commandName="user" method="POST">  
<table>  
    <tr>
     <td><form:label path="firstName">FirstName:</form:label></td>  
        <td><form:input path="firstName"></form:input></td>  
        <td><form:errors cssStyle="color:red" path="firstName"/></td>
    </tr>  <br>
    <tr>
     <td><form:label path="lastName">LastName:</form:label></td>  
        <td><form:input path="lastName"></form:input></td>  
        <td><form:errors cssStyle="color:red" path="lastName"/></td>
    </tr> 
    <tr>
     <td><form:label path="username">UserName:</form:label></td>  
        <td><form:input path="username" id="username" onchange="return checkusername();"></form:input></td> 
        <td><form:errors cssStyle="color:red" path="username"/></td> 
        <td><small><p id="errorusername"></p></small></td>
        <td><span id="use" style="font-family: Arial Unicode MS, Lucida Grande">&#10004;</span></td>
    </tr>
    <tr>
     <td><form:label path="email.emailId">EmailID:</form:label></td>  
        <td><form:input id="email" path="email.emailId" onchange="return checkEmail();"></form:input></td>  
        <td><form:errors cssStyle="color:red" path="email.emailId"/></td>
        <td><p id="erroremail"></p></td>
    </tr>
    <tr>
     <td><form:label path="location.locationname">Location:</form:label></td>  
        <td><form:input path="location.locationname"></form:input></td>  
        <td><form:errors cssStyle="color:red" path="location.locationname"/></td>
    </tr>
    <tr>
     <td><form:label path="gender">Gender:</form:label></td>  
        <td>Male<form:radiobutton path="gender" value="Male"/></td>        
    </tr>
      <tr> 
        <td></td>
        <td>Female<form:radiobutton path="gender" value="Female"/></td> 
        <td><form:errors cssStyle="color:red" path="gender"/></td>
    </tr>
    <tr>
     <td><form:label path="password">Password:</form:label></td>  
        <td><form:password path="password"></form:password></td>  
        <td><form:errors cssStyle="color:red" path="password"/></td>
    </tr>
       <tr>  
          <td><form:label path="roleType">roleType:</form:label></td>  
          <td>
          <form:select path="roleType">
               <form:option path="roleType" value="Entrepreneur" label="Entrepreneur"/>
               <form:option path="roleType" value="Investor" label="Investor"/>
               <form:option path="roleType" value="Expert" label="Expert"/>
           </form:select>
          </td> 
          <td><form:errors cssStyle="color:red" path="roleType"/></td> 
       </tr>
       <tr>  
          <td><form:label path="category.categoryName">Category:</form:label></td>  
          <td>
          <form:select path="category.categoryName">
               <form:option path="category.categoryName" value="Manufacturing" label="Manufacturing"/>
               <form:option path="category.categoryName" value="Engineering" label="Engineering"/>
               <form:option path="category.categoryName" value="Finance" label="Finance"/>
           </form:select>
          </td> 
          <td><form:errors cssStyle="color:red" path="category.categoryName"/></td> 
       </tr>
       <tr>  
        <td colspan="2">  
            <input type="submit" id="submit" name="signup" value="signup" disabled="disabled">  
       </td>
       </tr> 
   </table>
</form:form> 
						
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
