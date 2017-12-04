package shop.models;

import java.util.HashMap;
import java.util.Map;

public class Cart {
	private HashMap<Long, Item> cartItem;

	public Cart(HashMap<Long, Item> cartItem) {
		super();
		this.cartItem = cartItem;
	}

	public Cart() {
		cartItem = new HashMap<>();
	}

	public HashMap<Long, Item> getCartItem() {
		return cartItem;
	}

	public void setCartItem(HashMap<Long, Item> cartItem) {
		this.cartItem = cartItem;
	}
	
	public void plusCart(Long key,Item item) {
		boolean check = cartItem.containsKey(key);
		if(check) {
			int quantity_old = item.getQuantity();
			item.setQantity(quantity_old+1);
			cartItem.put(key, item);
		}
		else {
			cartItem.put(key, item);
		}
	}
	public void updateCart(Long key,Item item) {
		boolean check = cartItem.containsKey(key);
		if(check) {
			int quantity_old = item.getQuantity();
			item.setQantity(quantity_old+1);
			cartItem.put(key, item);
		}
		else {
			cartItem.put(key, item);
		}
	}
	public void subCart(Long key,Item item) {
		boolean check = cartItem.containsKey(key);
		if(check) {
			int quantity_old = item.getQuantity();
			if(quantity_old<=1) {
				cartItem.remove(key);
			}
			else {
				item.setQantity(quantity_old-1);
				cartItem.put(key, item);
			}
		}
		else {
			cartItem.put(key, item);
		}
	}
	public void removeCart(Long key) {
		boolean check = cartItem.containsKey(key);
		if(check) {
			cartItem.remove(key);
			}
		}
	public int countItem() {
		return cartItem.size();
	}
	public double totalCart() {
		double count = 0;
		for(Map.Entry<Long, Item> list : cartItem.entrySet()) {
			count += list.getValue().getProduct().getPrice()*list.getValue().getQuantity();
		}
		return count;
	}
}
