package customercontroller;

import dao.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeleteCustomer extends HttpServlet 
{

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String sid = null;
        int j=0;
        sid = session.getAttribute("deletecustomer").toString();
        for(int i=0;i<sid.length();i++)
        {
            char ch = sid.charAt(i);
            if(Character.isDigit(ch))
                j++;
        }
        try
        {
           if(sid.length() == j)
           {
               int id = Integer.parseInt(sid);
               if(CustomerDAO.deleteCustomerByid(id))
                  response.sendRedirect("deleteCustomer.jsp?message=Record+Deleted");
           }
           else
           {
              // if(CustomerDAO.deleteCustomerByemailid(sid))
                //  response.sendRedirect("deleteCustomer.jsp?message=Record+Deleted");
           }
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }
}
