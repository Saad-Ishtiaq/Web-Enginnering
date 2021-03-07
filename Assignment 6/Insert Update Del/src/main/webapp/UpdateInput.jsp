<%--
  Created by IntelliJ IDEA.
  User: Saad  Ishtiaq
  Date: 1/11/2021
  Time: 12:58 PM
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>Assignment 6</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<body>
<div style=" background: #beb400; color: white ; margin: 10px ; border-radius: 20px; padding: 20px">
    <center><h2>Update Form</h2></center>
</div>
<%
    String checkedNumber =request.getParameter("checkedRow");

    if (checkedNumber==null)
    {
    request.getSession().setAttribute("error", "Invalid command! Please Select atLeast one Row..!");
    RequestDispatcher dispatch = request.getRequestDispatcher("UpdatePage.jsp");
    dispatch.forward(request,response);
    }
%>


<div style="padding: 10px; margin-left: 300px; margin-right: 300px ; border-style:solid; border-radius: 20px; border-color: #beb400; text-align: center">
    <form action="upd" method="post">
        <table style="margin-left: 200px ;border-collapse: separate; border-spacing: 15px">
            <tr>
                <th>Client with number to be Changer </th>
                <td><input name="checkedRow" value=<%=checkedNumber%> /></td>
            </tr>

            <tr>
                <th>Name:</th>
                <td><input name="name" type="text"></td>
            </tr>
            <tr>
                <th>Address:</th>
                <td><input name="address" type="text"></td>
            </tr>
            <tr>
                <th>Cell Number:</th>
                <td><input name="number" type="text"></td>
            </tr>

        </table>
        <br>
        <button class="btn btn-outline-primary">Update Client Information</button>
    </form>
</div>

