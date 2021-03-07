import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@WebServlet(name = "ConfirmedServlet", value = "/confirmed")


public class ConfirmedServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    {
        response.setContentType("TEXT/HTML");


        try{
            PrintWriter out= response.getWriter();
            out.println("");

            out.println("<div style='margin-right: 500px ; margin-left: 500px'>");
            out.println("<h1 style='text-align: center; background: forestgreen; color:ghostwhite ; border-radius: 35px ; margin-top: 10px; padding: 10px'>Hooray!!!"+ "<br> "+"Order Confirmed...</h1>");
            out.println("<form action='index.html' method='post'>");
            out.println("<button type='submit' >Go To Home Page!!</button>");
            out.println("</form>");
            out.println("</div>");


        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
