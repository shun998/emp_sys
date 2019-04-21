package com.hrManage.dao;
/**
 * 员工管理的操作dao
 */
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
public interface Dao {
    public Map<String, Object> executeQueryForMap(String sql) throws ClassNotFoundException, SQLException;
	public Map<String, Object> executeQueryForMap(String sql , int[] types,Object[] values) throws ClassNotFoundException, SQLException ;
    
    public List<Map<String, Object>> executeQueryForList(String sql) throws ClassNotFoundException, SQLException;
	public List<Map<String, Object>> executeQueryForList(String sql , int[] types,Object[] values) throws ClassNotFoundException, SQLException ;
    
	

	public int executeUpdate(String sql) throws ClassNotFoundException, SQLException ;
	public int executeUpdate(String sql , int[] types,Object[] values) throws ClassNotFoundException, SQLException, FileNotFoundException, IOException ;
	
	public int executeQueryForInt(String sql ) throws ClassNotFoundException, SQLException ;
	public int executeQueryForInt(String sql , int[] types,Object[] values) throws ClassNotFoundException, SQLException ;

}
