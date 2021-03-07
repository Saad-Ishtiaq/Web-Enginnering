import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class ClientData extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse res){
        res.addHeader("Access-Control-Allow-Origin", "http://localhost:3000");

        ArrayList<Client> clients = new ArrayList<Client>();
        try {
            //adding mysql class
            Class.forName("com.mysql.jdbc.Driver");
            //table name
            final String DB_URL = "jdbc:mysql://localhost:3306/insert_update_delete?";
            //id and password of sql
            final String DB_USER = "root";
            final String DB_PASSWORD = "1234";

            //establishing connection
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            //Sql Statement
            String sqlQuery= "SELECT * FROM `ins_upd_del`";
            PreparedStatement stmt= conn.prepareStatement(sqlQuery);
            ResultSet result= stmt.executeQuery(sqlQuery);
            while (result.next())
            {
                clients.add( new Client(result.getString(1),result.getString(2),result.getString(3)));
            }


        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }

        Gson gson = new GsonBuilder().create();
        JsonArray jarray = gson.toJsonTree(clients).getAsJsonArray();
        JsonObject jsonObject = new JsonObject();
        jsonObject.add("data", jarray);
        try {
                res.setContentType("application/json;charset=UTF-8");
                ServletOutputStream out = res.getOutputStream();
                out.println(jsonObject.toString());
        }
        catch (IOException e) {
                e.printStackTrace();
        }
    }
}
