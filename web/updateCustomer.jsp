<%-- 
    Document   : updateCustomer
    Created on : 16 Sep, 2019, 7:11:59 PM
    Author     : DELL
--%>

<%@page import="model.Customer"%>
<%@page import="dao.CustomerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Customer Datails</title>
    </head>
    <body>
        <center>
           <h1 style="margin-top: 30px">Search Customer Details</h1>
           <form action="updateCustomer.jsp" method="post" style="margin-top: 30px">
               <h3>Enter Customer Id</h3><input type="text" name="txtid"><br/><br/>
               <button type="submit" value="search">Edit</button>
           </form> 
           <br/><br/><h1>OR</h1><br/><br/>
           <form action="updateCustomer.jsp" method="post">
               <h3>Enter Customer EmailId</h3><input type="email" name="txtemailid"><br/><br/>
               <button type="submit" value="search">Edit</button>
           </form>
        </center>
    </body>
</html>
