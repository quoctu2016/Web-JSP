package shop.models;

public class Category {
	private long Cat_id;
	private String Cat_name;
	public Category(long cat_id, String cat_name) {
		super();
		Cat_id = cat_id;
		Cat_name = cat_name;
	}
	public long getCat_id() {
		return Cat_id;
	}
	public void setCat_id(long cat_id) {
		Cat_id = cat_id;
	}
	public Category() {
		super();
	}
	public String getCat_name() {
		return Cat_name;
	}
	public void setCat_name(String cat_name) {
		Cat_name = cat_name;
	}
	
}
