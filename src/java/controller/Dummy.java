package controller;

import dao.CartDAO;
import dao.CartitemDAO;
import dao.CustomerDAO;
import java.util.List;
import model.Cartitem;
import model.Customer;

public class Dummy 
{
    public static void main(String[] args) throws Exception
    {
       // System.out.println(CustomerDAO.getCustomerid());
//        List<Customer> list = null;
//        list = CustomerDAO.displayAllCustomer();
//        if(list == null)
//            System.out.println("Record not exist");
//        else
//        for(Customer c : list)
//            System.out.println(c.getId()+" "+c.getFirstname()+" "+c.getMobileno());
        
//        Cartitem C = new Cartitem();
//        C.setId(106);
//        C.setCustomerid(1001);
//        C.setProductid(111);
//        C.setQuantity(2);
//        C.setTotal(5600.0);
//        System.out.println(CartitemDAO.updateItemQuantityandPrice(C));
   //       System.out.println(CartDAO.carttotal(1001));
    //    System.out.println(CartDAO.deleteallcartitem(1001));
//          String s = "   Foot           Wear    ";
//          //s = s.trim();
//          System.out.println(s);
        
   //     System.out.println(CustomerDAO.isEmailidexist("ashwin@gmail.com"));
   //     System.out.println(CustomerDAO.isMobilenoexist("1234567890"));
        System.out.println(CartitemDAO.cartitemtotal(1001));
    }
}