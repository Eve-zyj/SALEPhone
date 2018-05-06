package pojo;

/**
 * Order entity. @author MyEclipse Persistence Tools
 */

public class Order implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private String userLoginname;
	private String userAddress;
	private String createtime;
	private Float cost;
	private String serialNumber;

	// Constructors

	/** default constructor */
	public Order() {
	}

	/** full constructor */
	public Order(Integer userId, String userLoginname, String userAddress,
			String createtime, Float cost, String serialNumber) {
		this.userId = userId;
		this.userLoginname = userLoginname;
		this.userAddress = userAddress;
		this.createtime = createtime;
		this.cost = cost;
		this.serialNumber = serialNumber;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserLoginname() {
		return this.userLoginname;
	}

	public void setUserLoginname(String userLoginname) {
		this.userLoginname = userLoginname;
	}

	public String getUserAddress() {
		return this.userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getCreatetime() {
		return this.createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public Float getCost() {
		return this.cost;
	}

	public void setCost(Float cost) {
		this.cost = cost;
	}

	public String getSerialNumber() {
		return this.serialNumber;
	}

	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}

}