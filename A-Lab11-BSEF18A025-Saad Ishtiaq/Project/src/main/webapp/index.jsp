<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Lab11</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>

<h1 style="color: rebeccapurple; text-align: center">Registration Form</h1>
<div style="padding: 20px; border-radius: 25px; background: peachpuff ;margin: 20px">

    <form action="verification.jsp" method="post">
        <table style="margin-bottom: 50px" >
            <tr>
                <td style="padding: 10px ; width: 100px"><label>Name:</label></td>
                <td > <input placeholder="Name" name="username" value="" style="width: 1150px"> </td>
            </tr>

            <tr>
                <td style="padding: 10px"><label>Email:</label></td>
                <td> <input type="email" placeholder="Email" name="email" value="" style="width: 1150px"> </td>
            </tr>

            <tr>
                <td style="padding: 10px"><label>Password:</label></td>
                <td> <input type="password" value="" name="password" placeholder="Password" style="width: 1150px"></td>
            </tr>

            <tr>
                <td style="padding:10px ;"><h5>Degree:</h5></td>
                <td><select name="degree" id="degree" style="width: 1150px">
                    <option value="Computer Science">Computer Science</option>
                    <option value="Software Engineering">Software Engineering</option>
                    <option value="Information Technology">Information Technology</option>
                </select>
                </td>
            </tr>

            <tr>
                <td style="padding: 10px"><h5>Section:</h5></td>
                <td>
                    <b>
                        <input type="radio" id="Morning" name="section" value="Morning" checked="checked">
                        <label for="Morning">Morning</label><br>
                        <input type="radio" id="Afternoon" name="section" value="Afternoon">
                        <label for="Afternoon">Afternoon</label><br>
                    </b>
                </td>
            </tr>

            <td style="padding: 10px">
                <h5>Subjects:</h5>
            <td>
                <b>
                    <input type="checkbox" name="subject" value="Mathematics">Mathematics
                    <input type="checkbox" name="subject" value="Computer Vision">Computer Vision
                    <input type="checkbox" name="subject" value="Artificial Intelligence">Artificial Intelligence
                    <input type="checkbox" name="subject" value="Web Engineering">Web Engineering
                </b>
            </td>
            </tr>
        </table>

        <button class="btn btn-primary" style="margin-top: -40px">Save and Preview</button>
        <br>

        <div style="color: red ; margin-top: 15px">
        <%
            String error = (String) session.getAttribute("error");


            if(error!=null)
            {
                out.print(error);
            }
            request.getSession().removeAttribute("error");
        %>
        </div>

    </form>
</div>
</body>
</html>