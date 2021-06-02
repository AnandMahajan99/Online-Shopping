<%-- 
    Document   : index
    Created on : 14 Sep, 2019, 10:09:08 AM
    Author     : DELL
--%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
        <script language="javascript">
               function a()
               {
                   setTimeout(function(){
                       $('#div1').fadeOut('fast');
                   },3000);
                  
               }
        </script>
    </head>
    <body onload="a()">
        <jsp:include page="header.html"/>
        <jsp:include page="navbar.jsp"/>
        <%
            String msg = null;
            msg = request.getParameter("message");
            if(msg != null)
            {
        %>
        <div  id="div1" class="alert alert-danger alert-dismissible">
            <a class="close" data-dismiss="alert" aria-lable="close">&times;</a>
            <p id="msg1" style="margin-left: 45%"><%=msg%></p>  
        </div>
        <%
            }
        List<Product> list=null;
        byte[] img=null;
        try
        {
           list = ProductDAO.displayAllProduct();
           if(list != null)
           {
        %>
        <div class="new_arrivals_agile_w3ls_info"> 
            <div class="container" >
		<h3 class="wthree_text_info">Best <span>Offer</span></h3>  
           <%
               for(Product P: list)
            {   
                long id = P.getId();
           %>
        		
		<div class="tab1">
		    <div class="col-md-3 product-men">
			<div class="men-pro-item simpleCart_shelfItem">
			    <div class="men-thumb-item">
			        <img src="<%=P.getImage()%>" width="255px" height="250px"/>
				<div class="men-cart-pro">
				    <div class="inner-men-cart-pro">
					<a href="#" class="link-product-add-cart">View</a>
				    </div>
				</div>
				<span class="product-new-top">New</span>
			    </div>
			    <div class="item-info-product ">
				<h4><a href="#"><%=P.getName()%></a></h4>
			        <div class="info-product-price">
				    <span class="item_price">Rs<%=P.getPrice()-P.getDiscount()%></span>
				    <del>Rs<%=P.getPrice()%></del>
				</div>
                                <div>
                                       <%=P.getDescription()%>
                                </div>
                                       <% double price=P.getPrice()-P.getDiscount();%>
				<div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out button2">
				    <form action="AddCartitem" method="post">
					<fieldset>
                                            <input type="hidden" name="txtproductid" value="<%=P.getId()%>">
                                            <input type="hidden" name="txttotal" value="<%=price%>">
				            <input type="submit" name="submit" value="Add to cart" class="button" />
					</fieldset>
				    </form>
				</div>
                                <div class="snipcart-details button2">
				    <form action="AddCartitem" method="post">
					<fieldset>
                                            <input type="hidden" name="txtproductid" value="<%=P.getId()%>">
                                            <input type="hidden" name="txttotal" value="<%=price%>">
                                            <input type="submit" name="submit" value="Order Now" class="button" style="background-color: red" />
					</fieldset>
				    </form>
				</div>
		            </div>
		        </div>
		    </div>
                    <div class="col-md-1"></div>
        
        <%
             }
           }
        else
            out.println("<h1>No Product Found</h1>");
        }
        catch(Exception e)
        {
            out.println(e);
        }
        %>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
    <div style="margin-bottom: 50px"></div>
    <jsp:include page="footer.html"/>
    <div style="margin-bottom: -60px"></div>
</body>
</html>
