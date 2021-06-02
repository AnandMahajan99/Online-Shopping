package myConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Mycon 
{
    static Connection con=null;
    static
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
           // System.out.println("Driver Load");
        }
        catch(ClassNotFoundException e)
        {
            System.out.println(e);
        }
    } 
    public static Connection getConnection()
    {
         try
         {
             con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce?maxAllowedPacket=16177215","root","root");
           //  System.out.println("Connection Established Sucessfully");
         }
         catch(SQLException e)
         {
             System.out.println(e);
         }
         return con;
    }
}
