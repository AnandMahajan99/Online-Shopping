<%-- 
    Document   : adminpage
    Created on : 27 Sep, 2019, 5:43:03 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link href="css/mystyle.css" rel="stylesheet" type="text/css" />
    </head>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        session = request.getSession();
        String role = (String)session.getAttribute("role");
        String emailid = (String)session.getAttribute("emailid");
        if(role != null)
        {
        if("admin".equals(role))
        {   
         out.println(emailid);
    %>
    <body>
        <jsp:include page="header.html"/>
        <jsp:include page="navbar.jsp"/>
      <center>
          <div class="container-fluid">
              <img src="images/banner3.jpg" height="100%" width="100%"/>
              <h1 class="text-uppercase text-center" style="margin-top: -350px; color: white;font-size: 4.5em">Welcome to Admin Page</h1>
          </div>
          <div class="clearfix"></div>
          <div class="container" style="margin-top:300px">
          	<div class="tab1">
		    <div class="col-md-4 product-men">
			<div class="men-pro-item simpleCart_shelfItem">
                            <div style="margin: 30px">
                               <h3>Category</h3>
                            </div>
                            <div style="margin: 30px">
                                <a href="searchCategory.jsp"><button class="mybutton">Search Category</button></a><br/>
                            </div>
                            <div style="margin: 30px">
                                <a href="addCategory.jsp"><button class="mybutton">Add Category</button></a><br/>
                            </div>
                            <div style="margin: 30px">
                                <a href="deleteCategory.jsp"><button class="mybutton">Delete Category</button></a><br/>
                            </div>
                            <div style="margin: 30px">
                                <a href="updateCategory.jsp"><button class="mybutton">Update Category</button></a>
                            </div>
                            <div style="margin: 30px">
                                <a href="displayAllCategory.jsp"><button class="mybutton">Display Category List</button></a>
                            </div>
		        </div>
		    </div>
                    <div class="col-md-4 product-men">
			<div class="men-pro-item simpleCart_shelfItem">
                            <div style="margin: 30px">
                               <h3>Product</h3>
                            </div>
                            <div style="margin: 30px">
                                <a href="searchProduct.jsp"><button class="mybutton">Search Product</button></a><br/>
                            </div>
                            <div style="margin: 30px">
                                <a href="addProduct.jsp"><button class="mybutton">Add Product</button></a><br/>
                            </div>
                            <div style="margin: 30px">
                                <a href="deleteProduct.jsp"><button class="mybutton">Delete Product</button></a><br/>
                            </div>
                            <div style="margin: 30px">
                                <a href="updateProduct.jsp"><button class="mybutton">Update Product</button></a>
                            </div>
                            <div style="margin: 30px">
                                <a href="displayAllProducts.jsp"><button class="mybutton">Display Product List</button></a>
                            </div>
		        </div>
		    </div>
                    <div class="col-md-4 product-men">
			<div class="men-pro-item simpleCart_shelfItem">
                            <div style="margin: 30px">
                               <h3>Customer</h3>
                            </div>
                            <div style="margin: 30px">
                                <a href="searchCustomer.jsp"><button class="mybutton">Search Customer</button></a><br/>
                            </div>
                            <div style="margin: 30px">
                                <a href="deleteCustomer.jsp"><button class="mybutton">Delete Customer</button></a><br/>
                            </div>
                            <div style="margin: 30px">
                                <a href="updateCustomer.jsp"><button class="mybutton">Update Customer</button></a>
                            </div>
                            <div style="margin: 30px">
                                <a href="displayAllCustomer.jsp"><button class="mybutton">Display Customer List</button></a>
                            </div>
		        </div>
		    </div>
                    <div class="clearfix"></div>
                    <div class="col-md-4 product-men">
			<div class="men-pro-item simpleCart_shelfItem">
                            <div style="margin: 30px">
                               <h3>Order</h3>
                            </div>
                            <div style="margin: 30px">
                               <a href=""><button class="mybutton">Search Order</button></a><br/>
                            </div>
                            <div style="margin: 30px">
                               <a href=""><button class="mybutton">Delete Order</button></a><br/>
                            </div>
                            <div style="margin: 30px">
                               <a href=""><button class="mybutton">Update Order</button></a>
                            </div>
		        </div>
		    </div>
                    <div class="col-md-4 product-men">
			<div class="men-pro-item simpleCart_shelfItem">
                            <div style="margin: 30px">
                               <h3>Payment</h3>
                            </div>
                            <div style="margin: 30px">
                               <a href=""><button class="mybutton">Search Payment</button></a><br/>
                            </div>
                            <div style="margin: 30px">
                               <a href=""><button class="mybutton"></button></a><br/>
                            </div>
                            <div style="margin: 30px">
                               <a href=""><button class="mybutton"></button></a>
                            </div>
		        </div>
		    </div>
                    <div class="col-md-4 product-men">
			<div class="men-pro-item simpleCart_shelfItem">
                            <div style="margin: 30px">
                               <h3>Other</h3>
                            </div>
                            <div style="margin: 30px">
                               <a href=""><button class="mybutton"></button></a><br/>
                            </div>
                            <div style="margin: 30px">
                               <a href=""><button class="mybutton"></button></a><br/>
                            </div>
                            <div style="margin: 30px">
                               <a href=""><button class="mybutton"></button></a>
                            </div>
		        </div>
		    </div>
                    <div class="clearfix"></div>
                </div>
          </div>
       
      </center >
      <div style="margin-top: 400px"></div>
        <jsp:include page="footer.html"/>
    </body>
    <%
        }
        else
            response.sendRedirect("index.jsp");
        }
        else
        {
            response.sendRedirect("index.jsp");
        }
    %>
</html>
