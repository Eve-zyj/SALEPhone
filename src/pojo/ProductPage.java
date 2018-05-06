package pojo;

public class ProductPage {
	private int pageIndex;//当前页码
	private int totalCount;//总记录数
	private int pageCount;//总页数
	private int pagesize;//每页记录数
	private int firstData;//第一条记录起始位置
	
	//产品的属性
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
	
	public ProductPage(){}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public Float getNowPrice() {
		return nowPrice;
	}
	public void setNowPrice(Float nowPrice) {
		this.nowPrice = nowPrice;
	}
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {
		this.stock = stock;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public Integer getCategory() {
		return category;
	}
	public void setCategory(Integer category) {
		this.category = category;
	}
	public String getDescribe1() {
		return describe1;
	}
	public void setDescribe1(String describe1) {
		this.describe1 = describe1;
	}
	public String getDescribe2() {
		return describe2;
	}
	public void setDescribe2(String describe2) {
		this.describe2 = describe2;
	}
	public String getAddtime() {
		return addtime;
	}
	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}
	public String getOpr() {
		return opr;
	}
	public void setOpr(String opr) {
		this.opr = opr;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	public void setFirstData(int firstData) {
		this.firstData = firstData;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getPageCount() {
		return totalCount%pagesize==0?totalCount/pagesize:(totalCount/pagesize+1);
	}
	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}
	public int getFirstData() {
		return (pageIndex-1)*pagesize;
	}
	
}
