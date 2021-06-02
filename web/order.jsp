<%-- 
    Document   : order
    Created on : 25 Oct, 2019, 5:08:52 PM
    Author     : DELL
--%>

<%@page import="dao.ProductDAO"%>
<%@page import="model.Product"%>
<%@page import="dao.CartDAO"%>
<%@page import="model.Cartitem"%>
<%@page import="java.util.List"%>
<%@page import="dao.CustomerDAO"%>
<%@page import="model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        session = request.getSession();
        String emailid = (String)session.getAttribute("emailid");
        String role = (String)session.getAttribute("role");
        if(role == "customer" && emailid != null)
        {
            Customer C = null;
            C = CustomerDAO.searchCustomerByemailid(emailid);    
            List<Cartitem> list = CartDAO.displayCart(C.getId());
        %>  
        <jsp:include page="header.html"/>
        <jsp:include page="navbar.jsp"/>
        <div class="container" style="margin-top: 50px">
            <center><h2>Order Details</h2></center>
            <table class="table table-responsive center" style="text-size:3em">
                <thead style="font-size: 25px">
                  <tr>
                    <th></th>
                    <th>Product Name</th>
                    <th>Amount</th>
                </thead>
                <tbody>
            <%
               for(Cartitem item : list)
               {
                  Product P = null;
                  P = ProductDAO.searchProductById(item.getProductid());
            %>
                <tr>
                    <td><input type="checkbox" name="<%=item.getId()%>" checked></td>
                    <td><%=P.getName()%></td>
                    <td>Rs <%=item.getTotal()%></td>
                </tr>
            
        <%
              }
        %>
                <tr><td colspan="3"><hr style="border: 0;height: 10px;box-shadow: 0 10px 10px -10px #8c8b8b inset"></td></tr>
                <tr >
                    <th colspan="2" style="font-size: 1.4em">Total</th>
                    <th style="font-size: 1.4em">Rs <%=CartDAO.carttotal(C.getId())%></th>
                </tr>
                </tbody>
              </table>
              <div class="container register_form">
                <div class="row">
                    <div class="form-group col-md-12  col-xs-12">
                        <form action="payment.jsp" method="post" class="log"> 
                            <button type="submit" name="con" value="continueorder" class="btn btn-lg" style="background-color: #0099ff;color: white;margin-left: 450px;margin-top: 30px;width: 200px">Continue</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
              <%
        }
        else
            response.sendRedirect("index.jsp");
        %>
        <div style="margin-top: 50px">
          <jsp:include page="footer.html"/>
        </div>
    </body>
</html>
