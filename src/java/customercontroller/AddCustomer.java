package customercontroller;

import dao.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;

public class AddCustomer extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InsertCustomer</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InsertCustomer at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
          PrintWriter out = response.getWriter();
          Customer C=new Customer();
          
          String fname=request.getParameter("txtfname");
          String lname=request.getParameter("txtlname");
          String emailid=request.getParameter("txtemailid");
          String mobileno=request.getParameter("txtmobileno");
          String gender=request.getParameter("txtgender");  
          String state=request.getParameter("txtstate");
          String city=request.getParameter("txtcity");
          String address=request.getParameter("txtaddress");
          String postalcode=request.getParameter("txtpostalcode");
          String password=request.getParameter("txtpassword");
         // String cpassword=request.getParameter("txtcpassword"); 
          try
          {
             int id=CustomerDAO.getCustomerid();
             
             C.setId(id);
             C.setFirstname(fname);
             C.setLastname(lname);
             C.setEmailid(emailid);
             C.setMobileno(mobileno);
             C.setGender(gender);
             C.setState(state);
             C.setCity(city);
             C.setAddress(address);
             C.setPostalcode(postalcode);
             C.setPassword(password);
             
             if(CustomerDAO.isEmailidexist(emailid) || CustomerDAO.isMobilenoexist(mobileno))
                 out.println("Record not inserted");
             else
             {
             CustomerDAO.insertCustomer(C);
             response.sendRedirect("login.jsp?message=You are Successfully Registered");
          }
          }
          catch(Exception e)
          {
              out.println(e);
          }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
