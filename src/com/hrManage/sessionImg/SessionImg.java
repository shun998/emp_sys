package com.hrManage.sessionImg;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.geom.Line2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class SessionImg extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("SessionImg服务中...");
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		//	设置不缓存图片
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "No-cache");
		//	指定生成的响应图片
		response.setDateHeader("Expires", 0);
		//	指定响应类型
		response.setContentType("image/jpeg");
		int width = 100, height = 30;	//	指定验证码的大小
		//	创建BufferedImage对象，即图片
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		//	创建Graphics对象，即画笔
		Graphics g = image.getGraphics();
		Graphics2D g2d = (Graphics2D)g;
		Random random = new Random();
		//	定义字体样式
		Font font = new Font("楷体", Font.BOLD, 24);
		g.setColor(getRandColor(200, 250));
		//	背景
		g.fillRect(0, 0, width, height);
		//	字体
		g.setFont(font);
		g.setColor(getRandColor(180, 200));
		//	绘制100条颜色和位置随机的干扰线条
		for(int i = 0; i < 100; i ++) {
			int x = random.nextInt(width - 1);
			int y = random.nextInt(height - 1);
			int x1 = random.nextInt(6) + 1;
			int y1 = random.nextInt(12) + 1;
			//	定制线条样式
			BasicStroke bs = new BasicStroke(2f, BasicStroke.CAP_BUTT, BasicStroke.JOIN_BEVEL);
			Line2D line = new Line2D.Double(x, y, x + x1, y + y1);
			g2d.setStroke(bs);
			//	绘制直线
			g2d.draw(line);
		}
		//	输出由英文、数字、中文随机组成的验证文字
		String sRand = "";
		String ctmp = "";
		int itmp = 0;
		//	指定输出的验证码为四位
		for(int i = 0; i < 4; i ++) {
			switch(random.nextInt(3)) {
			case 1:
				//生成A ~ Z的字母
				itmp = random.nextInt(26) + 65;
				ctmp = String.valueOf((char)itmp);
				break;

			default:
				itmp = random.nextInt(10) + 48;
				ctmp = String.valueOf((char)itmp);
				break;
			}
			sRand += ctmp;
			Color color = new Color(20 + random.nextInt(110), 20 + random.nextInt(110), 20 + random.nextInt(110));
			g.setColor(color);
			//	将生成的随机数进行随机缩放与旋转
			//	旋转
			Graphics2D g2d_word = (Graphics2D)g;
			AffineTransform trans = new AffineTransform();
			trans.rotate((random.nextInt(35) + 20) * 3.14 / 180, 15 * i + 8, 7);
			//	缩放
			float scaleSize = random.nextFloat() + 0.8F;
			if(scaleSize > 1F) {
				scaleSize = 1F;
			}
			trans.scale(scaleSize, scaleSize);
			g2d_word.setTransform(trans);
			if(i == 3) {
				g.drawString(ctmp, 15 * i + 18, 14);
			} else {
				g.drawString(ctmp + "  ", 15 * i + 18, 14);
			}
		}
		HttpSession session = request.getSession();
		session.setAttribute("sessionImg", sRand);
		//	释放g所占用的系统资源
		g.dispose();
		//	输出图片
		ImageIO.write(image, "JPEG", response.getOutputStream());
	}
	
	/**
	 * 获取随机颜色
	 */
	public Color getRandColor(int s, int e) {
		
		Random random = new Random();
		if(s > 255) {
			s = 255;
		}
		if(e > 255) {
			e = 255;
		}
		int r, g, b;
		r = s + random.nextInt(e - s);
		g = s + random.nextInt(e - s);
		b = s + random.nextInt(e - s);
		return new Color(r, g, b);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("SessionImg销毁中...");
	}

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("SessionImg初始化...");
	}

}
