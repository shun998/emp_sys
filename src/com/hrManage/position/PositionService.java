package com.hrManage.position;
/**
 * 职务
 */
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;

import com.hrManage.dao.Dao;
import com.hrManage.dao.DaoImpl;

public class PositionService {
	
	private Dao dao = new DaoImpl();
	
	public List<Map<String, Object>> query() throws ClassNotFoundException, SQLException {
		
		String sql = "SELECT position.*, depart.depart_name " +
				"FROM position, depart " +
				"WHERE position.depart_id = depart.depart_id;";
		List<Map<String, Object>> list = this.dao.executeQueryForList(sql);
		return list;
	}
	
	public List<Map<String, Object>> add() throws ClassNotFoundException, SQLException {
		
		String sql = "SELECT * FROM depart;";
		List<Map<String, Object>> list = this.dao.executeQueryForList(sql);
		return list;
	}
	
	public void insert(Object[] values) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		
		String sql = "INSERT INTO position " +
				"(position_id, depart_id, position_name, position_remark) " +
				"VALUES(?, ?, ?, ?);";
		int[] types = {Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR};
		this.dao.executeUpdate(sql, types, values);
	}
	
	public Map<String, Object> edit(String id) throws ClassNotFoundException, SQLException {
		
		String sql = "SELECT position.*, depart.depart_name " +
				"FROM position, depart " +
				"WHERE position.depart_id = depart.depart_id " +
				"AND position.position_id = ?;";
		int[] types = {Types.VARCHAR};
		Object[] values = {id};
		Map<String, Object> map = this.dao.executeQueryForMap(sql, types, values);
		return map;
	}
	
	public void update(Object[] values) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		
		String sql = "UPDATE position " +
				"SET depart_id = ?, position_name = ?, position_remark = ? " +
				"WHERE position_id = ?;";
		int[] types = {Types.VARCHAR, Types.VARCHAR, Types.VARCHAR, Types.VARCHAR};
		this.dao.executeUpdate(sql, types, values);
	}
	
	public void delete(String position_id) throws ClassNotFoundException, FileNotFoundException, SQLException, IOException {
		
		String sql = "DELETE " +
				"FROM position " +
				"WHERE position_id = ?;";
		int[] types = {Types.VARCHAR};
		Object[] values = {position_id};
		this.dao.executeUpdate(sql, types, values);
	}

}
