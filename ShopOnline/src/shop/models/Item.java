package shop.models;

public class Item {
	private Product product;
	private int quantity;
	public Item(Product product, int qantity) {
		super();
		this.product = product;
		this.quantity = qantity;
	}
	public Item() {
		super();
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQantity(int qantity) {
		this.quantity = qantity;
	}
	
}
