package pojo;

/**
 * Product entity. @author MyEclipse Persistence Tools
 */

public class Product implements java.io.Serializable {

	// Fields

	private Integer id;
	private String productName;
	private Float price;
	private Float nowPrice;
	private Integer stock;
	private String filename;
	private Integer category;
	private String describe1;
	private String describe2;
	private String addtime;
	private String opr;
	private String categoryName;
	// Constructors

	/** default constructor */
	public Product() {
	}


	/** minimal constructor */
	public Product(String productName) {
		this.productName = productName;
	}

	/** full constructor */
	public Product(String productName, Float price, Float nowPrice,
			Integer stock, String filename, Integer category, String describe1,
			String describe2, String addtime) {
		this.productName = productName;
		this.price = price;
		this.nowPrice = nowPrice;
		this.stock = stock;
		this.filename = filename;
		this.category = category;
		this.describe1 = describe1;
		this.describe2 = describe2;
		this.addtime = addtime;
	}

	// Property accessors

	public String getOpr() {
		return opr;
	}

	public void setOpr(String opr) {
		this.opr = opr;
	}
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProductName() {
		return this.productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Float getPrice() {
		return this.price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}


	public Float getNowPrice() {
		return this.nowPrice;
	}

	public void setNowPrice(Float nowPrice) {
		this.nowPrice = nowPrice;
	}

	public Integer getStock() {
		return this.stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public String getFilename() {
		return this.filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public Integer getCategory() {
		return this.category;
	}

	public void setCategory(Integer category) {
		this.category = category;
	}

	public String getDescribe1() {
		return this.describe1;
	}

	public void setDescribe1(String describe1) {
		this.describe1 = describe1;
	}

	public String getDescribe2() {
		return this.describe2;
	}

	public void setDescribe2(String describe2) {
		this.describe2 = describe2;
	}

	public String getAddtime() {
		return this.addtime;
	}

	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}

}