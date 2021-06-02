package dao;

import static dao.CartitemDAO.con;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Cartitem;
import myConnection.Mycon;

public class CartDAO 
{
    static Connection con = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;
    
    public static List<Cartitem> displayCart(int customerid) throws Exception
    {
        List<Cartitem> list = new ArrayList();
        con = Mycon.getConnection();
        
        String sql = "select * from cartitem where customerid=?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, customerid);
        rs = ps.executeQuery();
        if(rs.next())
        {
            do
            {
            Cartitem item = new Cartitem();
            item.setId(rs.getInt(1));
            item.setCustomerid(rs.getInt(2));
            item.setProductid(rs.getInt(3));
            item.setQuantity(rs.getInt(4));
            item.setTotal(rs.getDouble(5));
            list.add(item);
            }
        while(rs.next());
        }
        else
            list = null;
        return list;
    }
    public static double carttotal(int customerid) throws Exception
    {
        List<Cartitem> list = new ArrayList();
        con = Mycon.getConnection();
        
        String sql = "select total from cartitem where customerid=?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, customerid);
        rs = ps.executeQuery();
        double total = 0;
        while(rs.next())
        {
           total = total + rs.getDouble(1);
        }
        return total;
    }
         public static boolean updatecart(Cart c) throws Exception
     {
        con = Mycon.getConnection();
        
        String sql = "Update cart set total=? and itemno=? where id=?";
        ps = con.prepareStatement(sql);
        ps.setDouble(1, c.getCarttotal());
        ps.setInt(2, c.getNoofitem());
        ps.setInt(3, c.getCustomerid());
        return ps.executeUpdate()>0;
     }      
}
