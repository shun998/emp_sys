package com.hrManage.login;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Map;

import com.hrManage.dao.Dao;
import com.hrManage.dao.DaoImpl;

public class LoginService {
	
	private Dao dao = new DaoImpl();
	public Map<String, Object> query(String usr, String pwd) throws ClassNotFoundException, SQLException {
		
		String sql = "SELECT manager_id, manager_name, manager_pass, manager_on " +
				"FROM manager " +
				"WHERE manager_name = ? AND manager_pass = ?;";
		int[] types = {Types.VARCHAR, Types.VARCHAR};
		Object[] values = {usr, pwd};
		Map<String, Object> map = this.dao.executeQueryForMap(sql, types, values);
		return map;
	}
	//更新状态
	public void updateStatus(String id, String status) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		
		String sql = null;
		if (status.equals("login")) {
			sql = "UPDATE manager " +
					"SET manager_on = 1 " +
					"WHERE manager_id = ?;";
		} else if (status.equals("logout")) {
			sql = "UPDATE manager " +
					"SET manager_on = 0 " +
					"WHERE manager_id = ?;";
		}
		int[] types = {Types.VARCHAR};
		Object[] values = {id};
		this.dao.executeUpdate(sql, types, values);
	}

}
