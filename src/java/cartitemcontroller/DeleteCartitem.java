package cartitemcontroller;

import dao.CartitemDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteCartitem extends HttpServlet 
{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException 
    {
       PrintWriter out = resp.getWriter();
        String sid = req.getParameter("txtid");
        int id = Integer.parseInt(sid);
        try
        {
        if(CartitemDAO.deleteById(id))
        {
            resp.sendRedirect("cart.jsp?message=Record+Deleted");
        }
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }
    //Not Used
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        PrintWriter out = response.getWriter();
        String sid = request.getParameter("txtid");
        int id = Integer.parseInt(sid);
        try
        {
        if(CartitemDAO.deleteById(id))
        {
            response.sendRedirect("cart.jsp?message=Record+Deleted");
        }
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }
}
