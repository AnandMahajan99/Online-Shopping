package categorycontroller;

import dao.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;

public class UpdateCategory extends HttpServlet 
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        PrintWriter out=response.getWriter();
        String sid=request.getParameter("txtid");
        int id=Integer.parseInt(sid);
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet UpdateCategory</title>");            
        out.println("</head>");
        out.println("<body>");
        out.println("<center>");
        try 
        {
            Category C=new Category();
            C=CategoryDAO.searchCategoryById(id);
            if(C != null)
            {
                out.println("<form action=LastUpdateCategory method=post");
                out.println("<table>");
                   out.println("<tr>");
                     out.println("<th>Id</th>");
                     out.println("<td><input type=text name=id value='"+C.getId()+"' readonly='readonly' style='Background-color : white'></td>");
                   out.println("</tr>");
                   out.println("<tr>");
                     out.println("<th>Name</th>");
                     out.println("<td><input type=text name=name value='"+C.getName()+"'></td>");
                   out.println("</tr>");
                out.println("</table>");
                out.println("<br><br><button type=submit value=update>Update</button>");
                out.println("</form>");
                out.println("<form action=updateCategory.jsp>");
                   out.println("<button type=submit value=cancel>Cancel</button>");
                out.println("</form>");  
            }
            else
                response.sendRedirect("updateCategory.jsp?message=Record+Not+Found");
        }
        catch (Exception e) 
        {
            out.println(e);
        }
        out.println("</center>");
        out.println("</body>");
        out.println("</html>");
    }
}
