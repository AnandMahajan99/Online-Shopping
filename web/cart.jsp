<%-- 
    Document   : cart
    Created on : 20 Sep, 2019, 5:24:39 PM
    Author     : DELL
--%>

<%@page import="model.Customer"%>
<%@page import="dao.CustomerDAO"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.Cartitem"%>
<%@page import="java.util.List"%>
<%@page import="dao.CartDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
    </head>
    <body>
    <jsp:include page="header.html"/>
    <jsp:include page="navbar.jsp"/>
    <center>
        <%
            String emailid = (String)session.getAttribute("emailid");
            String url = request.getParameter("page");
            if(emailid == null && url != null)
                response.sendRedirect(url.substring(url.lastIndexOf("/")+1, url.length())+"?message=Login+to+view+cart");
            else if(emailid == null)
                response.sendRedirect("index.jsp");
            else
            {
                Customer C = null;
                C = CustomerDAO.searchCustomerByemailid(emailid);
                
                List<Cartitem> list = CartDAO.displayCart(C.getId());
                if(list != null)
                {
         %>
         <h1 style="margin-top: 30px;margin-bottom: 30px">MyCart</h1>
        <table class="table table-responsive center" style="text-size:3em">
            <thead style="font-size: 25px">
                <tr>
                  <th>Product Name</th>
                  <th>Image</th>
                  <th>Price</th>
                  <th>Discount/Piece</th>
                  <th>Quantity</th>
                  <th>Total Price</th>
                  <th></th>
                </tr>
            </thead>
            
                <%
                   for(Cartitem item : list)
                   {
                      Product P = null;
                      P = ProductDAO.searchProductById(item.getProductid());
                %>
            <tbody style="font-size: 25px">
                <tr>
                   <td style="margin-top: 50px"><%=P.getName()%></td>
                   <td><img src="<%=P.getImage()%>" width="250px" height="290px"/></td>
                   <td><%=P.getPrice()%></td>
                   <td><%=P.getDiscount()%></td>
                   <td><%=item.getQuantity()%></td>
                   <td><%=item.getTotal()%></td>
                   <td>
                       <a href="DeleteCartitem?txtid=<%=item.getId()%>"><button type="submit"value="delete">Remove</button></a>
                       <a href="#"><button type="submit"value="Update">Edit</button></a>
                   </td>
                </tr>
        <%
                        }
                out.println("<tr style='background-color:skyblue'>");
                out.println("<td colspan=6>Cart Total</td>");
                out.println("<td>"+CartDAO.carttotal(C.getId())+"</td>");
                out.println("</tr>");
                out.println("</tbody>");
                out.println("</table>");
%>
            <hr style="width: 2px">
            <button class="btn btn-primary" type="submit">Clear Cart</button>
            <a href="checkout.jsp"><button class="btn btn-success" type="submit">Checkout</button></a>
            <%
                }
                else
                    out.println("<h1 style='margin-top: 50px;margin-bottom: 200px'>Cart is Empty</h1>");
            }
            %>
    </center>
            <jsp:include page="footer.html"/>
    </body>
</html>
