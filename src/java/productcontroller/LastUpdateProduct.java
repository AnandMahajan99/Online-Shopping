package productcontroller;

import dao.CartitemDAO;
import dao.CategoryDAO;
import dao.ProductDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Product;

@MultipartConfig
public class LastUpdateProduct extends HttpServlet 
{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        PrintWriter out = response.getWriter();
        Product P = new Product();
        LocalDateTime ldt;
               
        String sid = request.getParameter("id");
        String name=request.getParameter("name");
        String code=request.getParameter("code");
        String desciption=request.getParameter("description");
        Part filepart=request.getPart("txtimage");
        String price=request.getParameter("price");
        String discount=request.getParameter("discount");
        String quantity=request.getParameter("quantity");
        String categoryid=request.getParameter("categoryid");
        try
        {
            if(CategoryDAO.isExist(Integer.parseInt(categoryid)))
            {    
                int id = Integer.parseInt(sid);
                String file;
                String extension = null;
                if(filepart.getSize() != 0)
                {
                   //for write image in project folder
                   String ContentDisp = filepart.getHeader("content-disposition");
                   String[] items = ContentDisp.split(";");
                   for(String s: items)
                   {
                      if(s.trim().startsWith("filename"))
                      {
                        extension = s.substring(s.lastIndexOf(".")+1 , s.length()-1);
                      }
                   } 
                   out.println(extension);
                   String root = getServletContext().getRealPath("/");
                   file = root + "images\\p" + id + "." + extension;
                }
                else
                {
                    file = null;
                }
                P.setId(id);
                P.setName(name);
                P.setCode(code);
                P.setDescription(desciption);
                if(file != null)
                {
                   P.setImage(file.substring(file.indexOf("images"),file.length()));
                }
                else
                    P.setImage(file);
                P.setLastupdatedate(LocalDateTime.now());
                P.setLastupdatetime(LocalDateTime.now());
                P.setPrice(Double.parseDouble(price));
                P.setDiscount(Double.parseDouble(discount));
                P.setQuantity(Integer.parseInt(quantity));
                P.setCategoryid(Integer.parseInt(categoryid));
                if(ProductDAO.updateProductById(P))
                {
                    if(file != null)
                    {
                      File f = new File(file);
                      f.createNewFile();
                      filepart.write(f.toString()); 
                    } 
                    CartitemDAO.updateTotal(id);
                    response.sendRedirect("updateProduct.jsp?message=Record+Updated");
                }
            }
            else
                response.sendRedirect("updateProduct.jsp?message=Category+Not+Exist");
        }
        catch(Exception e)
        {
            out.println(e);
        }
    }
}
