
package categorycontroller;

import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeleteCategory extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, 
            IOException 
    {
        PrintWriter out = resp.getWriter();
        String sid=req.getParameter("txtid");
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet FirstDeleteCategoryById</title>");            
        out.println("</head>");
        out.println("<body>");
        
        int id=Integer.parseInt(sid);
        try 
        {    
            if(CategoryDAO.deleteCategoryById(id))
            {
                out.println("<h1>Record Deleted Sucessfully</h1>");
                out.println("Click <a href=displayAllCategory.jsp>here</a>for go back");
            }
            else
                out.println("Record not deleted");
        } 
        catch (Exception e) 
        {
            out.println(e);
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws 
            ServletException,IOException 
    {
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet FirstDeleteCategoryById</title>");            
        out.println("</head>");
        out.println("<body>");
        try
        {
            HttpSession session=request.getSession();
            String sid=session.getAttribute("categoryid").toString();
            int id=Integer.parseInt(sid);
            if(ProductDAO.productReferCategory(id))
            {
                response.sendRedirect("deleteCategory.jsp?message=Record+Can't+Delete+Product+Exist+First+Delete+Product");
            }
           if(CategoryDAO.deleteCategoryById(id))
           {
               response.sendRedirect("deleteCategory.jsp?message=Record+Deleted+Successfully");
           }
           else
               response.sendRedirect("deleteCategory.jsp?message=Record+Not+Deleted");
        }
        catch(Exception e)
        {
            out.println(e);
        }
        out.println("</center>");
        out.println("</body>");
        out.println("</html>");
    }
}
