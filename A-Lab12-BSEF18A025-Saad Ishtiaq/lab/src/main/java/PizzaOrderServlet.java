import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;


@WebServlet(name = "PizzaOrderServlet", value = "/order")

public class PizzaOrderServlet extends HttpServlet{
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    {
        String pizzaSize= request.getParameter("pizzaSize");
        request.getSession().setAttribute("pizzaSize", pizzaSize);

        response.setContentType("TEXT/HTML");


        try{
            PrintWriter out= response.getWriter();

            out.println("<div style='margin-right: 500px ; margin-left: 500px'>");
            out.println("<h1 style='text-align: center;background: dodgerblue;color:ghostwhite ; border-radius: 35px ; margin-top: 10px; padding: 10px'>Delivery Info</h1>");
            out.println("<div style='margin-left: 50px; margin-top: 50px'>");
            out.println("<form action='info' method='post'>");
            out.println("<table>");
            out.println("<tr><td>Name:</td> <td><input type='text' name='name' ></td> <tr><td>Address:</td> <td><input type='text' name='address'></td> </tr>");
            out.println("</table>");
            out.println("</br>");
            out.println("<button type='submit' >Submit</button>");
            out.println("</form>");
            out.println("</div>");
            out.println("</div>");


        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
