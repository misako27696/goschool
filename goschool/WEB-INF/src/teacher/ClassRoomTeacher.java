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

@WebServlet(urlPatterns="/classroomteacher")
public class ClassRoomTeacher extends HttpServlet{
	
	String path = "";
	
	public ClassRoomTeacher() {
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
		
		System.out.println("クラスルーム↓↓↓↓↓↓");
		
		req.setCharacterEncoding("utf-8");
		
		//Beanの使用
		ConnectDB db = new ConnectDB();
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
			if(req.getParameter("calender") != null){
				String temp = req.getParameter("calender");
				System.out.println(temp);
				year = Integer.parseInt(temp.substring(0,4));
				month = Integer.parseInt(temp.substring(5,7));
				day = Integer.parseInt(temp.substring(8,10));
			}

			//------出席簿------
			ArrayList<Map<String, String>> attends = new ArrayList<Map<String, String>>();
			attends = db.getAttend(year,month,day,String.valueOf(session.getAttribute("userClass")));
			req.setAttribute("attends", attends);
			System.out.println("-----あてんず表示------");
			System.out.println(attends);
			//------------------

			//-------名簿-------
			ArrayList<Map<String, String>> members = new ArrayList<Map<String, String>>();
			members = db.getMeibo(String.valueOf(session.getAttribute("userClass")));
			req.setAttribute("members", members);
			System.out.println("-----名簿表示------");
			System.out.println(members);
			//------------------

			//-------時間割-------
			ArrayList<Map<String, String>> subjects = new ArrayList<Map<String, String>>();
			subjects = db.getSubject(String.valueOf(session.getAttribute("userClass")),String.valueOf(session.getAttribute("userClassSession")));
			req.setAttribute("subjects", subjects);
			System.out.println("-----時間割表示------");
			System.out.println(subjects);
			//------------------

			path = "/teacher/classRoom_Teacher.jsp";
		}else{
			req.setAttribute("message", "ログインしてください。");
			path = "/common/err.jsp";
		}

		RequestDispatcher rd = req.getRequestDispatcher(path);
		rd.forward(req, resp);
	}
}
