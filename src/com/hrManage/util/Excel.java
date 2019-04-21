package com.hrManage.util;
/**
 * excel的工具类
 */
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.hrManage.util.CurrentTime;

public class Excel {
	
	private String filePath = null;
	private String fileName = null;
	
	public Excel(String filePath) {
		
		this.filePath = filePath;
		CurrentTime current = new CurrentTime();
		this.fileName = UUID.randomUUID().toString() + current.getYear() + current.getMonth() + current.getDay() + current.getHour() + current.getMinute() + current.getSecond();
		this.fileName += ".xls";
	}
	
	public String write(List<Map<String, Object>> list) {
		
		//	设置返回的字符串
		String str = null;
		//	创建一个新的HSSFWorkbook对象
		HSSFWorkbook workbook = new HSSFWorkbook();
		//	创建一个Excel的工作表，可以指定工作表的名字
		HSSFSheet sheet = workbook.createSheet("导出Excel数据");
		//	创建表头字体，黑色、粗体
		HSSFFont fontHeader = workbook.createFont();
		fontHeader.setColor(HSSFFont.COLOR_NORMAL);
		fontHeader.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		//	创建内容字体，黑色、非粗体
		HSSFFont fontContent = workbook.createFont();
		fontContent.setColor(HSSFFont.COLOR_NORMAL);
		fontContent.setBoldweight(HSSFFont.BOLDWEIGHT_NORMAL);
		//	创建表头单元格的格式
		HSSFCellStyle headerStyle = workbook.createCellStyle();
		//	水平居中
		headerStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		//	垂直居中
		headerStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		//	设置字体
		headerStyle.setFont(fontHeader);
		//	创建内容单元格的格式
		HSSFCellStyle contentStyle = workbook.createCellStyle();
		//	水平居左
		contentStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
		//	垂直居中
		contentStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		//	设置字体
		contentStyle.setFont(fontContent);
		// 开始建立表格
		//	行标
		int rowNum = 0;
		//	列标
		int colNum = 0;
		//	以下为表格内容
		//	第一行为表头
		Map<String, Object> map = list.get(0);
		Set set = map.keySet();
		Object[] array = set.toArray();
		// 建立表头信息
		// 创建行
		HSSFRow row = sheet.createRow((short)rowNum);
		// 单元格
		HSSFCell cell = null;
		for (int j = 0; j < array.length; j++) {
			// 在当前行的colNum列上创建单元格
			cell = row.createCell(colNum);
			// 定义单元格的字符类型
			cell.setCellType(HSSFCell.CELL_TYPE_STRING);
			// 定义单元格的编码方式
			// cell.setEncoding((short)HSSFCell.ENCODING_UTF_16);
			// 设置单元格格式
			cell.setCellStyle(headerStyle);
			// 添加内容至单元格
			cell.setCellValue((String)array[j]);
			colNum ++;
		}
		rowNum++;
		//	开始添加内容
		for (int i = 0; i < list.size(); i++) {
			//	新建第rowNum
			row = sheet.createRow((short)rowNum);
			map = list.get(i);
			set = map.keySet();
			array = set.toArray();
			colNum = 0;
			for(int j = 0; j < map.size(); j ++) {
				//	在当前行的colNum位置创建单元格
				cell = row.createCell(colNum);
				cell.setCellType(HSSFCell.CELL_TYPE_STRING);
				//cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellStyle(contentStyle);
				cell.setCellValue((String)map.get(array[j]));
				colNum ++;
			}
			rowNum ++;
		}
		try {
			//写入文件
			File file = new File(filePath + File.separator + fileName);
			FileOutputStream fos = new FileOutputStream(file);
			//	将创建的Excel内容写入到指定的Excel文件中
			workbook.write(fos);
			//	刷出流信息
			fos.flush();
			//	关闭文件
			fos.close();
			System.out.println(fileName + "创建成功\n\t路径为：" + file.getAbsolutePath());
			str = file.getAbsolutePath();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return str;
	}

	public void read() {
		
		
	}

}
