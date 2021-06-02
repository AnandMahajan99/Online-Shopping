package model;

import java.time.LocalDateTime;
import java.util.List;

public class Order 
{
   private int id;
   private LocalDateTime dateTime;
   private double amount;
   private String status;
   private int customerid;
   private List<Orderitem> list;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDateTime getDateTime() {
        return dateTime;
    }

    public void setDateTime(LocalDateTime dateTime) {
        this.dateTime = dateTime;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getCustomerid() {
        return customerid;
    }

    public void setCustomerid(int customerid) {
        this.customerid = customerid;
    }

    public List<Orderitem> getList() {
        return list;
    }

    public void setList(List<Orderitem> list) {
        this.list = list;
    }
   
}
