package mapper;

import domain.Page;

public class UserManageProvider {
	
	public String queryUserSql(Page page) {
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT * FROM ( ");
		sql.append("SELECT U.*,ROWNUM RN FROM (");
		sql.append("SELECT * FROM B_USER ORDER BY USERID");
		sql.append(") U WHERE ROWNUM <= " + page.getPage() * page.getRows() + "");
		sql.append(") WHERE RN > " + (page.getPage() - 1) * page.getRows());
		return sql.toString();
	}

}
