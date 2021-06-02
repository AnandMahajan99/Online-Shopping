<%-- 
    Document   : searchProductById
    Created on : 2 Sep, 2019, 5:35:37 PM
    Author     : DELL
--%>

<%@page import="java.util.List"%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Product</title>
    </head>
    <body>
        <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        session = request.getSession();
        String role = (String)session.getAttribute("role");
        String emailid = (String)session.getAttribute("emailid");
        if(role != null && "admin".equals(role))
        {
    %>
        <jsp:include page="header.html"/>
        <jsp:include page="navbar.jsp"/>
       <center>
           <h1 style="margin-top: 30px">Search Product Details</h1>
           <form action="searchProduct.jsp" method="post" style="margin-top: 30px">
               <h3>Enter Product Id</h3><input type="text" name="txtid"><br/><br/>
               <button type="submit" value="search">Search</button>
           </form> 
           <br/><br/><h1>OR</h1><br/><br/>
           <form action="" method="post">
               <h3>Enter Product Code</h3><input type="text" name="txtcode"><br/><br/>
               <button type="submit" value="search">Search</button>
           </form> 
           <br/><br/><h1>OR</h1><br/><br/>
           <form action="" method="post">
               <h3>Enter Product Name</h3><input type="text" name="txtcode"><br/><br/>
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
              if(P != null)
              {
         %>
              <center>
                <table class="table table-responsive center" style="text-size:3em">
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
                   
                          <td><img src="DisplayProductImage?id=<%=id1%>" width="250px" height="291px"/></td>
                          <td>
                              <%= P.getLastupdatedate().toLocalDate() %>
                              <%= P.getLastupdatetime().toLocalTime() %>
                          </td>
                          <td><%= P.getPrice()%></td>
                          <td><%= P.getDiscount()%></td>
                          <td><%= P.getQuantity()%></td>
                          <td><%= P.getCategoryid()%></td>
                          <td>
                              <a href="#"><button>Delete</button></a><br/><br/>
                              <a href="#"><button>Edit</button></a>
                          </td>
                     </tr>
                  </tbody>
            
        <%
                 out.println("</table>");
              }
              else
                 out.println("<h1>No Product Found</h1>");
           }
        }
        catch(Exception e)
        {
            out.println(e);
        }
        }
        else
            response.sendRedirect("index.jsp");
        %>
       </center>
       <jsp:include page="footer.html"/>
       
    </body>
</html>
