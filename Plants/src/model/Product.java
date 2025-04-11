package model;

import java.math.BigDecimal;

public class Product {
	private int id;
	private String name;
	public String category;
	private BigDecimal price;
	private BigDecimal subprice;
	private String image;
	
	
	public Product() {
	}

	
	public Product(int id, String name, String category, BigDecimal price,BigDecimal subprice, String image) {
		super();
		this.id = id;
		this.name = name;
		this.category = category;
		this.price = price;
		this.subprice= subprice;
		this.image = image;
		
	}

	public BigDecimal getSubprice() {
		return subprice;
	}


	public void setSubprice(BigDecimal subprice) {
		this.subprice = subprice;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal totalDiscountPrice) {
		this.price = totalDiscountPrice;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", category=" + category + ", price=" + price + ", image="
				+ image + "]";
	}
	
	
}