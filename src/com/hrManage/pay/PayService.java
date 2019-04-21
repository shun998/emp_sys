package com.hrManage.pay;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.hrManage.dao.Dao;
import com.hrManage.dao.DaoImpl;
public class PayService {
	
	private Dao dao=new DaoImpl();
	public List<?> queryPay(String employee_id) throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList("select * from pay");
	}
	

	public List<?> queryEmployee() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList("select p.* ,e.employee_name from pay as p left join employee as e on p.employee_id=e.employee_id");
	}



	public List<Map<String, Object>> queryEmployeelist() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList("select * from employee");
	}



	public void add(String pay_id, String employee_id, String pay_basic,
			String pay_perf, String pay_reapu, String pay_sub, String pay_remark) throws FileNotFoundException, ClassNotFoundException, SQLException, IOException {
		String sql="insert into pay values(?,?,?,?,?,?,?)";
		int[] types=new int[7];
		types[0]=Types.VARCHAR;
		types[1]=Types.VARCHAR;
		types[2]=Types.VARCHAR;
		types[3]=Types.VARCHAR;
		types[4]=Types.VARCHAR;
		types[5]=Types.VARCHAR;
		types[6]=Types.VARCHAR;
		Object[]values=new Object[7];
				values[0]=UUID.randomUUID().toString();
				values[1]=employee_id;
				values[2]=pay_basic;
				values[3]=pay_perf;
				values[4]=pay_reapu;
				values[5]=pay_sub;
				values[6]=pay_remark;
				dao.executeUpdate(sql, types, values);
		
	}

	public Map<String, Object> querypayById(String id) throws ClassNotFoundException, SQLException {
		String sql = "select pay.*, employee_name from pay, employee where pay.employee_id = employee.employee_id and pay.pay_id=?";
		int[] types = {Types.VARCHAR};
		Object[] values = {id};
		return dao.executeQueryForMap(sql, types, values);
	}
	public List<?> queryEmploye() throws ClassNotFoundException, SQLException {
		return dao.executeQueryForList("select * from employee");
	}

	
	public void edit(String pay_id, String employee_id, String pay_basic,
			String pay_perf, String pay_reapu, String pay_sub, String pay_remark) throws FileNotFoundException, ClassNotFoundException, SQLException, IOException {
		String sql="update pay set employee_id=?,pay_basic=?,pay_perf=?,pay_reapu=?,pay_sub=?,pay_remark=? where pay_id=?";
		
		int[]types=new int[7];
		types[0]=Types.VARCHAR;
		types[1]=Types.VARCHAR;
		types[2]=Types.VARCHAR;
		types[3]=Types.VARCHAR;
		types[4]=Types.VARCHAR;
		types[5]=Types.VARCHAR;
		types[6]=Types.VARCHAR;
		
		Object[]values=new Object[7];
		values[0]=employee_id;
		values[1]=pay_basic;
		values[2]=pay_perf;
		values[3]=pay_reapu;
		values[4]=pay_sub;
		values[5]=pay_remark;
		values[6]=pay_id;
		
		dao.executeUpdate(sql, types, values);
	}
	
	
	
	public void deletePay(String id) throws FileNotFoundException, ClassNotFoundException, SQLException, IOException {
		String sql1="delete from employee where pay_id=?";
		String sql2="delete from pay where pay_id=?";
		int[] types = {Types.VARCHAR};
		Object[] values = {id};
		dao.executeUpdate(sql1, types, values);
		dao.executeUpdate(sql2, types, values);
		
	}


	

	



	








	



	

	



	
	
	

}
