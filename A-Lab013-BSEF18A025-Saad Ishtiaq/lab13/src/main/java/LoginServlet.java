import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        try {

            String id=request.getParameter("id");
            String pass=request.getParameter("pass");

            //installing mysql driver
            Class.forName("com.mysql.jdbc.Driver");
            //table name
            final String DB_URL = "jdbc:mysql://localhost:3306/lab12?";
            //id and password of sql
            final String DB_USER = "root";
            final String DB_PASSWORD = "1234";
            //establishing connection
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            //Sql Statement
            String sqlQuery= "SELECT * FROM `login` WHERE `id`= '" + id + "' ";
            PreparedStatement stmt= conn.prepareStatement(sqlQuery);
            ResultSet result= stmt.executeQuery(sqlQuery);

            //to check
            int check = -1;

            while (result.next())
            {
                String userId =result.getString("id");
                String userPass= result.getString(("password"));

                if (userId.equals((id))&& (userPass.equals(pass)))
                {
                    check=1;
                    response.setContentType("text/plain");
                    response.getWriter().write("allow");
                }

            }
            if(check==-1)
            {
                response.setContentType("text/plain");
                response.getWriter().write("dontAllow");
            }



        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
