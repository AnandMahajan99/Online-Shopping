<%-- 
    Document   : checkout
    Created on : 2 Oct, 2019, 11:33:16 AM
    Author     : DELL
--%>

<%@page import="model.Customer"%>
<%@page import="dao.CustomerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
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
        %>  
        <jsp:include page="header.html"/>
        <jsp:include page="navbar.jsp"/>
        
            <div class="container">
                <center>
                    <h2 style="margin-top: 50px"><b>Choose Delivery Address</b></h2><br/><br/>
                    <h3 style="margin-bottom: 10px">Existing Address</h3>
                    <h4><%=C.getAddress()+" , "+C.getCity()+" , "+C.getState()+" , "+C.getPostalcode()%></h4>
                    <h2 style="margin: 30px">OR</h2> 
                </center>
            </div>
           
            <div class="container register_form">
                <div class="row">
                    <center>
                        <h3 style="margin: 10px">Add New Address</h3>
                    </center>
                    <fieldset style="border: 2px solid #17c3a2; padding: 30px">
                    <div class="form-group col-md-12  col-xs-12">
                        <form action="" method="post" class="log">
                          <div class="form-row">   
                            <div class="form-group col-md-6">
                               <label for="inputState">State</label>
                               <select name="txtstate" id="" class="form-control">
                                    <option selected>Madhya Pradesh</option>
                                    <option>Uttar Pradesh</option>
                                    <option>Rajasthan</option>
                                    <option>Uttarakhand</option>
                                    <option>Bihar</option>
                                    <option>Punjab</option>
                                    <option>Arunachal Pradesh</option>
                                    <option>Kerala</option>
                                    <option>TamliNadu</option>
                                    <option>Gujarat</option>
                              </select>
                            </div>
                          <div class="form-group col-md-6">
                              <label>City</label>
                              <select name="txtcity" id="" class="form-control">
                                   <option selected>Indore</option>
                                   <option></option>
                                   <option>Jaipur</option>
                                   <option></option>
                                   <option></option>
                                   <option></option>
                                   <option></option>
                                   <option></option>
                                   <option></option>
                                   <option>Ahemdabad</option>
                             </select>
                          </div>
                            </div>
                 <div class="form-row">
                     <div class="form-group col-md-6">
                         <label>Address</label>
                         <input type="text" class="form-control" name="txtaddress" placeholder="Enter FirstName" required>
                     </div>
                     <div class="form-group col-md-6">
                         <label>Postalcode</label>
                         <input type="number" class="form-control" name="txtpostalcode" placeholder="Enter LastName" required>
                     </div>
                 </div>
                 <div class="form-row">
                     <div class="form-group col-md-5">
                         <button type="submit" class="btn btn-success btn-block" value="submit">Submit</button>
                     </div>
                     <div class="form-group col-md-2"></div>
                     <div class="form-group col-md-5">
                         <button type="reset" class="btn btn-primary btn-block" value="reset">Reset</button>
                     </div>
                </div>
             </form>
            </div>
                    </fieldset>
            <div class="col-md-4 col-sm-4 col-xs-12"></div>
        </div>
        <div class="">
            <div class="container register_form">
                <div class="row">
                    <div class="form-group col-md-12  col-xs-12">
                        <form action="order.jsp" method="post" class="log"> 
                            <button type="submit" value="continue" class="btn btn-lg" style="background-color: #0099ff;color: white;margin-left: 450px;margin-top: 30px;width: 200px">Continue</button>
                        </form>
                    </div>
                </div>
            </div>
        </div> 
    </div>
        <%
        }
        else
             response.sendRedirect("index.jsp");
        %>
        <div style="margin-top: 100px">
          <jsp:include page="footer.html"/>
        </div>
    </body>
</html>
