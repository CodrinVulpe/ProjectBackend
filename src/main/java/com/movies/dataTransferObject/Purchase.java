package com.movies.dataTransferObject;

import com.movies.entity.Address;
import com.movies.entity.Customer;
import com.movies.entity.Order;
import com.movies.entity.OrderItem;
import lombok.Data;

import java.util.Set;

@Data
public class Purchase {

    private Customer customer;

    private Address shippingAddress;

    private Address billingAddress;

    private Order order;

    private Set<OrderItem> orderItems;


}
