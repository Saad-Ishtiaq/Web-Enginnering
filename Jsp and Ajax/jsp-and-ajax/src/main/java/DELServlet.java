import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class DELServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Home Page";
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException
    {
        try {
            String checkedNumber =req.getParameter("checkedRow");

            if (checkedNumber==null)
            {
                req.getSession().setAttribute("error", "Invalid command! Please Select atLeast one Row..!");
                RequestDispatcher dispatch = req.getRequestDispatcher("DeletePage.jsp");
                dispatch.forward(req,res);
            }



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
            String sqlQuery= "DELETE FROM `ins_upd_del` WHERE `number`= (?)";
            PreparedStatement stmt= conn.prepareStatement(sqlQuery);
            stmt.setString(1,req.getParameter("checkedRow"));
            int i=stmt.executeUpdate();
            PrintWriter out= res.getWriter();
            out.println(i+" row deleted");

            res.setContentType("text/html");
            PrintWriter pout= res.getWriter();

            pout.println("<html><body><form action='index.jsp'>");
            pout.println("<button>" + message + "</button>");
            pout.println("</form></body></html>");
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }
}
