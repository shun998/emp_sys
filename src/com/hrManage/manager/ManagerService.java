package com.hrManage.manager;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.hrManage.dao.Dao;
import com.hrManage.dao.DaoImpl;

public class ManagerService {
	Dao dao=new DaoImpl();

	public List<Map<String, Object>> queryManage(String queryname) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		if( queryname == null ) queryname = "";
		
		String sql = "SELECT * FROM manager WHERE manager_name LIKE ? ";
		
		int[] types = new int[1];
		types[0] = Types.VARCHAR;
		
		
		Object[] values = new Object[1];
		values[0] = "%"+queryname+"%";
		
		return dao.executeQueryForList(sql, types, values);
	}

	public Map<String, Object> queryManageById(String manager_id) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		String sql=("select*from manager where manager_id=?");
		int[] types={Types.VARCHAR};
		Object[] values={manager_id};
		return dao.executeQueryForMap(sql, types, values);
	}

	public void add(String manager_id, String manager_name, String manager_pass) throws FileNotFoundException, ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		//sql语句
				String sql = "INSERT INTO  manager(manager_id, manager_name, manager_pass) VALUES(?,?,?)";
				
		       //定义数据类型.
				int[] types = new int[3];
				types[0] = Types.VARCHAR;
				types[1] = Types.VARCHAR;
				types[2] = Types.VARCHAR;

				//获取数据
				Object[] objects = new Object[3];
				
				objects[0] = UUID.randomUUID().toString();
				objects[1] = manager_name;
				objects[2] = manager_pass;

				dao.executeUpdate(sql, types, objects);
		
	}

	public void edit(String manager_id, String manager_name, String manager_pass) throws FileNotFoundException, ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		//sql语句
		String sql = "UPDATE manager SET manager_name=?, manager_pass=? WHERE manager_id=?";
		
       //定义数据类型.
		int[] types = new int[3];
		types[0] = Types.VARCHAR;
		types[1] = Types.VARCHAR;
		types[2] = Types.VARCHAR;

		//获取数据
		Object[] values = new Object[3];
		
		
		values[0] = manager_name;
		values[1] = manager_pass;
		values[2] = manager_id;

		dao.executeUpdate(sql, types, values);
		
	}

	public void delete(String manager_id) throws FileNotFoundException, ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		String sql = "DELETE FROM manager WHERE manager_id=?";

		int[] types = new int[1];
		types[0]= Types.VARCHAR;
		
		Object[] vlues = new Object[1];
		vlues[0] = manager_id;

		dao.executeUpdate(sql, types, vlues);
		
	}
	
	public List<Map<String, Object>> excel(String name) throws ClassNotFoundException, SQLException {
		
		String sql = "SELECT manager_name AS '帐号', manager_pass AS '密码' " +
				"FROM manager " +
				"WHERE manager_name LIKE ?;";
		int[] types = {Types.VARCHAR};
		if(name == null || name.equals(" ")) {
			name = "";
		}
		Object[] values = {"%" + name + "%"};
		List<Map<String, Object>> list = this.dao.executeQueryForList(sql, types, values);
		return list;
	}

}
