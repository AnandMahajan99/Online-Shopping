<%-- 
    Document   : register
    Created on : 2 Oct, 2019, 11:40:24 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
        <script language="javascript">
               function a()
               {
                   setTimeout(function(){
                       $('#div1').fadeOut('fast');
                   },3000);
                  
               }
        </script>
            
    </head>
    <body onload="a();">
    <jsp:include page="header.html"/>
    <jsp:include page="navbar.jsp"/>
    <%
        session = request.getSession();
        String emailid = (String)session.getAttribute("emailid");
        if(emailid == null)
        {
    %>
    <div  id="div1" class="alert alert-danger alert-dismissible">
        <a class="close" data-dismiss="alert" aria-lable="close">&times;</a>
      <h1 id="msg1">welcome</h1>  
    </div><br/>
    
 <div class="container register_form">
    <div class="row">
       <div class="form-group col-md-12  col-xs-12">
            <form action="AddCustomer" method="post" class="log">
                 <div class="form-row">
                     <div class="form-group col-12">
                         <h1 class="text-center heading">Personal Information</h1>
                         <p class="text-center" style="font-size: 25px">Enter your Personal Information here</p>
                     </div>
                </div>
                <div class="form-row">
                     <div class="form-group col-md-6">
                         <label>FirstName</label>
                         <input type="text" class="form-control" name="txtfname" placeholder="Enter FirstName" required>
                     </div>
                     <div class="form-group col-md-6">
                         <label>LastName</label>
                         <input type="text" class="form-control" name="txtlname" placeholder="Enter LastName" required>
                     </div>
                 </div>
                 <div class="form-row">
                     <div class="form-group col-md-6">
                         <label>EmailId</label>
                         <input type="email" class="form-control" name="txtemailid" placeholder="Enter FirstName" required>
                     </div>
                     <div class="form-group col-md-6">
                         <label>Mobileno.</label>
                         <input type="tel" class="form-control" name="txtmobileno" placeholder="Enter LastName" required>
                     </div>
                 </div>
                <div class="form-row">
                     <div class="form-group col-md-6">
                         <label>Password</label>
                         <input type="password" class="form-control" name="txtpassword" placeholder="Enter FirstName" required>
                     </div>
                     <div class="form-group col-md-6">
                         <label>Confirm Password</label>
                         <input type="password" class="form-control" name="txtcpassword" placeholder="Enter LastName" required>
                     </div>
                 </div>
                 <label>Gender</label><br/>
                 <div class="form-check form-check-inline">
                     <input class="form-check-input" type="radio" name="txtgender" value="Male" checked>
                     <label class="form-check-label">Male</label>
                 </div>
                 <div class="form-check form-check-inline">
                     <input class="form-check-input" type="radio" name="txtgender" value="Female">
                     <label class="form-check-label">Female</label>
                 </div><br/>
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
        <div class="col-md-4 col-sm-4 col-xs-12"></div>
    </div>
</div>
    <%
        }
        else
            response.sendRedirect("index.jsp");
    %>
    <jsp:include page="footer.html"/>
    </body>
</html>
