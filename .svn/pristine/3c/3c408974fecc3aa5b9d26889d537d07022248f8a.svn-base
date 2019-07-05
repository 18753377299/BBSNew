package mapper;

import java.util.Map;

import domain.Page;

public class PostProvider {
	
	public String queryPostSql(Map<String, Object> map) {
		Page page = (Page)map.get("param1");
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT * FROM ( ");
		sql.append("SELECT P.*,ROWNUM RN FROM (");
		sql.append("SELECT * FROM POST WHERE PARENTID IS NULL ORDER BY POSTTIME DESC");
		sql.append(") P WHERE ROWNUM <= " + page.getPage() * page.getRows() + "");
		sql.append(") WHERE RN > " + (page.getPage() - 1) * page.getRows());
		return sql.toString();
	}

}
