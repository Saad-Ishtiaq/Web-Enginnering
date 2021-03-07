import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;


@WebServlet(name = "AddressInfoServlet", value = "/info")

public class AddressInfoServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    {
        String name= request.getParameter("name");
        String address= request.getParameter("address");

        request.getSession().setAttribute("name", name);
        request.getSession().setAttribute("address", address);
        String pizzaSize=(String) request.getSession().getAttribute("pizzaSize");
        response.setContentType("TEXT/HTML");


        try{
            PrintWriter out= response.getWriter();
            out.println("");

            out.println("<div style='margin-right: 500px ; margin-left: 500px'>");
            out.println("<h1 style='text-align: center; background: dodgerblue; color:ghostwhite ; border-radius: 35px ; margin-top: 10px; padding: 10px'>Confirmation</h1>");
            out.println("<div style='margin-left: 50px; margin-top: 50px'>");
            out.println("<form action='confirmed' method='post'>");
            out.println("<table>");
            out.println("<tr><td>Name:</td> <td>"+ name +"</td> <tr><td>Address:</td> <td>"+ address +"</td> <tr><td>Pizza Size:</td> <td>"+  pizzaSize+"</td> </tr>");
            out.println("</table>");
            out.println("</br>");
            out.println("<button type='submit' >Confirm</button>");
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
