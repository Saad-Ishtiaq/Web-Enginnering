<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: Saad  Ishtiaq
  Date: 1/17/2021
  Time: 7:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Web Lab-13 (T2)</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script><!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

    <body>
        <div style="border:3px solid #c11e1e; background: midnightblue; color: white ; margin: 10px ; border-radius: 20px; padding: 20px">
            <center><h2>Login Form</h2></center>
        </div>


        <div style="padding: 10px; margin-left: 300px; margin-right: 300px ; border-style:solid; border-radius: 20px; border-color: #be3b3b; text-align: center">
                <table style="margin-left: 200px ;border-collapse: separate; border-spacing: 15px">
                    <tr>
                        <th>ID:</th>
                        <td><input name="name" type="text" id="nameTag"></td>
                    </tr>
                    <tr>
                        <th>Password:</th>
                        <td><input name="password" type="password" id="passTag"></td>
                    </tr>
                </table>
                <br>
                <button class="btn btn-outline-primary" onclick="enteredValue()" >Login</button>

            <br>
            <br>
            <br>

            <div style="color: green ; margin-left: 30px" id="allow">

            </div>

            <div style="color: red ; margin-left: 30px" id="stop">

            </div>

        </div>

        <script>
         function enteredValue(){
             console.log(document.getElementById("nameTag").value);
             console.log(document.getElementById("passTag").value);
             document.getElementById("stop").innerText="";
             document.getElementById("allow").innerText="";


             let id=document.getElementById("nameTag").value;
             let pass=document.getElementById("passTag").value
             validateUser(id,pass);


         }

         function validateUser(id,pass)
         {
             $.ajax({
                     url:'LoginServlet',
                     data:{
                         id:id,
                         pass:pass,
                     },

                     success: function (response){
                         if(response=="allow")
                         {
                             document.getElementById("allow").innerText="";
                             document.getElementById("allow").innerHTML=("<a href='index.jsp'>Proceed </a>");
                         }
                         else {
                             document.getElementById("stop").innerText="";
                             document.getElementById("stop").innerText="Invalid credentials!!!";
                         }

                     },
                     error: function (){


                     }
                 }
             )

         }


        </script>


    </body>
</html>
