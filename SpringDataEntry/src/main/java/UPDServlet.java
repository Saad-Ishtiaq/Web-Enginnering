import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


@WebServlet(name="Update", value="/upd")

public class UPDServlet  extends HttpServlet {
    private String message;

    public void init() {
        message = "Home Page";
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
    {
        try {
            //installing mysql driver
            Class.forName("com.mysql.jdbc.Driver");

            //table name
            final String DB_URL = "jdbc:mysql://localhost:3306/insert_update_delete?";

            //id and password of sql
            final String DB_USER = "root";
            final String DB_PASSWORD = "1234";
            //establishing connection
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            //Sql Query
            String sqlQuery= "UPDATE `ins_upd_del` SET `name`=(?) ,`address`=(?) , `number`=(?)  WHERE `number`= (?)";
            PreparedStatement stmt= conn.prepareStatement(sqlQuery);
            stmt.setString(1,req.getParameter("name"));
            stmt.setString(2,req.getParameter("address"));
            stmt.setString(3,req.getParameter("number"));
            stmt.setString(4,req.getParameter("checkedRow"));
            int i=stmt.executeUpdate();
            PrintWriter out= res.getWriter();
            out.println(i+" row Updated");

            res.setContentType("text/html");
            PrintWriter pout= res.getWriter();

            pout.println("<html><body><form action='http://localhost:8081/SpringDataEntry_war_exploded/main'>");
            pout.println("<button>" + message + "</button>");
            pout.println("</form></body></html>");
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }
}
