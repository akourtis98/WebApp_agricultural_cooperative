package controllers;

import database.OrdersHasProducts;
import java.text.ParseException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import services.SalesService;

@Controller
public class SalesController {

    @Autowired
    private SalesService salesServ;

    @RequestMapping("/admin/sales")
    public String getSales(Model model) {

        List<OrdersHasProducts> ordersList = salesServ.getSaleOfProducts();

        if (!ordersList.isEmpty()) {
            model.addAttribute("orders", ordersList);
        }

        return "salesList";
    }

    @RequestMapping(value = "/admin/datesales", method = RequestMethod.POST)
    public String dateFilter(HttpServletRequest request, Model model) throws ParseException {

        if (!request.getParameter("date1").equals("") && !request.getParameter("date2").equals("")) {
            List<OrdersHasProducts> ordersList = salesServ.getSaleOfProductsFilter(request.getParameter("date1"), request.getParameter("date2"));
            if (!ordersList.isEmpty()) {
                model.addAttribute("orders", ordersList);
            }
        }
        return "salesList";

    }

}
