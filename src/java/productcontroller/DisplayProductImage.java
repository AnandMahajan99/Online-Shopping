package productcontroller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import myConnection.Mycon;

public class DisplayProductImage extends HttpServlet
{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String sid=request.getParameter("id");
        int id = Integer.parseInt(sid);
        Connection con=null;
            try
            {
                con = Mycon.getConnection();
                PreparedStatement ps = con.prepareStatement("select image from product where id=? ");
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                
                if(rs.next())
                {
                    Blob blob=rs.getBlob("image");
                   
                    byte byteArray[] = blob.getBytes(1, (int) blob.length());
                    
                    
                    response.setContentType("image/jpeg");
                    OutputStream os = response.getOutputStream();
                    os.write(byteArray);
                    os.flush();
                    os.close();
                }
                
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            finally
            {
                if(con != null)
                {
                    try
                    {
                        con.close();
                    }
                    catch(Exception e)
                    {
                        e.printStackTrace();
                    }
                }
            }
    }
}
