package com.hrManage.util;
/**
 * 当前时间的获取的工具类
 */
import java.text.SimpleDateFormat;
import java.util.Date;

public class CurrentTime {
	
	/********
	 * 定义日期样式
	 */
	public static final int DATE_TYPE_ZHCN = 0;				//	年月日
	public static final int DATE_TYPE_WHIP = 1;				//	年-月-日
	public static final int DATE_TYPE_SLASH_YEA = 2;		//	年/月/日
	public static final int DATE_TYPE_SLASH_MON = 3;		//	月/日/年
	public static final int DATE_TYPE_SLASH_SAY = 4;		//	日/月/年
	/********
	 * 定义时间样式
	 */
	public static final int TIME_TYPE_LONG = 0;				//	24 00
	public static final int TIME_TYPE_SHORT = 1;			//	24 0
	public static final int TIME_TYPE_COMMON = 2;			//	12 00
	public static final int TIME_TYPE_NORMAL = 3;			//	12 0
	/********
	 * 定义上下午样式
	 */
	public static final int AMPM_TYPE_COMMON = 0;			//	上午
	public static final int AMPM_TYPE_UP = 1;				//	AM
	public static final int AMPM_TYPE_LOW = 2;				//	am
	/********
	 * 定义星期样式
	 */
	public static final int WEEK_TYPE_COMMON = 0;			//	星期一	
	public static final int WEEK_TYPE_NORMAL = 1;			//	周一
	public static final int WEEK_TYPE_EN = 2;				//	Monday
	public static final int WEEK_TYPE_SHORT = 3;			//	Mon
	/********
	 * 定义日期和时间样式
	 */
	
	
	private Date date;
	private SimpleDateFormat sdf;
	
	public CurrentTime() {
		
		this.date = new Date();
	}
	
	/**
	 * 获取当前的日期和时间
	 * @param int choice
	 * @return String
	 */
	public String getDatetime(int choice) {
		return null;
		
		
	}
	
	/**
	 * 获取当前的日期
	 * @param int choice
	 * @return String
	 */
	public String getDate(int choice) {
		
		switch(choice) {
		case 0:
			this.sdf = new SimpleDateFormat("yyyy年MM月dd日");
			break;
		case 1:
			this.sdf = new SimpleDateFormat("yyyy-MM-dd");
			break;
		case 2:
			this.sdf = new SimpleDateFormat("yyyy/MM/dd");
			break;
		case 3:
			this.sdf = new SimpleDateFormat("MM/dd/yyyy");
			break;
		case 4:
			this.sdf = new SimpleDateFormat("dd/MM/yyyy");
			break;
		}
		return sdf.format(date);
	}
	
	/**
	 * 获取当前时间
	 * @return String
	 */
	public String getTime() {
		return null;
		
		
	}
	
	/**
	 * 获取当前星期
	 * @param int choice
	 * @return String
	 */
	public String getWeek(int choice) {
		
		switch(choice) {
		case 0:
			break;
		case 1:
			break;
		case 2:
			break;
		case 3:
			break;
		}
		return null;
	}
	
	/**
	 * 获取当前年份
	 * @return String
	 */
	public String getYear() {
		
		this.sdf = new SimpleDateFormat("yyyy");
		return sdf.format(date);
	}
	
	/**
	 * 获取当前月份
	 * @return String
	 */
	public String getMonth() {
		
		this.sdf = new SimpleDateFormat("MM");
		return sdf.format(date);
	}

	/**
	 * 获取当前日数
	 * @return String
	 */
	public String getDay() {
	
		this.sdf = new SimpleDateFormat("dd");
		return sdf.format(date);
	}

	/**
	 * 获取当前小时
	 * @return String
	 */
	public String getHour() {
	
		this.sdf = new SimpleDateFormat("HH");
		return sdf.format(date);
	}

	/**
	 * 获取当前分钟
	 * @return String
	 */
	public String getMinute() {
	
		this.sdf = new SimpleDateFormat("mm");
		return sdf.format(date);
	}

	/**
	 * 获取当前秒数
	 * @return String
	 */
	public String getSecond() {
	
		this.sdf = new SimpleDateFormat("ss");
		return sdf.format(date);
	}

}
