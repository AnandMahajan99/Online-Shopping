package categorycontroller;

import dao.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;

public class LastUpdateCategory extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        PrintWriter out = response.getWriter();
        Category C = new Category();
        LocalDateTime ldt;
        
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet AddProduct</title>");            
        out.println("</head>");
        out.println("<body>");
        out.println("<center>");

        String sid = request.getParameter("id");
        String name=request.getParameter("name");
        try
        {
            C.setId(Integer.parseInt(sid));
            C.setName(name);
            C.setLastupdatedate(LocalDateTime.now());
            C.setLastupdatetime(LocalDateTime.now());
            out.println(name+" "+sid);
            if(CategoryDAO.updateCategoryById(C))
            {
                response.sendRedirect("updateCategory.jsp?message=Record+Updated");
            }
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }

}
