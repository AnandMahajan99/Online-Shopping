<%-- 
    Document   : displayAllProduct
    Created on : 1 Sep, 2019, 10:30:49 AM
    Author     : DELL
--%>

<%@page import="java.io.OutputStream"%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display All Product</title>
    </head>
    <body>
        <% 
        session = request.getSession();
        String role = (String)session.getAttribute("role");
        if(role == "admin")
        {
        %>  

        <jsp:include page="header.html"/>
        <jsp:include page="navbar.jsp"/>
        <%
        List<Product> list=null;
        
        byte[] img=null;
        try
        {
           list = ProductDAO.displayAllProduct();
           if(list != null)
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
                </tr>
                 </thead>
          <%
            for(Product P: list)
            {    
           %>
           <tbody>
             <tr>
                    <td><%= P.getId() %></td>
                    <td><%= P.getCode()%></td>
                    <td><%= P.getName() %></td>
                    <td><%= P.getDescription()%></td>
                  <%  
                     long sid = P.getId();
                     String id=Long.toString(sid);
                   %>
                   
                   <td><img src="DisplayProductImage?id=<%=id%>" width="250px" height="290px"/></td>
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
            }
            out.println("</table>");
         }
        else
            out.println("<h1>No Product Found</h1>");
      }
        catch(Exception e)
        {
            out.println(e);
        }
        }
        else
            response.sendRedirect("index.jsp");
        %>
        <jsp:include page="footer.html"/>
    </body>
</html>

<h1>.table .table-hover class</h1>
