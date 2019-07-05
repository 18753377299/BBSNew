package domain;

public class Page {
	
	//每页行数
	private Integer rows = 10;
	
	//页码
	private Integer page = 1;

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}
	
	

}
