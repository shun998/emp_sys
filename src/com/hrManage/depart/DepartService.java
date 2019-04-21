package com.hrManage.depart;

/**
 * 部门的逻辑层接口
 */
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.sql.Types;
import com.hrManage.dao.Dao;
import com.hrManage.dao.DaoImpl;

public class DepartService {
	
	private Dao dao = new DaoImpl();

	public List<Map<String, Object>> queryDepart() {
		String sql = "select * from depart";
		List<Map<String, Object>> list = null;
		try {
			list = dao.executeQueryForList(sql);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public void addDepart(String depart_name, String depart_remark) {
		
		String sql = "insert into depart values(?,?,?)";
		int [] types = new int[3];
		Object[] values = new Object[3];
		
		types[0] = Types.VARCHAR;
		types[1] = Types.VARCHAR;
		types[2] = Types.VARCHAR;
		
		values[0] = UUID.randomUUID().toString();
		values[1] = depart_name;
		values[2] = depart_remark;
		
		try {
			dao.executeUpdate(sql, types, values);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	public int employeeNum(String depart_id){
		
		int count = 0;
		
		String sql = "select count(depart_id) from employee where depart_id =?";
		
		int [] types = {Types.VARCHAR};
		
		Object[] values = { depart_id }; 
		
		try {
			count = dao.executeQueryForInt(sql, types, values);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
		
	}

	public void deleteDepart(String depart_id) {
		
		String sql1 = "delete from employee where depart_id in (select depart_id from depart where depart_id=?)";
		String sql2 = "delete from position where depart_id in (select depart_id from depart where depart_id=?)";
		String sql3 = "delete from depart where depart_id=?";
		
		int [] types = {Types.VARCHAR};
		Object [] values = {depart_id};
		
		try {
			dao.executeUpdate(sql1, types, values);
			dao.executeUpdate(sql2, types, values);
			dao.executeUpdate(sql3, types, values);
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
	}

	public Map<String, Object> showDepart(String depart_id) {
		
		String sql = "select * from depart where depart_id=?";
		
		int[] types ={Types.VARCHAR};
		Object[] values = {depart_id};
		
		Map<String, Object> map = null;
		
		try {
			map = dao.executeQueryForMap(sql, types, values);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		
		
		return map;
	}

	public void editDepart(String depart_id, String depart_name,
			String depart_remark) {
		
		String sql = "update depart set depart_name=?,depart_remark=? where depart_id=?";
		int [] types = new int[3];
		Object[] values = new Object[3];
		
		types[0] = Types.VARCHAR;
		types[1] = Types.VARCHAR;
		types[2] = Types.VARCHAR;
		
		values[0] = depart_name;
		values[1] = depart_remark;
		values[2] = depart_id;
		
		try {
			dao.executeUpdate(sql, types, values);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	

}
