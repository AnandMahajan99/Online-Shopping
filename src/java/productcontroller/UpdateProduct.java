package productcontroller;

import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

public class UpdateProduct extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        PrintWriter out = response.getWriter();
        try 
        {
        String sid = request.getParameter("txtid");
        
        int id = Integer.parseInt(sid);
        
        Product P;
        
        out.println("<!DOCTYPE html>");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet UpdateProduct</title>");            
        out.println("</head>");
        out.println("<body>");
        out.println("<center>");
            P = ProductDAO.searchProductById(id);
           
            if(P != null)
            {  
               out.println("<form action=LastUpdateProduct method=post enctype=multipart/form-data");
                out.println("<table border=1>");
                   out.println("<tr>");
                     out.println("<th>Id</th>");
                     out.println("<td><input type=text name=id value='"+P.getId()+"'></td>");
                   out.println("</tr>");
                   out.println("<tr>");
                     out.println("<th>Code</th>");
                     out.println("<td><input type=text name=code value='"+P.getCode()+"'></td>");
                   out.println("</tr>");
                   out.println("<tr>");
                     out.println("<th>Name</th>");
                     out.println("<td><input type=text name=name value='"+P.getName()+"'></td>");
                   out.println("</tr>");
                   out.println("<tr>");
                     out.println("<th>Description</th>");
                     out.println("<td><input type=text name=description value='"+P.getDescription()+"'></td>");
                   out.println("</tr>");
                   out.println("<tr>");
                     out.println("<th>Image</th>");
                     out.println("<td>");
                         out.println("<img src='"+ P.getImage() +"' width=100px height=100px>");
                         out.println("<br/><br/><input name=txtimage type=file>");
                     out.println("</td>");
                   out.println("</tr>");
                   out.println("<tr>");
                     out.println("<th>Price</th>");
                     out.println("<td><input type=text name=price value='"+P.getPrice()+"'></td>");
                   out.println("</tr>");
                   out.println("<tr>");
                     out.println("<th>Discount</th>");
                     out.println("<td><input type=text name=discount value='"+P.getDiscount()+"'></td>");
                   out.println("</tr>");
                   out.println("<tr>");
                     out.println("<th>Quantity</th>");
                     out.println("<td><input type=text name=quantity value='"+P.getQuantity()+"'></td>");
                   out.println("</tr>");
                   out.println("<tr>");
                     out.println("<th>Categoryid</th>");
                     out.println("<td><input type=text name=categoryid value='"+P.getCategoryid()+"'></td>");
                   out.println("</tr>");
                   out.println("</table>");
                   out.println("<br><br><button type=submit value=update>Update</button>");
                   out.println("</form>");
                   out.println("<br/><br/>");
                   out.println("<form action=updateProduct.jsp>");
                   out.println("<button type=submit value=cancel>Cancel</button>");
                   out.println("</form>");
            }
            else
            {
               response.sendRedirect("updateProduct.jsp?message=Record+Not+Found");
            }
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
