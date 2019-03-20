package servlet;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Transform;
import util.xml2cpp;

public class test extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public test() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String s = request.getParameter("code");
		System.out.println("Get\n" + s);
		String pathhead = request.getSession().getServletContext().getRealPath(
				"/");
		ByteArrayInputStream is = new ByteArrayInputStream(s.getBytes("UTF-8"));
		String res = xml2cpp.ExecuteXSL(is, pathhead + "xsl/code.xsl");
		PrintWriter out = response.getWriter();
		if (res!=null) {
			xml2cpp.createFile(res, "/home/wsl/webdata/C_code/code.cpp");
			out.write(res);

		} else {
			out.write("\n\n\nXML文件格式错误\n\n\n" + s);
		}
		out.flush();
		out.close();
		/*
		 * String s = request.getParameter("code"); s=new
		 * String(s.getBytes("iso8859-1"),"utf-8"); System.out.println(s);
		 * String pathhead =
		 * request.getSession().getServletContext().getRealPath( "/");
		 * ByteArrayInputStream is = new
		 * ByteArrayInputStream(s.getBytes("UTF-8")); boolean flag =
		 * Transform.xmlTocode(is, pathhead + "xsl\\code.xsl", pathhead +
		 * "temp\\code.c"); PrintWriter out = response.getWriter(); if (flag) {
		 * out.write("123456");
		 * 
		 * } else { out.write("\n\n\nXML文件格式错误\n\n\n"+s); } out.flush();
		 * out.close();
		 */
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		String s = request.getParameter("code");
		System.out.println("POST\n" + s);
		String pathhead = request.getSession().getServletContext().getRealPath(
				"/");
		ByteArrayInputStream is = new ByteArrayInputStream(s.getBytes("UTF-8"));
		boolean flag = Transform.xmlTocode(is, pathhead + "xsl/code.xsl",
				"/home/wsl/webdata/C_code/code.cpp");
		PrintWriter out = response.getWriter();
		if (flag) {
			out.write("123456");

		} else {
			out.write("\n\n\nXML文件格式错误\n\n\n" + s);
		}
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
