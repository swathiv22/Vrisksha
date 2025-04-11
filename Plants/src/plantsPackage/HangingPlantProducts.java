package plantsPackage;

import java.math.BigDecimal;

public class HangingPlantProducts {
	private int pid;
	private String pname;
	private BigDecimal original_price;
	private BigDecimal discount_price;
	private String category;
	private int rating;
	private String image;

	public HangingPlantProducts() {}

	public HangingPlantProducts(int pid ,String pname, BigDecimal original_price, BigDecimal discount_price, String category, int rating, String image) {
		this.pid = pid;
		this.pname = pname;
		this.original_price = original_price;
		this.discount_price = discount_price;
		this.category = category;
		this.rating = rating;
		this.image = image;
	}
	
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public BigDecimal getOriginalprice() {
		return original_price;
	}

	public void setOriginalprice(BigDecimal original_price) {
		this.original_price = original_price;
	}
	
	public BigDecimal getDiscountprice() {
		return discount_price;
	}

	public void setDiscountprice(BigDecimal discount_price) {
		this.discount_price = discount_price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "HangingPlantProducts [pid=" + pid + ", pname=" + pname + ", original_price=" + original_price
				+ ", discount_price=" + discount_price + ", category=" + category + ", rating=" + rating + ", image="
				+ image + "]";
	}

	

	
	

	
	

}
