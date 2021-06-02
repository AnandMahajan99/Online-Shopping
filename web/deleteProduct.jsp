<%-- 
    Document   : deleteProductById
    Created on : 14 Sep, 2019, 11:36:16 AM
    Author     : DELL
--%>

<%@page import="dao.ProductDAO"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Product By Id</title>
    </head>
    <body>
        <jsp:include page="header.html"/>
        <jsp:include page="navbar.html"/>
    <center>
         <h1 style="margin-top: 30px">Delete Product</h1>
           <form action="deleteProduct.jsp" method="post"  style="margin-top: 30px">
               <h3>Enter Product Id</h3><input type="text" name="txtid"><br/><br/>
               <button type="submit" value="search">Search</button>
           </form>
           <%
        Product P=null;
        byte[] img=null;
        String sid=null;
        int id;
        sid=request.getParameter("txtid");
        try
        {
           if(sid != null)
           {
                   
              id = Integer.parseInt(sid);
              P = ProductDAO.searchProductById(id);
              if(P.getId() != 0)
              {
                  session.setAttribute("deleteProductId", P.getId());
         %>
              <center>
                  <h1>Product Details</h1>    
                  <form action="DeleteProduct" method="post">
                <table class="table table-responsive center" style="font-size:1em">
                  <thead class="">
                     <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Code</th>
                        <th scope="col">Name</th>
                        <th scope="col">Description</th>
                        <th scope="col">Image</th>
                        <th scope="col">LastUpdate</th>
                        <th scope="col">Price</th>
                        <th scope="col">Discount</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">CategoryId</th>
                        <th scope="col"></th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                         <td><%= P.getId() %></td>
                         <td><%= P.getCode()%></td>
                         <td><%= P.getName() %></td>
                         <td><%= P.getDescription()%></td>
                  <%  
                         long sid1 = P.getId();
                         String id1=Long.toString(sid1);
                   %>
                   
                          <td><img src="DisplayProductImage?id=<%=id1%>" width="400px" height="300px"/></td>
                          <td>
                              <%= P.getLastupdatedate().toLocalDate() %>
                              <%= P.getLastupdatetime().toLocalTime() %>
                          </td>
                          <td><%= P.getPrice()%></td>
                          <td><%= P.getDiscount()%></td>
                          <td><%= P.getQuantity()%></td>
                          <td><%= P.getCategoryid()%></td>
                     </tr>
                  </tbody>
                  </table>
                     
                      <button type="submit" class="btn btn-primary">Delete</button>
                  </form>
                     <form action="deleteProduct.jsp" method="post">
                      <button type="submit" class="btn btn-primary">Cancel</button>
                  </form>
        <%
              }
              else
                 out.println("<h1>No Product Found</h1>");
           }
        }
        catch(Exception e)
        {
            out.println(e);
        }
        %>
    </center>
    <jsp:include page="footer.html"/>
    </body>
</html>
