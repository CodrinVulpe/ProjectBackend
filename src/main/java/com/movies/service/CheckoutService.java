package com.movies.service;

import com.movies.dataTransferObject.Purchase;
import com.movies.dataTransferObject.PurchaseResponse;

public interface CheckoutService {

    PurchaseResponse placeOrder(Purchase purchase);
}
