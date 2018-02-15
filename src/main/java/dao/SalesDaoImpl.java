package dao;

import database.OrdersHasProducts;
import java.text.ParseException;
import java.util.List;

public interface SalesDaoImpl {

    public List<OrdersHasProducts> getSaleOfProducts();

    public List<OrdersHasProducts> getSaleOfProductsFilter(String date1, String date2) throws ParseException;

}
