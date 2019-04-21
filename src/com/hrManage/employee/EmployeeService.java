package com.hrManage.employee;
/**
 * 员工的逻辑层
 */
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.hrManage.dao.Dao;
import com.hrManage.dao.DaoImpl;

public class EmployeeService {
Dao dao = new DaoImpl();
	public List<Map<String, Object>> queryEmployee() throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub

		String sql = "SELECT employee.*, depart.depart_name, position.position_name " +
				"FROM employee, depart, position " +
				"WHERE employee.depart_id = depart.depart_id " +
				"AND employee.position_id = position.position_id";
		return dao.executeQueryForList(sql);
	}

	public void add( String name, String sex, String brith,String date, String position_id
			,String depart_id, String state, String state_time, String address,
			 String tel, String remark) throws FileNotFoundException, ClassNotFoundException, SQLException, IOException {
		String sql = "INSERT INTO employee " +
				"(employee_id, employee_name, employee_sex, employee_brith, employee_date, position_id, depart_id, employee_state, employee_state_time, employee_address, employee_tel, employee_remark) " +
				"VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		int types[] = new int[12];
		types[0] = Types.VARCHAR;
		types[1] = Types.VARCHAR;
		types[2] = Types.VARCHAR;
		types[3] = Types.VARCHAR;
		types[4] = Types.VARCHAR;
		types[5] = Types.VARCHAR;
		types[6] = Types.VARCHAR;
		types[7] = Types.VARCHAR;
		types[8] = Types.VARCHAR;
		types[9] = Types.VARCHAR;
		types[10] = Types.VARCHAR;
		types[11] = Types.VARCHAR;
		Object[] values = new Object[12];
		values[0] = UUID.randomUUID().toString();
		values[1] = name;
		values[2] = sex;
		values[3] = brith;
		values[4] = date;
		values[5] = position_id;
		values[6] = depart_id;
		values[7] = state;
		values[8] = state_time;
		values[9] = address;
		values[10] = tel;
		values[11] = remark;

		dao.executeUpdate(sql, types, values);
	}

	public void delete(String id) throws FileNotFoundException, ClassNotFoundException, SQLException, IOException {
		String sql = "delete from employee where employee_id = ?";
		int[] types = {Types.VARCHAR};
	    Object[] valuesObjects ={id};
	    dao.executeUpdate(sql, types, valuesObjects);
	}

	public Map<String, Object> queryemployeeById(String id) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		String sql = "SELECT employee.*, depart.depart_name, position.position_name " +
				"FROM employee, depart, position " +
				"WHERE employee.depart_id = depart.depart_id " +
				"AND employee.position_id = position.position_id " +
				"AND employee.employee_id = ?";
		int[] types = {Types.VARCHAR};
		Object[] values = {id};
		return dao.executeQueryForMap(sql, types, values);
	}


	public void edit(String id, String name, String sex, String brith,
			String depart_id, String position_id, String date, String state,
			String state_time, String address, String tel, String remark) throws FileNotFoundException, ClassNotFoundException, SQLException, IOException {
		// TODO Auto-generated method stub
		String sql = "update employee set " +
				"employee_name=?, " +
				"employee_sex=?, " +
				"employee_brith=?, " +
				"employee_date=?, " +
				"depart_id=?, " +
				"position_id=?, " +
				"employee_state=?, " +
				"employee_state_time=?, " +
				"employee_address=?, " +
				"employee_tel=?, " +
				"employee_remark=? " +
				
				"where employee_id=? ;";
		int types[] = new int[12];
		types[0] = Types.VARCHAR;
		types[1] = Types.VARCHAR;
		types[2] = Types.VARCHAR;
		types[3] = Types.VARCHAR;
		types[4] = Types.VARCHAR;
		types[5] = Types.VARCHAR;
		types[6] = Types.VARCHAR;
		types[7] = Types.VARCHAR;
		types[8] = Types.VARCHAR;
		types[9] = Types.VARCHAR;
		types[10] = Types.VARCHAR;
		types[11] = Types.VARCHAR;
		Object[] values = new Object[12];
		values[0] = name;
		values[1] = sex;
		values[2] = brith;
		values[3] = date;
		values[4] = position_id;
		values[5] = depart_id;
		values[6] = state;
		values[7] = state_time;
		values[8] = address;
		values[9] = tel;
		values[10] = remark;
		values[11] = id;

		dao.executeUpdate(sql, types, values);
	}

	public List<Map<String, Object>> queryPosition() throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		String sql = "SELECT depart.depart_id, depart_name, position_id, position_name " +
				"FROM	depart, position " +
				"WHERE depart.depart_id = position.depart_id;";
		return dao.executeQueryForList(sql);
	}

	

	

}
