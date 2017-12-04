package shop.models;

public class OrderDetail {
	private long orderDetailId;
	private long orderId;
	private long proId;
	private double price;
	private int quantity;
	public OrderDetail(long orderDetailId, long orderId, long proId, double price, int quantity) {
		super();
		this.orderDetailId = orderDetailId;
		this.orderId = orderId;
		this.proId = proId;
		this.price = price;
		this.quantity = quantity;
	}
	public OrderDetail() {
		super();
	}
	public long getOrderDetailId() {
		return orderDetailId;
	}
	public void setOrderDetailId(long orderDetailId) {
		this.orderDetailId = orderDetailId;
	}
	public long getOrderId() {
		return orderId;
	}
	public void setOrderId(long orderId) {
		this.orderId = orderId;
	}
	public long getProId() {
		return proId;
	}
	public void setProId(long proId) {
		this.proId = proId;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
}
