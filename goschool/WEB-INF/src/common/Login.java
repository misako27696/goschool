/**
 * date:2015/10/23
 * name:田中翔子
 * comm:ログイン用Java
 **/

package common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns="/main")
public class Login extends HttpServlet {

	String path = "";

	public Login() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");

		
		//Beanの使用
		ConnectDB db = new ConnectDB();
		// 値の取得＆設定
		db.setInputID(req.getParameter("userid"));
		db.setInputPW(req.getParameter("userpw"));
		db.setInputClassif(req.getParameter("classif"));
		
		//DB側でユーザ認証
		boolean rslt = db.userAuth();
		System.out.println("返答は" + rslt);
		
		//結果を元に遷移先決定
		if(rslt){
			HttpSession session = req.getSession(false);//sessionあるかないか
			if (session != null){
				session.invalidate();//存在したら削除
			}
			session = req.getSession(true);//session新規作成
			//sessionオブジェクトに値を設定
			session.setAttribute("userAuth", 1);
			session.setAttribute("userID", db.getUserID());
			session.setAttribute("userFName", db.getUserFName());
			session.setAttribute("userLName", db.getUserLName());
			session.setAttribute("userClass", db.getUserClassID());
			session.setAttribute("userClassSession", db.getUserClassSession());
			session.setAttribute("classTeacher", db.getClassTeacher(session.getAttribute("userClass").toString()));
			
			if(req.getParameter("classif").equals("student")){
				path = "/mypagestudent";
			}else{
				path = "/classroomteacher";
			}
		}else{
			req.setAttribute("message", "入力されたID又はパスワードが違います");
			path = "/common/err.jsp";
		}

		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
}
