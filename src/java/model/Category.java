package model;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

public class Category 
{
   private int id;    
   private String name;
   private LocalDateTime lastupdatedate;
   private LocalDateTime lastupdatetime;
   private List<Product> product;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDateTime getLastupdatedate() {
        return lastupdatedate;
    }

    public void setLastupdatedate(LocalDateTime lastupdatedate) {
        this.lastupdatedate = lastupdatedate;
    }

    public LocalDateTime getLastupdatetime() {
        return lastupdatetime;
    }

    public void setLastupdatetime(LocalDateTime lastupdatetime) {
        this.lastupdatetime = lastupdatetime;
    }
    
    public List<Product> getProduct() {
        return product;
    }

    public void setProduct(List<Product> product) {
        this.product = product;
    }  
}
