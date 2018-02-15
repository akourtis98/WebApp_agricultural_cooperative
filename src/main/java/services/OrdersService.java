package services;

import dao.OrdersDao;
import database.Orders;
import database.Users;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrdersService
{
    @Autowired
    private OrdersDao ordersDao;

    public Orders addNewOrder(double totalPrice, Users user)
    {
        Orders order = new Orders();
        order.setUsers(user);
        order.setTotalPrice(totalPrice);
        order.setPurchaceDate(new Date());

        ordersDao.addNewOrder(order);
        
        return order;
    }
}
