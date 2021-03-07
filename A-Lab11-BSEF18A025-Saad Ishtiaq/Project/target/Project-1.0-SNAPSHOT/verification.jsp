<%@ page import="java.util.ArrayList" %>
<%

    String username= request.getParameter("username");
    String email= request.getParameter("email");
    String degree= request.getParameter("degree");
    String section= request.getParameter("section");
    String password= request.getParameter("password");
    String [] subjects =request.getParameterValues("subject");

    if (subjects==null || subjects.length==0)
    {
        request.getSession().setAttribute("error", "Invalid subject! Please Select atleast one subject..!");



        RequestDispatcher dispatch = request.getRequestDispatcher("index.jsp");
        dispatch.forward(request,response);
    }



%>



<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Verification</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

    <div style="font-size: 30px; background-color: orange; border-radius: 25px ;margin: 20px ;padding:20px;text-align: center;" >
         <b>Hi <%=username%>! </b> Information Provided by You...

    </div>

    <div style="font-size: 18px;background-color: lightgreen; border-radius: 25px ;margin: 20px ;padding:40px;text-align: left;" >

        <div>

            Name: <%=username%>
            <br>
            Email: <span style="color: blue"><%= email%></span>
            <br>

            Degree: <%=degree%>
            <br>

            Section: <%=section%>
            <br>

            Subjects:
                <br>

            <ul style="margin-left: -20px; margin-top: 10px ;font-size: 15px">
                <% for (int i = 0; i < subjects.length; i++) { %>
                    <li>   <%=subjects[i]%>  </li>
                <% } %>
            </ul>
        </div>
    </div>

    <div style=" margin-left: 35px">
        <form action="index.jsp">
        <button class="btn btn-danger" style="margin-bottom: 10px" >Go Back and Edit</button>
        </form>
        <br>
        <form action="thankyou.jsp">
        <button class="btn btn-success">Approve and Continue</button>
        </form>
    </div>

</body>
</html>