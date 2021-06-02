package dao;

import java.sql.Connection;
import java.sql.Date;
//import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Category;
import model.Product;
import myConnection.Mycon;

public class CategoryDAO 
{
    static Connection con=null;
    static PreparedStatement ps=null;
    static ResultSet rs=null;

    public static boolean addCategory(Category C) throws Exception
    {
        Date date=null;
        Time time=null;
        con=Mycon.getConnection();
        String sql;
        sql="insert into category (id,name,last_update_date,last_update_time) values (?,?,?,?)";
        ps=con.prepareStatement(sql);
        ps.setInt(1, C.getId());
        ps.setString(2, C.getName());
        date = Date.valueOf(C.getLastupdatedate().toLocalDate());
        time = Time.valueOf(C.getLastupdatetime().toLocalTime());
        ps.setDate(3 , date);
        ps.setObject(4, time);
        if(ps.executeUpdate()>0)
        {
            System.out.println("Category Added");
            return true;
        }
        return false;
    } 
    
    public static boolean deleteCategoryByName(String name) throws Exception
    {
        con=Mycon.getConnection();   
        String sql;
        sql="delete from category where name=?";
        ps=con.prepareStatement(sql);
        ps.setString(1, name);
        if(ps.executeUpdate()>0)
        {
            System.out.println("Record Deleted");
            return true;   
        }
        return false;
    }   
    
    public static boolean deleteCategoryById(int id) throws Exception
    {
        con=Mycon.getConnection();
        String sql;
        sql="delete from category where id=?";
        ps=con.prepareStatement(sql);
        ps.setInt(1, id);
        if(ps.executeUpdate()>0)
        {
            System.out.println("Record Deleted");
            return true;   
        }
        return false;
    }    
    
    public static boolean updateCategoryById(Category C) throws Exception
    {
        Date date=null;
        Time time=null;
        con=Mycon.getConnection();
        String sql;
        sql="update category set name=? , last_update_date=? , last_update_time=? where id=?";
        ps=con.prepareStatement(sql);
        ps.setString(1, C.getName());
        date = Date.valueOf(C.getLastupdatedate().toLocalDate());
        time = Time.valueOf(C.getLastupdatetime().toLocalTime());
        ps.setDate(2 , date);
        ps.setObject(3, time);
        ps.setInt(4, C.getId());
        if(ps.executeUpdate()>0)
        {
            System.out.println("Category Added");
            return true;
        }
        return false;
    }
    
    public static Category searchCategoryById(int id) throws Exception
    {
        Category C1=new Category();
        con=Mycon.getConnection();
        String sql;
        sql="select * from category where id=?";
        ps=con.prepareStatement(sql);
        ps.setInt(1, id);
        rs=ps.executeQuery();
        System.out.println("Query Executed");
        if(rs.next())
        {
            System.out.println(rs.getInt(1));
            C1.setId(rs.getInt(1));
            System.out.println(rs.getString(2));
            C1.setName(rs.getString(2));
            System.out.println(rs.getTimestamp(3).toLocalDateTime());
            C1.setLastupdatedate(rs.getTimestamp(3).toLocalDateTime());
            System.out.println(rs.getTimestamp(4).toLocalDateTime());
            C1.setLastupdatetime(rs.getTimestamp(4).toLocalDateTime());
        }
        else
            C1=null;
        return C1;
    }
    
    public static List<Category> displayAllCategory()throws Exception
    {
        con=Mycon.getConnection();
        String sql;
        sql="select * from category";
        List<Category> result=new ArrayList<Category>();
        ps=con.prepareStatement(sql);
        rs=ps.executeQuery();
        if(rs.next())
        {
            do
            {         
                Category C=new  Category();
                C.setId(rs.getInt(1));
                C.setName(rs.getString(2));
                C.setLastupdatedate(rs.getTimestamp(3).toLocalDateTime());
                C.setLastupdatetime(rs.getTimestamp(4).toLocalDateTime());
                result.add(C);
            }
            while(rs.next());
        }
        else
            result = null;
        return result;
    }
    
    public static Category displayAllProductofCategory(String Categoryname)throws Exception
    {
        con=Mycon.getConnection();
        Category C = new Category();
        List<Product> list=new ArrayList<Product>();
        String sql;
        sql="SELECT * FROM product,category WHERE category.id=product.category_id AND category.name=?";
        ps=con.prepareStatement(sql);
        ps.setString(1, Categoryname);
        rs=ps.executeQuery();
        if(rs.next())
        {
            C.setId(rs.getInt(12));
            C.setName(rs.getString(13));
            C.setLastupdatedate(rs.getTimestamp(14).toLocalDateTime());
            C.setLastupdatetime(rs.getTimestamp(15).toLocalDateTime());
            do 
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
                list.add(P);
            }
            while(rs.next());
            C.setProduct(list);
        }
        else
            C = null;
        return C;
    }
    
    public static boolean isExist(int id) throws Exception
    {
        con=Mycon.getConnection();  
        String sql;
        sql="select * from category where id=?";        
        ps=con.prepareStatement(sql);
        ps.setInt(1, id);
        rs=ps.executeQuery();
        if(rs.next())
            return true;
        return false;
    }
    
    public static int getCategoryid() throws Exception
    {
        con=Mycon.getConnection();  
        String sql;
        sql="select max(id) from category";        
        ps=con.prepareStatement(sql);
        rs=ps.executeQuery();
        if(rs.next())
        {
            int id=rs.getInt(1);
            if(id != 0)
               return ++id;
        }
        int start=1000001;
        return start;
    }    
       
}
