package pojo;

/**
 * Productcategory entity. @author MyEclipse Persistence Tools
 */

public class Productcategory implements java.io.Serializable {

	// Fields

	private Integer id;
	private String categoryName;

	// Constructors

	/** default constructor */
	public Productcategory() {
	}

	/** full constructor */
	public Productcategory(String categoryName) {
		this.categoryName = categoryName;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCategoryName() {
		return this.categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

}