package shop.models;

import java.sql.Blob;

public class Product {
	private Long pro_id;
	private Long cat_id;
	private String pro_name;
	private String pro_image;
	private String description;
	private Double price;
	private String cat_name;
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Product() {
		super();
	}
	public Product(Long pro_id, Long cat_id, String pro_name, String pro_image, String description, Double price) {
		super();
		this.pro_id = pro_id;
		this.cat_id = cat_id;
		this.pro_name = pro_name;
		this.pro_image = pro_image;
		this.description = description;
		this.price = price;
	}
	public Long getPro_id() {
		return pro_id;
	}
	public void setPro_id(Long pro_id) {
		this.pro_id = pro_id;
	}
	public Long getCat_id() {
		return cat_id;
	}
	public void setCat_id(Long cat_id) {
		this.cat_id = cat_id;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public String getPro_image() {
		return pro_image;
	}
	public void setPro_image(String pro_image) {
		this.pro_image = pro_image;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCat_name() {
		return cat_name;
	}
	public void setCat_name(String cat_name) {
		this.cat_name = cat_name;
	}
}
