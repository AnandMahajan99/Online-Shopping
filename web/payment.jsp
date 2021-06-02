<%-- 
    Document   : payment
    Created on : 26 Oct, 2019, 9:07:20 AM
    Author     : DELL
--%>

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
        if(role == "customer" && emailid != null && "continueorder".equals(request.getParameter("con")))
        {
        %>  
        <jsp:include page="header.html"/>
        <jsp:include page="navbar.jsp"/>
        <div class="container" style="margin-top: 50px;margin-bottom: 50px">
            <center><h2>Select Payment Method</h2></center>
            <h4><input type="radio" name="rd1" value="credit" checked> Credit Card</h4><br/>
            <h4><input type="radio" name="rd1" value="debit" > Debit Card</h4><br/>
            <h4><input type="radio" name="rd1" value="cod"> COD(Cash on Delivery)</h4><br/>
        </div>
        <div class="container register_form">
            <div class="row">
                <div class="form-group col-md-12  col-xs-12">
                    <form action="" method="post" class="log"> 
                        <button type="submit" name="con" value="confirmorder" class="btn btn-lg" style="background-color: #0099ff;color: white;margin-left: 450px;margin-top: 30px;width: 200px">Order Now</button>
                    </form>
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
