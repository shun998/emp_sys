package com.hrManage.checkl;
/**
 * 验证的逻辑层
 */
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.hrManage.dao.Dao;
import com.hrManage.dao.DaoImpl;
public class ChecklService {
	Dao dao = new DaoImpl();
	public List<Map<String, Object>> querycheckl(String select, String key) throws ClassNotFoundException, SQLException {
		//sql语句 查询3个关联表的数据
		String sql = "SELECT checkl.*, employee_name, depart.* " +
				"FROM checkl, employee, depart " +
				"WHERE checkl.employee_id = employee.employee_id " +
				"AND employee.depart_id = depart.depart_id";
		//由参数值判断获得查询方式
		if (select == null) {
		return dao.executeQueryForList(sql);	
		}else if ("employee_name".equals(select)) {
			//按employee_name方式查询
			System.out.println("select-->employee_name");
			sql = sql + " and employee.employee_name like ? ";
			Object values[] = {"%"+key+"%"};
			//返回结果
			return dao.executeQueryForList(sql, new int[]{Types.VARCHAR}, values);
		} else if ("depart_name".equals(select)) {
			//按depart_name方式查询
			System.out.println("select-->depart_name");
			sql = sql + " and depart.depart_name like ?";
			Object values[] = {"%"+key+"%"};
			//返回结果
			return dao.executeQueryForList(sql, new int[]{Types.VARCHAR}, values);
		} 
		else if ("checkl_date".equals(select)) {
			//按checkl_date方式查询
			System.out.println("select-->checkl_date");
			sql = sql + " and checkl.checkl_date like ? ";
			Object values[] = {"%"+key+"%"};
			//返回结果
			return dao.executeQueryForList(sql, new int[]{Types.VARCHAR}, values);
		} 
		return dao.executeQueryForList(sql);
	}
	public List<?> queryemployee() throws ClassNotFoundException, SQLException {
		String  sql = "select * from employee";
		return dao.executeQueryForList(sql);
	}
	public List<Map<String, Object>> querycheckl(String checkl_date) throws ClassNotFoundException, SQLException {
		String sql = "SELECT checkl.*, employee_name, depart.* " +
				"FROM checkl, employee, depart " +
				"WHERE checkl.employee_id = employee.employee_id " +
				"AND employee.depart_id = depart.depart_id and checkl_date = ?";
		return dao.executeQueryForList(sql, new int[]{Types.VARCHAR}, new Object[]{checkl_date});
		
	}
	public void creat(String checkl_date) throws FileNotFoundException, ClassNotFoundException, SQLException, IOException {
		String sql = "insert into checkl values(?,?,?,?,?)";
		List<?> list = queryemployee();
		
		for (int i = 0; i < list.size(); i++) {
			System.out.println("enter");
			Map<String, Object> map = (Map<String, Object>)list.get(i);
			int types[]=new int[5];
			types[0] = Types.VARCHAR; 
			types[1] = Types.VARCHAR;
			types[2] = Types.VARCHAR;
			types[3] = Types.VARCHAR;
			types[4] = Types.VARCHAR;
			Object [] values = new Object[5]; 
			values[0] = UUID.randomUUID().toString();
			values[1] = map.get("employee_id");
			values[2] = nowtime();
			values[3] = "";
			values[4] = "";
			dao.executeUpdate(sql, types, values);
		}
		System.out.println("over");
	}

	private String nowtime() {
		SimpleDateFormat time = new SimpleDateFormat("yyyy年MM月dd日");
		Date curDate = Calendar.getInstance().getTime();
		String nowtime = time.format(curDate);
		return nowtime;
	}
	public void savestate(String[] checkl_id, String[] checkl_state,
			String[] checkl_remark) throws FileNotFoundException, ClassNotFoundException, SQLException, IOException {
		for (int i = 0; i < checkl_id.length; i++) {
		String sql = "update checkl set checkl_state=?,checkl_remark=? where checkl_id=?";
		int types[]=new int[3];
		types[0] = Types.VARCHAR; 
		types[1] = Types.VARCHAR;
		types[2] = Types.VARCHAR;
		Object [] values = new Object[3]; 
		values[0] = checkl_state[i];
		values[1] = checkl_remark[i];
		values[2] = checkl_id[i];		
		dao.executeUpdate(sql, types, values);
		}
	}
	public void delete(String[] delIdArray) throws FileNotFoundException, ClassNotFoundException, SQLException, IOException {
		for (int i = 0; i < delIdArray.length; i++) {
			String sql = "delete from checkl where checkl_id=?";
			

			int[] types = new int[1];
			types[0] = Types.VARCHAR;
			Object[] values = new Object[1];
			values[0] = delIdArray[i];
			dao.executeUpdate(sql, types, values);


		}
		
	}
}
