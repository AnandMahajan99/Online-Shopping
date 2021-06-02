package productcontroller;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import myConnection.Mycon;

public class DeleteProduct extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
       PrintWriter out = response.getWriter();
       HttpSession session=request.getSession();
       String sid = session.getAttribute("deleteProductId").toString();
       int id = Integer.parseInt(sid);
      try
      {
          
        ProductDAO p = new ProductDAO();
        if(p.deleteProductById(id))
            out.println("Record Deleted");
      }
      catch(Exception e)
      {
          
      }
    }
}
