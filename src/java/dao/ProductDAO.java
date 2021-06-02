package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import model.Product;
import myConnection.Mycon;

public class ProductDAO 
{
     static Connection con=null;
     static PreparedStatement ps=null;
     static ResultSet rs=null;
     
     public static boolean addProduct(Product P) throws Exception
     {
         Date date=null;
         Time time=null;
         con=Mycon.getConnection();
         
         String sql="insert into product values (?,?,?,?,?,?,?,?,?,?,?)";
         ps=con.prepareStatement(sql);
         ps.setLong(1, P.getId());
         ps.setString(2, P.getCode());
         ps.setString(3, P.getName());
         ps.setString(4, P.getDescription());
         ps.setString(5, P.getImage());
         date = Date.valueOf(P.getLastupdatedate().toLocalDate());
         time = Time.valueOf(P.getLastupdatetime().toLocalTime());
         ps.setDate(6 , date);
         ps.setObject(7, time);
         ps.setDouble(8, P.getPrice());
         ps.setDouble(9, P.getDiscount());
         ps.setInt(10, P.getQuantity());
         ps.setInt(11, P.getCategoryid());
         
         if(ps.executeUpdate()>0)
         {
             System.out.println("Record Inserted");
             return true;
         }
         return false;   
     }
     
     public static Product searchProductById(int id) throws Exception
     {
        Product P=new  Product();
        con=Mycon.getConnection();
        String sql;
        sql="select * from product where id=?";
        ps=con.prepareStatement(sql);
        ps.setInt(1, id);
        rs=ps.executeQuery();
        if(rs.next())
                { 
                   P.setId(rs.getInt(1));
                   P.setCode(rs.getString(2));
                   P.setName(rs.getString(3));
                   P.setDescription(rs.getString(4));
                   P.setImage(rs.getString(5));
                   P.setLastupdatedate(rs.getTimestamp(6).toLocalDateTime());
                   P.setLastupdatetime(rs.getTimestamp(7).toLocalDateTime());
                   P.setPrice(rs.getDouble(8));
                   P.setDiscount(rs.getDouble(9));
                   P.setQuantity(rs.getInt(10));
                   P.setCategoryid(rs.getInt(11));
                }
        else
            P = null;
        return P;
     }
     
     public static List<Product> displayAllProduct() throws Exception
     {
        con=myConnection.Mycon.getConnection();
        String sql;
        sql="select * from product";
        List<Product> result=new ArrayList<Product>();
        ps=con.prepareStatement(sql);
        rs=ps.executeQuery();
        while(rs.next())
                { 
                   Product P=new  Product();
                   P.setId(rs.getInt(1));
                   P.setCode(rs.getString(2));
                   P.setName(rs.getString(3));
                   P.setDescription(rs.getString(4));
                   P.setImage(rs.getString(5));
                   P.setLastupdatedate(rs.getTimestamp(6).toLocalDateTime());
                   P.setLastupdatetime(rs.getTimestamp(7).toLocalDateTime());
                   P.setPrice(rs.getDouble(8));
                   P.setDiscount(rs.getDouble(9));
                   P.setQuantity(rs.getInt(10));
                   P.setCategoryid(rs.getInt(11));
                   result.add(P);
                }
        return result;
     }
     
     public boolean deleteProductById(int id) throws Exception
    {
        con=myConnection.Mycon.getConnection();
        
        String sql="delete from product where id=?";
        ps=con.prepareStatement(sql);
        ps.setInt(1, id);
        int n=ps.executeUpdate();
        if(n>0)
        {
            System.out.println("Record Deleted");
            return true;
        }
        return false;
    }
     
    public static boolean updateProductById(Product P) throws Exception
    {
        Date date=null;
        Time time=null;
        con=Mycon.getConnection();
        if(P.getImage() != null)
        {
            System.out.println("if");
            String sql="update product set code=?,name=?,description=?,image=?,last_update_date=?,last_update_time=?,price=?,discount=?,quantity=?,category_id=? where id=?";
            ps=con.prepareStatement(sql);
             
            ps.setString(1, P.getCode());
            ps.setString(2, P.getName());
            ps.setString(3, P.getDescription());
            ps.setString(4, P.getImage());
            date = Date.valueOf(P.getLastupdatedate().toLocalDate());
            time = Time.valueOf(P.getLastupdatetime().toLocalTime());
            ps.setDate(5 , date);
            ps.setObject(6, time);
            ps.setDouble(7, P.getPrice());
            ps.setDouble(8, P.getDiscount());
            ps.setInt(9, P.getQuantity());
            ps.setInt(10, P.getCategoryid());
            ps.setLong(11, P.getId());
             
            if(ps.executeUpdate()>0)
            {
               return true;
            }
        }
        else
        {  System.out.println("else");
            String sql="update product set code=?,name=?,description=?,last_update_date=?,last_update_time=?,price=?,discount=?,quantity=?,category_id=? where id=?";
            ps=con.prepareStatement(sql);
             
            ps.setString(1, P.getCode());
            ps.setString(2, P.getName());
            ps.setString(3, P.getDescription());
            date = Date.valueOf(P.getLastupdatedate().toLocalDate());
            time = Time.valueOf(P.getLastupdatetime().toLocalTime());
            ps.setDate(4 , date);
            ps.setObject(5, time);
            ps.setDouble(6, P.getPrice());
            ps.setDouble(7, P.getDiscount());
            ps.setInt(8, P.getQuantity());
            ps.setInt(9, P.getCategoryid());
            ps.setLong(10, P.getId());
             
            if(ps.executeUpdate()>0)
            {
               return true;
            }
        }
        return false;   
    }
    
    public static boolean productReferCategory(int id) throws Exception
    {
        con=Mycon.getConnection(); 
        String sql;
        sql="select * from product where category_id=?"; 
        ps=con.prepareStatement(sql);
        ps.setInt(1, id);
        rs=ps.executeQuery();
        if(rs.next())
        {
            return true;
        }
        return false;
    }
    
    public static boolean stockexist(int id) throws Exception
    {
        con=myConnection.Mycon.getConnection();  
        String sql;
        sql="select quantity from product where id=?";        
        ps=con.prepareStatement(sql);
        ps.setInt(1, id);
        rs=ps.executeQuery();
        if(rs.next())
            if(rs.getInt(1)>0)
                return true;
        return false;
    }
    
     public static int getnextProductid() throws Exception
    {
        con=myConnection.Mycon.getConnection();  
        String sql;
        sql="select max(id) from product";        
        ps=con.prepareStatement(sql);
        rs=ps.executeQuery();
        if(rs.next())
        {
            int id=rs.getInt(1);
            if(id != 0)
               return ++id;
        }
        int start=100000001;
        return start;
    }    

}
