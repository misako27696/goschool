/**
 * date:2015/10/28
 * name:田中翔子
 * comm:ログアウト用Java
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

@WebServlet(urlPatterns="/logout")
public class Logout extends HttpServlet {

	public Logout() {
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
		
		//ireq.setCharacterEncoding("utf-8");
		
		//セッション・オブジェクトの確認
		HttpSession session = req.getSession(false);
		System.out.println(session);
		
		//セッションが存在する場合
		if (session != null){
			System.out.println("セッションを切断します");
			session.invalidate();
			
			//削除できたか確認
			session = req.getSession(false);
		      if (session == null){
		    	  System.out.println("セッションを切断しました");
		      }else{
		    	  System.out.println("セッションを切断できませんでした");
		      }
			System.out.println(session);
			
			req.setAttribute("message", "ログアウトしました。");
		} else {
			req.setAttribute("message", "セッションが存在しません。");
		}

		//JSPファイルへフォワードするRequestDispatcherオブジェクト
		RequestDispatcher rd = req.getRequestDispatcher("/common/logout.jsp");
		//JSPファイルへフォワード
		rd.forward(req,resp);
	}
}
