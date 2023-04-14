package kr.or.ddit.study.chat.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/withMeChatImg.do")
public class WithMeChatImg extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		String path = request.getParameter("path");
		
		File file = new File(path);
		
		BufferedInputStream bin = null;
		BufferedOutputStream bout = null;
		try {
			bout = new BufferedOutputStream(response.getOutputStream());
			bin = new BufferedInputStream(new FileInputStream(file));
			
			byte[] temp = new byte[1024];
			int len = 0;
			while((len = bin.read(temp)) > 0) {
				bout.write(temp, 0, len);
			}
			bout.flush();
			
		} catch (Exception e) {
			System.out.println("입출력 오류 : " + e.getMessage());
		} finally {
			if(bout != null) try { bout.close(); } catch(Exception e) {}
			if(bin != null) try { bin.close(); } catch(Exception e) {}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
