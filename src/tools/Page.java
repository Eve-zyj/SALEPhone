package tools;

public class Page {

	private int pageIndex;//当前页码
	private int totalCount;//总记录数
	private int pageCount;//总页数
	private int pagesize;//每页记录数
	private int firstData;//第一条记录起始位置
	
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
		return totalCount%pagesize==0?totalCount%pagesize:totalCount%pagesize+1;
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
