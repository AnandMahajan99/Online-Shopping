<%-- 
    Document   : addProduct
    Created on : 31 Aug, 2019, 5:51:43 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
    </head>
    <body>
        <jsp:include page="header.html"/>
        <jsp:include page="navbar.jsp"/>
       <center>
           <h1>ADD NEW PRODUCT</h1>
           <table>
               <form action="AddProduct" method="post" enctype="multipart/form-data">
               <tr>
                   <th> Enter Code </th>
                   <td> <input type="text" name="txtcode"> </td>
               </tr>
               <tr>
                   <th> Enter Name </th>
                   <td> <input type="text" name="txtname"> </td>
               </tr>
               <tr>
                   <th> Enter Description </th>
                   <td> <textarea name="txtdescription"></textarea> </td>
               </tr>
               <tr>
                   <th> Select Image</th>
                   <td> <input type="file" name="txtimage"> </td>
               </tr>
               <tr>
                   <th> Enter Price </th>
                   <td> <input type="text" name="txtprice"> </td>
               </tr>
               <tr>
                   <th> Enter Discount </th>
                   <td> <input type="text" name="txtdiscount"> </td>
               </tr>
               <tr>
                   <th> Enter Quantity </th>
                   <td> <input type="text" name="txtquantity"> </td>
               </tr>
               <tr>
                   <th> Enter CategoryId </th>
                   <td> <input type="text" name="txtcategoryid"> </td>
               </tr>
               <tr>
                   <th></th>
                   <td><button type="submit" value="submit">Submit</button>
               </tr>
               </form>
           </table>
           <%
               String msg = null;
               msg = request.getParameter("message");
               if(msg != null)
                  out.println("<h2>"+msg+"<h2>");
           %>
       </center>
        <jsp:include page="footer.html"/>
    </body>
</html>
