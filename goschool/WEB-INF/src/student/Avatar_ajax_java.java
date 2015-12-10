package student;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Avatar_ajax", urlPatterns = { "/Avatar_ajax" })
public class Avatar_ajax_java extends HttpServlet implements javax.servlet.Servlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自動生成されたメソッド・スタブ
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO 自動生成されたメソッド・スタブ
		super.doPost(req, resp);

		String eye = req.getParameter("eye");
		String hair = req.getParameter("hair");
		String mouth = req.getParameter("mouth");
		String glasses = req.getParameter("glasses");
		System.out.println(eye);
		System.out.println(hair);
		System.out.println(mouth);
		System.out.println(glasses);


	}

}
