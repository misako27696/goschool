package teacher;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.ConnectDB;

@WebServlet(urlPatterns="/mypagetuition")
public class MypageTuition extends HttpServlet{
	
	String path = "";
	
	public MypageTuition() {
		// TODO 自動生成されたコンストラクター・スタブ
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
		System.out.println("マイページtuition↓↓↓↓↓↓");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		System.out.println("マイページtuition↓↓↓↓↓↓");
		
		req.setCharacterEncoding("utf-8");
		
		//Beanの使用
		ConnectDB db = new ConnectDB();
		//セッション・オブジェクトの確認
		HttpSession session = req.getSession(false);
		System.out.println(session);

		int iSession = 0;

		// ログイン状態のチェック
		if (session != null){
			System.out.println("session!=null");
			if(session.getAttribute("userAuth")!=null){
				//intキャスト
				System.out.println("intへキャスト");
				iSession = Integer.parseInt(session.getAttribute("userAuth").toString());
			}
			if(iSession==1) {

				//今日の曜日、日付取得
				Calendar cal = Calendar.getInstance();
				int year = cal.get(Calendar.YEAR);
				int month = cal.get(Calendar.MONTH);    // 0 = 1 月
				int day = cal.get(Calendar.DATE);
				//フォーマットパターンを指定して表示する
				SimpleDateFormat sdf = new SimpleDateFormat("M");
				System.out.println("日付フォーマット"+sdf.format(cal.getTime()));

				//		//日付変更ボタンを押してきたとき
				//		if(req.getParameter("flag") != null){
				//			System.out.println("-----こっち通ったよいぇい------");
				//			System.out.println(req.getParameter("flag"));
				//			System.out.println("year中身"+session.getAttribute("year"));
				//			year = Integer.parseInt(session.getAttribute("year").toString());
				//			month = Integer.parseInt(session.getAttribute("month").toString());
				//			System.out.println("monthdown中身"+req.getParameter("monthdown"));
				//			
				//			if(req.getParameter("monthdown")!=null){
				//				if(month==1){
				//					session.setAttribute("year", year-1);
				//					session.setAttribute("month", 12);
				//				}else{
				//					session.setAttribute("year", year);
				//					session.setAttribute("month", month-1);
				//				}
				//			}else if(req.getParameter("monthup")!=null){
				//				if(month==12){
				//					session.setAttribute("year", year+1);
				//					session.setAttribute("month", 1);
				//				}else{
				//					session.setAttribute("year", year);
				//					session.setAttribute("month", month+1);
				//				}
				//			}else if(req.getParameter("yeardown")!=null){
				//				session.setAttribute("year", year-1);
				//			}else{ //yearup
				//				session.setAttribute("year", year+1);
				//			}
				//		}else{
				//			System.out.println("-----こっち通ったよいぇい334------");
				//			session.setAttribute("year", year);
				//			session.setAttribute("month", month+1);
				//		}


				//------クラス名取得------
				String className = new String();
				className = db.getClassName(String.valueOf(session.getAttribute("userClass")));
				req.setAttribute("className", className);
				System.out.println("-----クラス名表示------");
				System.out.println(className);
				//------------------

				//-------名簿-------
				ArrayList<Map<String, String>> members = new ArrayList<Map<String, String>>();
				members = db.getMeibo(String.valueOf(session.getAttribute("userClass")));
				req.setAttribute("members", members);
				System.out.println("-----名簿表示------");
				System.out.println(members);
				//------------------

				//		//-------個人の出席状況-------
				//		ArrayList<Map<String, String>> attends = new ArrayList<Map<String, String>>();
				//		attends = db.getClassAttend(Integer.parseInt(String.valueOf(session.getAttribute("year"))),
				//									Integer.parseInt(String.valueOf(session.getAttribute("month"))),
				//									String.valueOf(session.getAttribute("userClass")));
				//		req.setAttribute("attends", attends);
				//		System.out.println("-----出席状況表示------");
				//		System.out.println(attends);
				//		//------------------
				//		
				//		//-------総授業日数-------
				//		int totalDays = db.getTotalday(Integer.parseInt(String.valueOf(session.getAttribute("year"))),
				//										Integer.parseInt(String.valueOf(session.getAttribute("month"))),
				//										String.valueOf(session.getAttribute("userClass")));
				//		req.setAttribute("totalDays", totalDays);
				//		System.out.println("-----総授業日数------");
				//		System.out.println(totalDays);
				//		//------------------


				path = "/teacher/myPage_Tuition.jsp";
			}else{
				req.setAttribute("message", "不正なセッションです。<br>ログインし直してください。");
				path = "/common/err.jsp";
			}
		}else{
			System.out.println("session==null");
			req.setAttribute("message", "ログインしてください。");
			path = "/common/err.jsp";
		}

		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
}
