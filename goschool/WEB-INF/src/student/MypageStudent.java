package student;

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

@WebServlet(urlPatterns="/mypagestudent")
public class MypageStudent extends HttpServlet{
	
String path = "";
	
	public MypageStudent() {
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
		
		System.out.println("マイページ生徒↓↓↓↓↓↓");
		req.setCharacterEncoding("utf-8");
		

		//Beanの使用
		ConnectDB db = new ConnectDB();
		ConnectDBStudent dbs = new ConnectDBStudent();
		//セッション・オブジェクトの確認
		HttpSession session = req.getSession(false);

		// ログイン状態のチェック
		String strSession = session.getAttribute("userAuth").toString();
		if(Integer.parseInt(strSession)==1) {

			//今日の曜日、日付取得
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH) +1;    // 0 = 1 月
			int day = cal.get(Calendar.DATE);
			//フォーマットパターンを指定して表示する
			SimpleDateFormat sdf = new SimpleDateFormat("dd");
			System.out.println("日付フォーマット"+sdf.format(cal.getTime()));

			//表示用年月日
			req.setAttribute("toDay",year + "年" + month + "月" + day + "日");
			req.setAttribute("registDay",year + "-" + month + "-"+ sdf.format(cal.getTime()));
			System.out.println("toDay:"+req.getAttribute("toDay"));
			System.out.println("registDay:"+req.getAttribute("registDay"));

			//日付変更ボタンを押してきたとき
			if(req.getParameter("flag") != null){
				System.out.println("-----こっち通ったよいぇい------");
				System.out.println(req.getParameter("flag"));
				System.out.println("year中身"+session.getAttribute("year"));
				year = Integer.parseInt(session.getAttribute("year").toString());

				if(req.getParameter("yeardown")!=null){
					session.setAttribute("year", year-1);
				}else{ //yearup
					session.setAttribute("year", year+1);
				}
			}else{
				System.out.println("-----こっち通ったよいぇい334------");
				session.setAttribute("year", year);
			}
			session.setAttribute("month", month);
			//------出席簿------
			ArrayList<Map<String, String>> attends = new ArrayList<Map<String, String>>();
			String suserID = String.valueOf(session.getAttribute("userID"));
			String syear = String.valueOf(session.getAttribute("year"));
			attends = dbs.getAttend(syear,suserID);
			req.setAttribute("attends", attends);
			System.out.println("-----あてんず表示------");
			System.out.println(attends);
			//------------------
			
			//-------総授業日数-------
			int iYear = Integer.parseInt(String.valueOf(session.getAttribute("year")));
			int iMonth = Integer.parseInt(String.valueOf(session.getAttribute("month")));
			String sUserClass = String.valueOf(session.getAttribute("userClass"));
			int totalDays = dbs.getTotalday(iYear,iMonth,sUserClass);
			
			req.setAttribute("totalDays", totalDays);
			System.out.println("-----総授業日数------");
			System.out.println(totalDays);
			//------------------


			path = "/student/myPage_Student.jsp";
		}else{
			req.setAttribute("message", "ログインしてください。");
			path = "/common/err.jsp";
		}


		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
}
