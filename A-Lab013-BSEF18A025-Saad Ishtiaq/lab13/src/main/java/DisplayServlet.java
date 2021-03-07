import com.google.gson.Gson;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "DisplayServlet", value = "/DisplayServlet")
public class DisplayServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String checkedNumber =request.getParameter("classNumber");

            List<Students> selectedStudents = new ArrayList<>();

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
            String sqlQuery= "SELECT * FROM `students` WHERE `c_id`= '" + checkedNumber + "' ";
            PreparedStatement stmt= conn.prepareStatement(sqlQuery);
            ResultSet result= stmt.executeQuery(sqlQuery);

            while (result.next())
            {
                selectedStudents.add( new Students(result.getString(1),result.getString(2),result.getString(3)));
            }

            String sStudents= new Gson().toJson(selectedStudents);
            response.setContentType("application/json");
            response.getWriter().write(sStudents);


        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
