<%-- 
    Document   : updateProduct
    Created on : 14 Sep, 2019, 12:46:46 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <div style="margin-bottom: 100px">
           <jsp:include page="header.html"/>
           <jsp:include page="navbar.jsp"/>
        </div>
        <center>
            <h1>Update Product</h1><br/>
            <h2>By Id</h2><br/>
            <form action="UpdateProduct" method="post">
                    Enter Product Id <input type="text" name="txtid"><br/><br/>
                    <button type="submit">Update</button>
            </form>
            <%
                String msg =null;
                msg = request.getParameter("message");
                if(msg != null)
                out.println("<h2>"+msg+"</h2>");
            %>
            <div style="margin-top: 100px">
              <jsp:include page="footer.html"/>
            </div>
        </center>
    </body>
</html>
