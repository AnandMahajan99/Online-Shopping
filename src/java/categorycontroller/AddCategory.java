package categorycontroller;

import dao.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;

public class AddCategory extends HttpServlet
{

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Category C=new Category();
        LocalDateTime ldt;
        String name;       
        name=request.getParameter("txtname");
            try
            {
                int id = CategoryDAO.getCategoryid();
                C.setId(id);
                C.setName(name);
                C.setLastupdatedate(LocalDateTime.now());
                C.setLastupdatetime(LocalDateTime.now());
                if(CategoryDAO.addCategory(C))
                {
                      response.sendRedirect("addCategory.jsp?message=Category+Added");
                }
            }
            catch(Exception e)
            {
                out.println(e);
            }
            out.println("</body>");
            out.println("</html>");

    }
}
