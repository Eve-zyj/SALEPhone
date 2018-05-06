package pojo;

/**
 * Useraddress entity. @author MyEclipse Persistence Tools
 */

public class Useraddress implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer userId;
	private String userAddress;
	private Integer isDefault;

	// Constructors

	/** default constructor */
	public Useraddress() {
	}

	/** minimal constructor */
	public Useraddress(Integer userId, String userAddress) {
		this.userId = userId;
		this.userAddress = userAddress;
	}

	/** full constructor */
	public Useraddress(Integer userId, String userAddress, Integer isDefault) {
		this.userId = userId;
		this.userAddress = userAddress;
		this.isDefault = isDefault;
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

	public String getUserAddress() {
		return this.userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public Integer getIsDefault() {
		return this.isDefault;
	}

	public void setIsDefault(Integer isDefault) {
		this.isDefault = isDefault;
	}

}