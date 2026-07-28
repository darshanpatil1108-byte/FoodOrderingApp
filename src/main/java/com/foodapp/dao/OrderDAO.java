package com.foodapp.dao;

import java.util.List;
import com.foodapp.model.Order;

public interface OrderDAO {

    int placeOrder(Order order);

    List<Order> getOrdersByUserId(int userId);

}