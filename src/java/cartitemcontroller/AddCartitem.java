package cartitemcontroller;

import dao.CartitemDAO;
import dao.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cartitem;
import myConnection.Mycon;

public class AddCartitem extends HttpServlet 
{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String emailid = (String)session.getAttribute("emailid");
        String sid = request.getParameter("txtproductid");
        String total = request.getParameter("txttotal");
              
        if(emailid != null)
        {
           try
           {   
              if(ProductDAO.stockexist(Integer.parseInt(sid)))
              {
              int cid=0;
        
              con = Mycon.getConnection();
              String sql = "select id from customer where emailid=?";
              ps = con.prepareStatement(sql);
              ps.setString(1, emailid);
              rs = ps.executeQuery();
              if(rs.next())
                  cid = rs.getInt(1);
              Cartitem C = new Cartitem();
              
              C.setId(CartitemDAO.getnextid());
              C.setCustomerid(cid);
              C.setProductid(Integer.parseInt(sid));
              
              int quantity = CartitemDAO.productexist(Integer.parseInt(sid),cid); 
              if(quantity == 0)
              {
                  C.setQuantity(1);
                  C.setTotal(Double.parseDouble(total));
                  if(CartitemDAO.addItem(C))
                    response.sendRedirect("index.jsp?message=Item+Added");
              }
              else if(quantity < 3)
              {
                  quantity = quantity+1;
                  double price = Double.parseDouble(total) * quantity;
                  C.setQuantity(quantity);
                  C.setTotal(price);
                  if(CartitemDAO.updateItemQuantityandPrice(C))
                     response.sendRedirect("index.jsp?message=Item+Added");
              }
               else
                  response.sendRedirect("index.jsp?message=Maximum+Quantity+Reached+In+Cart");
              }
              else
                  response.sendRedirect("index.jsp?message=Stock+Not+Exist");
           }
           catch(Exception e)
           {
             out.println(e);
           }
        }
        else
            response.sendRedirect("login.jsp");
        }
}
