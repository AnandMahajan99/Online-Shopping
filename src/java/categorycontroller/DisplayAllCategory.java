//This is not in use
package categorycontroller;

import dao.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;

public class DisplayAllCategory extends HttpServlet 
{

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        PrintWriter out=response.getWriter();
        List<Category> list=null;
        
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet DisplayAllCategory</title>");            
        out.println("</head>");
        out.println("<body>");
        try
        {
           list = CategoryDAO.displayAllCategory();
           if(list != null)
           {
            out.println("<center>");
            out.println("<table border=1>");
            out.println("<tr>");
            out.println("<th>Id</th>");
            out.println("<th>Name</th>");
            out.println("<th>LastUpdateDate</th>");
            out.println("<th>LastUpdateTime</th>");
            out.println("</tr>");
            for(Category C: list)
            {    
                out.println("<tr>");
                out.println("<td>"+C.getId()+"</td>");
                out.println("<td>"+C.getName()+"</td>");
                out.println("<td>"+C.getLastupdatedate().toLocalDate()+"</td>");
                out.println("<td>"+C.getLastupdatetime().toLocalTime()+"</td>");
                out.println("<td><button type=submit value=delete onclick="+CategoryDAO.deleteCategoryById(C.getId())+">Delete</button></td>");
                out.println("</tr>");
            }
            out.println("</table>");
         }
        else
            out.println("<h1>No Category Found</h1>");
      }
        catch(Exception e)
        {
            out.println(e);
        }
    }
}
