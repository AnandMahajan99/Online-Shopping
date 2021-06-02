package model;

import java.util.List;

public class Cart 
{
    private List<Cartitem> cartitem;
    private double carttotal;    
    private int customerid;
    private int noofitem;

    public int getNoofitem() {
        return noofitem;
    }

    public void setNoofitem(int noofitem) {
        this.noofitem = noofitem;
    }

    public List<Cartitem> getCartitem() {
        return cartitem;
    }

    public void setCartitem(List<Cartitem> cartitem) {
        this.cartitem = cartitem;
    }

    public double getCarttotal() {
        return carttotal;
    }

    public void setCarttotal(double carttotal) {
        this.carttotal = carttotal;
    }

    public int getCustomerid() {
        return customerid;
    }

    public void setCustomerid(int customerid) {
        this.customerid = customerid;
    }
}
