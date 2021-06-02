package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Cartitem;
import myConnection.Mycon;

public class CartitemDAO 
{
    static Connection con = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;
    
     public static boolean addItem(Cartitem C) throws Exception
     {
         con = Mycon.getConnection();
         String sql;
         sql = "insert into cartitem values (?,?,?,?,?)";
         ps = con.prepareStatement(sql);
         ps.setInt(1, C.getId());
         ps.setInt(2, C.getCustomerid());
         ps.setInt(3, C.getProductid());
         ps.setInt(4, C.getQuantity());
         ps.setDouble(5, C.getTotal());
         return ps.executeUpdate()>0;
     }
     
     public static boolean updateItemQuantityandPrice(Cartitem C) throws Exception
     {
        con=Mycon.getConnection();  
        String sql;
        sql="update cartitem set quantity=?,total=? where productid=? and customerid=?";        
        ps=con.prepareStatement(sql);
        ps.setInt(1, C.getQuantity());
        ps.setDouble(2, C.getTotal());
        ps.setInt(3, C.getProductid());
        ps.setInt(4, C.getCustomerid());
        if(ps.executeUpdate() > 0)
            return true;
        return false;
     }
     
     public static boolean deleteById(int id) throws Exception
     {
        con=Mycon.getConnection();  
        String sql;
        sql="delete from cartitem where id=?";        
        ps=con.prepareStatement(sql);
        ps.setInt(1, id);
        return (ps.executeUpdate()>0);
     }
     
     public static int productexist(int pid,int cid) throws Exception
     {
        con=Mycon.getConnection();  
        String sql;
        sql="select quantity from cartitem where productid=? and customerid=?";        
        ps=con.prepareStatement(sql);
        ps.setInt(1, pid);
        ps.setInt(2, cid);
        rs=ps.executeQuery();
        if(rs.next())
        {
          int q = rs.getInt(1);
          return q;
        }
        return 0;
     }
     
     public static boolean updateTotal(int id) throws Exception
     {
        con=Mycon.getConnection();  
        String sql;
        double total = 0;
        sql="select price,discount from product where id=?";
        ps=con.prepareStatement(sql);
        ps.setInt(1, id);
        rs = ps.executeQuery();
        if(rs.next())
           total = rs.getDouble(1)-rs.getDouble(2);
        
        sql="UPDATE cartitem SET total=quantity*? WHERE productid=?;";        
        ps=con.prepareStatement(sql);
        ps.setDouble(1, total);
        ps.setInt(2, id);
         if(ps.executeUpdate()>0)
             return true;
         return false;
     }
     
     public static int getnextid() throws Exception
     {
        con=Mycon.getConnection();  
        String sql;
        sql="select max(id) from cartitem";        
        ps=con.prepareStatement(sql);
        rs=ps.executeQuery();
        if(rs.next())
        {
            int id=rs.getInt(1);
            if(id != 0)
               return ++id;
        }
        int start=1;
        return start;
     }
     public static boolean  clearcart(int customerid) throws Exception
    {
        con = Mycon.getConnection();
        
        String sql = "delete from cartitem where customerid=?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, customerid);
        return ps.executeUpdate() > 0;
    }
    public static int noofitem(int customerid) throws Exception
    {
        con = Mycon.getConnection();
        
        String sql = "SELECT COUNT(?) AS noOfCartitem FROM cartitem";
        ps = con.prepareStatement(sql);
        ps.setInt(1, customerid);
        rs = ps.executeQuery();
        if(rs.next())
            return rs.getInt(1);
        return 0;
    }
    public static double cartitemtotal(int customerid) throws Exception
    {
        con = Mycon.getConnection();
        
        String sql = "SELECT sum(total) FROM cartitem where customerid=?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, customerid);
        rs = ps.executeQuery();
        if(rs.next())
            return rs.getDouble(1);
        return 0.0;
    }
}
