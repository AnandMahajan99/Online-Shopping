package dao;

import model.Customer;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import myConnection.Mycon;

public class CustomerDAO 
{
    static Connection con = null;
    static PreparedStatement ps = null;   
    static ResultSet rs = null;    
    public static void insertCustomer(Customer C) throws Exception
    {    
        con=myConnection.Mycon.getConnection();
        
        String sql="insert into customer values(?,?,?,?,?,?,?,?,?,?,?)";
        ps=con.prepareStatement(sql);
        
        ps.setInt(1, C.getId());
        ps.setString(2, C.getFirstname());
        ps.setString(3, C.getLastname());
        ps.setString(4, C.getEmailid());
        ps.setString(5, C.getMobileno());
        ps.setString(6, C.getGender());
        ps.setString(7, C.getState());
        ps.setString(8, C.getCity());
        ps.setString(9, C.getAddress());
        ps.setString(10, C.getPostalcode());
        ps.setString(11, C.getPassword());
        
        int n=ps.executeUpdate();
        if(n>0)
            System.out.println("Record Inserted");
    }
    
    public static boolean deleteCustomerByemailid(String email) throws Exception
    {   
        con=myConnection.Mycon.getConnection();
        
        String sql="delete from customer where emailid=?";
        ps=con.prepareStatement(sql);
        ps.setString(1, email);
        int n=ps.executeUpdate();
        if(n>0)
        {
            System.out.println("Record Deleted");
            return true;
        }
        return false;
    }
    
    public static boolean deleteCustomerByid(int id) throws Exception
    {   
        con=myConnection.Mycon.getConnection();
        
        String sql="delete from customer where id=?";
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
    
    public static Customer searchCustomerByemailid(String email) throws Exception
    {
        Customer C=new Customer();
        con=myConnection.Mycon.getConnection();
        
        String sql="select * from customer where emailid=?";
        ps=con.prepareStatement(sql);
        ps.setString(1, email);
        rs=ps.executeQuery();
        if(rs.next())
        {
            C.setId(rs.getInt(1));
            C.setFirstname(rs.getString(2));
            C.setLastname(rs.getString(3));
            C.setEmailid(rs.getString(4));
            C.setMobileno(rs.getString(5));
            C.setGender(rs.getString(6));
            C.setState(rs.getString(7));
            C.setCity(rs.getString(8));
            C.setAddress(rs.getString(9));
            C.setPostalcode(rs.getString(10));
        }
        else 
            C = null;
        return C;
    }
    
    public static Customer searchCustomerByid(int id) throws Exception
    {
        Customer C = new Customer();
        con = Mycon.getConnection();
        
        String sql = "select * from customer where id=?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        rs = ps.executeQuery();
        if(rs.next())
        {
            C.setId(rs.getInt(1));
            C.setFirstname(rs.getString(2));
            C.setLastname(rs.getString(3));
            C.setEmailid(rs.getString(4));
            C.setMobileno(rs.getString(5));
            C.setGender(rs.getString(6));
            C.setState(rs.getString(7));
            C.setCity(rs.getString(8));
            C.setAddress(rs.getString(9));
            C.setPostalcode(rs.getString(10));
        }
        else
            C = null;
        return C;
    }
    
//    public boolean updateCustomerByemailid(Customer C) throws Exception
//    { 
//        con=myConnection.Mycon.getConnection();
//        
//        String sql="update customer set firstname=?,lastname=?,mobileno=?,gender=?,state=?,city=?,address=?,postalcode=? where emailid=?";
//        ps=con.prepareStatement(sql);
//        ps.setString(1, C.getFirstname());
//        ps.setString(2, C.getLastname());
//        ps.setString(3, C.getMobileno());
//        ps.setString(4, C.getGender());
//        ps.setString(5, C.getState());
//        ps.setString(6, C.getCity());
//        ps.setString(7, C.getAddress());
//        ps.setString(8, C.getPostalcode());
//        ps.setString(9, C.getEmailid());
//        
//        if(ps.executeUpdate()>0)
//        {
//            System.out.println("Record Updated");
//            return true;
//        }
//        return false;
//    }
//    public boolean updateCustomerByid(Customer C) throws Exception
//    { 
//        con=myConnection.Mycon.getConnection();
//        
//        String sql="update personalinfo set firstname=?,lastname=?,mobileno=?,gender=?,state=?,city=?,address=?,postalcode=?,emailid=? where id=?";
//        ps=con.prepareStatement(sql);
//        ps.setString(1, C.getFirstname());
//        ps.setString(2, C.getLastname());
//        ps.setString(3, C.getMobileno());
//        ps.setString(4, C.getGender());
//        ps.setString(5, C.getState());
//        ps.setString(6, C.getCity());
//        ps.setString(7, C.getAddress());
//        ps.setString(9, C.getPostalcode());
//        ps.setString(10, C.getEmailid());
//        ps.setInt(11, C.getId());
//        
//        if(ps.executeUpdate()>0)
//        {
//            System.out.println("Record Updated");
//            return true;
//        }
//        return false;
//    }
//    
    public static List<Customer> displayAllCustomer() throws Exception
    {
        con = Mycon.getConnection();
        List<Customer> result = new ArrayList();
        String sql = "select * from customer";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        if(rs.next())
        {
            do
            {
            Customer C = new Customer();
            C.setId(rs.getInt(1));
            C.setFirstname(rs.getString(2));
            C.setLastname(rs.getString(3));
            C.setEmailid(rs.getString(4));
            C.setMobileno(rs.getString(5));
            C.setGender(rs.getString(6));
            C.setState(rs.getString(7));
            C.setCity(rs.getString(8));
            C.setAddress(rs.getString(9));
            C.setPostalcode(rs.getString(10));
            result.add(C);
            }
            while(rs.next());
        }
        else 
            result = null;
        return result;
    }
    
    public static boolean authenticateCustomer(String emailid,String password) throws Exception
    {
        con=Mycon.getConnection();
        String sql;
        sql="select * from customer where emailid=? and password=?";
        ps=con.prepareStatement(sql);
        ps.setString(1, emailid);
        ps.setString(2, password);
        rs=ps.executeQuery();
        return rs.next();
    }
  //This is Dummy  
    public static boolean authenticateAdmin(String emailid,String password) throws Exception
    {
        return "anand@gmail.com".equals(emailid) && "1234".equals(password);
    }
    
    public static int getCustomerid() throws Exception
    {
        con=Mycon.getConnection();
        String sql;
        int start=1001,id = 0;
        sql="select max(id) from customer";
        ps=con.prepareStatement(sql);
        rs=ps.executeQuery();
        if(rs.next())
        {
               id=rs.getInt(1);
        }
        if(id <= 0)
        {
            return start;
        }
        else
            return ++id;
    }
    public static boolean isEmailidexist(String emailid) throws Exception
    {
        con=Mycon.getConnection();
        String sql;
        sql="select * from customer where emailid=?";
        ps=con.prepareStatement(sql);
        ps.setString(1, emailid);  
        rs = ps.executeQuery();
        if(rs.next())
            return true;
        return false;
    }
    public static boolean isMobilenoexist(String mobileno) throws Exception
    {
        con=Mycon.getConnection();
        String sql;
        sql="select * from customer where mobileno=?";
        ps=con.prepareStatement(sql);
        ps.setString(1, mobileno);
        rs = ps.executeQuery();
        if(rs.next())
            return true;
        return false;
    }
}
