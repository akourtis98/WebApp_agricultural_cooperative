package services;

import dao.SalesDao;
import database.OrdersHasProducts;
import java.text.ParseException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SalesService {

    @Autowired
    SalesDao salesDAO;

    public List<OrdersHasProducts> getSaleOfProducts() {
        return salesDAO.getSaleOfProducts();
    }

    public List<OrdersHasProducts> getSaleOfProductsFilter(String date1, String date2) throws ParseException {
        return salesDAO.getSaleOfProductsFilter(date1, date2);
    }

}
