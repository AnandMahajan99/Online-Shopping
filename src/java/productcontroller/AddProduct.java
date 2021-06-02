package productcontroller;

import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Product;

public class AddProduct extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Product P=new Product();
        LocalDateTime ldt;
      
        String name=request.getParameter("txtname");
        String code=request.getParameter("txtcode");
        String desciption=request.getParameter("txtdescription");
        Part  filepart=request.getPart("txtimage");
        String price=request.getParameter("txtprice");
        String discount=request.getParameter("txtdiscount");
        String quantity=request.getParameter("txtquantity");
        String categoryid=request.getParameter("txtcategoryid");
        try
        {
            if(CategoryDAO.isExist(Integer.parseInt(categoryid)))
            {   
                int id = ProductDAO.getnextProductid();
                //for write image in project folder
                String extension = getFileName(filepart);
                String root = getServletContext().getRealPath("/");
                String file = root + "images\\p" + id + "." + extension;
                
                P.setId(id);
                P.setName(name);
                P.setCode(code);
                P.setDescription(desciption);
                P.setImage(file.substring(file.indexOf("images"),file.length()));
                P.setLastupdatedate(LocalDateTime.now());
                P.setLastupdatetime(LocalDateTime.now());
                P.setPrice(Double.parseDouble(price));
                P.setDiscount(Double.parseDouble(discount));
                P.setQuantity(Integer.parseInt(quantity));
                P.setCategoryid(Integer.parseInt(categoryid));
                if(ProductDAO.addProduct(P))
                {
                   File f = new File(file);
                   f.createNewFile();
                   filepart.write(f.toString());
                   response.sendRedirect("addProduct.jsp?message=Product+Added");
                }
            }
            else
               response.sendRedirect("addProduct.jsp?message=Category+Not+Exist"); 
        }
        catch(Exception e)
        {
            out.println(e);
        }
        out.println("</body>");
        out.println("</html>");
    }
    private String getFileName(Part part)
    {
        String ContentDisp = part.getHeader("content-disposition");
        String[] items = ContentDisp.split(";");
        for(String s: items)
        {
            if(s.trim().startsWith("filename"))
            {
               return s.substring(s.lastIndexOf(".")+1 , s.length()-1);
            }
        } 
        return "";       
    }
}
