package com.foodapp.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {

    private Map<Integer, CartItem> items = new HashMap<>();

    public Map<Integer, CartItem> getItems() {
        return items;
    }

    public void addItem(CartItem item) {

        int menuId = item.getMenu().getMenuId();

        if (items.containsKey(menuId)) {

            CartItem existingItem = items.get(menuId);

            existingItem.setQuantity(
                existingItem.getQuantity() + 1
            );

        } else {

            items.put(menuId, item);
        }
    }

    public void removeItem(int menuId) {
        items.remove(menuId);
    }

    public double getTotal() {

        double total = 0;

        for (CartItem item : items.values()) {
            total += item.getTotalPrice();
        }

        return total;
    }
}