<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>

  <style>
        table{
            border:3px solid black;
        }
        a{
            text-decoration: underline;
            cursor: pointer;
            color:blue;
        }
        span{
            color: red;
        }
    </style>
     <script>
        function signUpFormDisplay(){
            if (document.getElementById("registrationForm").style.display == "none") {
                document.getElementById("registrationForm").style.display = "block";
                document.getElementById("myForm").reset();
                document.getElementById("success").innerHTML = "";
                 document.getElementById("searchForm").style.display = "none"
            } else {
                document.getElementById("registrationForm").style.display = "none"
            }
        }

//         function signInFormDisplay() {
//             if (document.getElementById("searchForm").style.display == "none") {
//                 document.getElementById("searchForm").style.display = "block";
//                 document.getElementById("search").reset();
//                 document.getElementById("results").innerHTML = "";
//                 document.getElementById("registrationForm").style.display = "none";
//             } else {
//                 document.getElementById("searchForm").style.display = "none";
//             }
//         }

//         var xmlHttp;
//         xmlHttp = GetXmlHttpObject();
//         function saveUser() {
            
//             if(xmlHttp==null){
//                 alert("Yor browser does not support ajax");
//                 return;
//             }
            
//             var username=document.getElementById("username").value;
//             var firstname=document.getElementById("firstname").value;
//             var lastname=document.getElementById("lastname").value;
//             var location=document.getElementById("location").value;
//             var email=document.getElementById("email").value;
//             var gender = document.querySelector('input[name = gender]:checked').value;
//             var password=document.getElementById("password").value;
//             var role=document.getElementById("role").value;
           
           
            
//             alert(""+username+" "+firstname+" "+lastname+" "+location+" "+email+" "+password+" "+role+" "+gender+" ");
            
//             var query="action=signup&username="+username+"&firstname="+firstname+"&lastname="+lastname+"location="+location+"&email="+email+"&password="+password+"&role="+role+"&gender="+gender;
          
//           xmlHttp.onreadystatechange=function stateChanged(){
//               if(xmlhttp.readyState==4){
//                   var json=JSON.parse(xmlHttp.responseText);
//                   document.getElementById("success").innerHTML=json.file;
//               }
//           }
//            xmlHttp.open("POST","addUser.htm",true);
//            xmlHttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
//            xmlHttp.send(query);
//            return false;
//         }
        
//         function GetXmlHttpObject()
//         {
//             var xmlHttp = null;
//             try
//             {
//                 // Firefox, Opera 8.0+, Safari
//                 xmlHttp = new XMLHttpRequest();
//             } catch (e)
//             {
//                 // Internet Explorer
//                 try
//                 {
//                     xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
//                 } catch (e)
//                 {
//                     xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
//                 }
//             }
//             return xmlHttp;
//         }
</script>
<body>

<a href="signup.htm">SignUp</a>
<a href="signin">SignIn</a>

</div>

</body>
</html>
