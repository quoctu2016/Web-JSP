package shop.models;


public class Order {
	private long or_id;
	private double total;
	private String payment;
	private String address;
	private String name;
	private String email;
	private java.sql.Timestamp date;
	public Order(long or_id, double total, String payment, String address, String name, String email, java.sql.Timestamp date) {
		super();
		this.or_id = or_id;
		this.total = total;
		this.payment = payment;
		this.address = address;
		this.name = name;
		this.email = email;
		this.date = date;
	}
	public Order() {
		super();
	}
	public long getOr_id() {
		return or_id;
	}
	public void setOr_id(long or_id) {
		this.or_id = or_id;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public java.sql.Timestamp getDate() {
		return date;
	}
	public void setDate(java.sql.Timestamp date) {
		this.date = date;
	}
}
