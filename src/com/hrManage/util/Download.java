package com.hrManage.util;
/**
 * 下载的工具类
 */
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

public class Download {
	
	private String filePath = null;
	
	public Download(String name) {
		
		this.filePath = name;
		
		
	}
	
	public Download(File file) {
		
		
	}
	
	public Download(String path, String name) {
		
		
	}
	
	public Download(String path, File file) {
		
		
	}
	
	public ByteArrayOutputStream downFile() throws IOException {

		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		File file = new File(filePath);
		if(!file.exists()) {
			System.out.println(filePath + "不存在！");
		} else {
			FileInputStream fis = new FileInputStream(filePath);
			BufferedInputStream bis = new BufferedInputStream(fis);
			BufferedOutputStream bos = new BufferedOutputStream(baos);
			int hasNext = 0;
			while((hasNext = bis.read()) != -1) {
				bos.write(hasNext);
			}
			//	刷出流
			bos.flush();
			bos.close();
			bis.close();
			fis.close();
		}
		return baos;
	}
	
	public void deleteFile() {
		
		File file = new File(filePath);
		if(file.exists() && file.isFile()) {
			file.delete();
			System.out.println(filePath + "删除成功！");
		}
	}

}
