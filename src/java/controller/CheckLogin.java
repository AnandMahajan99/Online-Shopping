package controller;

import dao.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckLogin extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        String emailid = request.getParameter("txtemailid");
        String password = request.getParameter("txtpassword");
        try
        {
           if(CustomerDAO.authenticateCustomer(emailid, password))
           {
             session.setAttribute("emailid",emailid);
             session.setAttribute("role", "customer");
             response.sendRedirect("index.jsp");
           }
           else if(CustomerDAO.authenticateAdmin(emailid, password))
           {
               session.setAttribute("emailid",emailid);
               session.setAttribute("role", "admin");
               response.sendRedirect("adminpage.jsp");
           }
           else 
              response.sendRedirect("login.html?message=Wrong+Id+or+Password");
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }
}
