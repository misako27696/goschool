/**
 * date:2015/10/23
 * name:田中翔子
 * comm:GS用のDB接続Java
 **/

package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.annotation.Resource;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.sun.beans.decoder.ValueObject;

/**
 *
 * DB接続を行うModelです。
 *
 *  @author shiho.asa
 *  @version 1.0
 *
 */
public class ConnectDB {

	// コンストラクタ
	public ConnectDB(){}

	//DB接続情報-----------------------------------------------//

	private final static String DRIVER = "com.mysql.jdbc.Driver";

	// 1.データベースの接続先情報を指定
	private final static String URI = "jdbc:mysql://teamnull.cpnflochvg6r.ap-northeast-1.rds.amazonaws.com:3306/GoSchool";

	// 2.データベースに接続するときのユーザ名とパスワードを指定
	private final static String DBUSER = "dbuser";
	private final static String PASSWORD = "sotuken2015";

	// 3.connectURL
	private final static String jdbcUrl = URI + "?user=" + DBUSER + "&password=" + PASSWORD;

	//------------------------------------------------------//

	//その他-------------------------------------------------//

	//ユーザが入力した値
	private String inputID = "";
	private String inputPW = "";
	private String classIf = "";

	//DBから取得した値
	private String dbID = "";
	private String dbPW = "";
	private String dbFName = "";
	private String dbLName = "";
	private String dbClassID = "";
	private String dbClassSession = "";

	//-------setter---------
	//入力用
	public void setInputID(String inputID){
		this.inputID = inputID;
		System.out.println("１ID:" + inputID); }

	public void setInputPW(String inputPW){
		this.inputPW = inputPW;
		System.out.println("１PW:" + inputPW); }

	public void setInputClassif(String select){
		if(select.equals("student")){
			this.classIf = "1";
		}else{
			this.classIf = "0";
		}}

	//DB用
	public void setUserID(String userID){
		this.dbID = userID; }

	public void setUserPW(String userPW){
		this.dbPW = userPW; }

	public void setUserFirstName(String userName){
		this.dbFName = userName;
	}

	public void setUserLastName(String userName){
		this.dbLName = userName;
	}
	
	public void setUserClassID(String userclassid){
		this.dbClassID = userclassid;
	}
	
	public void setUserClassSession(String usersession){
		this.dbClassSession = usersession;
	}

	//-------setter---------

	//-------getter---------
	public String getInputID() {return inputID;}
	public String getInputPW() {return inputPW;}
	public String getInputClassif() {return classIf;}
	public String getUserID() {return dbID;}
	public String getUserPW() {return dbPW;}
	public String getUserFName() {return dbFName;}
	public String getUserLName() {return dbLName;}
	public String getUserClassID() {return dbClassID;}
	public String getUserClassSession() {return dbClassSession;}
	//-------getter---------

	//------------------------------------------------------//


	public boolean userAuth(){
		System.out.println("-----userAuth------");

		// Load the JDBC driver
		try {
			System.out.println("Loading driver...");
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver loaded!");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Cannot find the driver in the classpath!", e);
		}

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;


		try {
			conn = DriverManager.getConnection(jdbcUrl);
			
			String sql = "SELECT id,lastname,firstname,password FROM user "
					+ "WHERE id = ? AND student_flag = ?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,getInputID());
			stmt.setString(2,getInputClassif());
			rs = stmt.executeQuery();
			rs.next();
			setUserID(rs.getString("id"));
			setUserPW(String.valueOf(rs.getString("password")));
			setUserLastName(rs.getString("lastname"));
			setUserFirstName(rs.getString("firstname"));
			System.out.println(getUserLName() + ":取得した名前");
			System.out.println(getUserPW() + ":取得したパスワード");
			System.out.println(inputPW + ":入力したパスワード");
			
			if(getInputClassif().equals("1")){
				System.out.println("-----生徒なら------");
				sql = "SELECT class_id FROM student WHERE student_id = ?;";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1,getInputID());
				rs = stmt.executeQuery();
				rs.next();
				setUserClassID(rs.getString("class_id"));
				setUserClassSession("2");
			}else{
				System.out.println("-----先生なら------");
				sql = "SELECT class_id "
						+ "FROM classteacher_history "
						+ "WHERE start_date >= "
						+ "(SELECT MAX(start_date) FROM classteacher_history)"
						+ "AND lecturer_id = ?;";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1,getInputID());
				rs = stmt.executeQuery();
				rs.next();
				setUserClassID(rs.getString("class_id"));
				setUserClassSession("2");
			}

			//リソースの解放
			rs.close();
			stmt.close();

		} catch (SQLException ex) {
			// Handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		} finally {
			System.out.println("Closing the connection.");
			if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
		}
		
		//IDとPWで判定
		if(getUserID().equals("")){
			System.out.println("1false");
			return false;
		}else if(getInputPW().equals(getUserPW())){
			System.out.println("2true");
			return true;
		}else{
			System.out.println("3false");
			return false;
		}
	}
	
	public String getClassTeacher(String userClass){
		System.out.println("-----getClassTeacher------");
		
		///////////ここから///////
		String teacherFname = "";
		String teacherLname = "";
		
		
		// Load the JDBC driver
		try {
			System.out.println("Loading driver...");
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver loaded!");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Cannot find the driver in the classpath!", e);
		}

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DriverManager.getConnection(jdbcUrl);

			String sql = "SELECT lastname,firstname "
						+ "FROM classteacher_history INNER JOIN user "
						+ "ON(classteacher_history.lecturer_id=user.id) "
						+ "WHERE start_date >= "
						+ "(select MAX(start_date) FROM classteacher_history) "
						+ "AND class_id =?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,userClass);
			rs = stmt.executeQuery();
			rs.next();
			teacherLname = rs.getString("lastname");
			teacherFname = rs.getString("firstname");

			//リソースの解放
			rs.close();
			stmt.close();

		} catch (SQLException ex) {
			// Handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		} finally {
			System.out.println("Closing the connection.");
			if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
		}
		return teacherLname+teacherFname;
	}
	
	public ArrayList<Map<String, String>> getAttend(int year, int month, int day,String userClass){
		System.out.println("-----getAttend------");

		ArrayList<Map<String, String>> attends = new ArrayList<Map<String, String>>();
		
		// Load the JDBC driver
		try {
			System.out.println("Loading driver...");
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver loaded!");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Cannot find the driver in the classpath!", e);
		}

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DriverManager.getConnection(jdbcUrl);
			
			//準備
			Map<String, String> attend;
			
			//一週間の値取り出し
			for(int i=0; i<7; i++){
				//今日の日付取得
				Calendar cal = Calendar.getInstance();
				cal.set(Calendar.YEAR, year);
				cal.set(Calendar.MONTH, month-1);
				cal.set(Calendar.DATE, day);
				
				System.out.println("変更前" +
						cal.get(Calendar.YEAR) + "/" + cal.get(Calendar.MONTH) + "/" + cal.get(Calendar.DATE));
				//今日の日付-i日分
				cal.add(Calendar.DATE, -i);
				System.out.println("変更後" +
						cal.get(Calendar.YEAR) + "/" + cal.get(Calendar.MONTH) + "/" + cal.get(Calendar.DATE));
				
				//フォーマットパターンを指定して表示する
				SimpleDateFormat sdf = new SimpleDateFormat("MMdd");
		        //System.out.println("日付フォーマット"+sdf.format(cal.getTime()));
				
				int prevStudent_number = 0;
				int countTikoku = 0;
				int countSotai = 0;
				int countKekka = 0;
				int countTodokede = 0;
				int countMutodoke = 0;

				String sql = "SELECT student_number,lesson_number,attend_flag,absent_flag "
						+ "FROM attend_state INNER JOIN student "
						+ "ON attend_state.student_id = student.student_id "
						+ "WHERE year = ? AND month_day = ? AND class_id = ? "
						+ "ORDER BY student_number;";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1,String.valueOf(year));
				stmt.setString(2,String.valueOf(sdf.format(cal.getTime())));
				stmt.setString(3,userClass);
				rs = stmt.executeQuery();
				while (rs.next()) {
					int lesson_number = rs.getInt("lesson_number");
					int attend_flag = rs.getInt("attend_flag");
					int absent_flag = rs.getInt("absent_flag");
					int student_number = rs.getInt("student_number");
					//出課、欠課
					if(lesson_number==0 && attend_flag == 1){
						countTikoku++;			//遅刻のカウント
					}else if(lesson_number==9 && attend_flag == 1){
						countSotai++;			//早退のカウント
					}else if(attend_flag == 1){
						countKekka++;			//欠課のカウント
					}
					//出席、欠席
					if( absent_flag == 1 && prevStudent_number != student_number){
						countTodokede++;		//届け出欠席のカウント
					}else if(absent_flag == 2 && prevStudent_number != student_number){
						countMutodoke++;		//無届欠席のカウント
					}
					prevStudent_number = student_number;
				}
				
				attend = new HashMap<String, String>();
				sdf.applyPattern("MM/dd");
				attend.put("Day",String.valueOf(sdf.format(cal.getTime())));
				attend.put("Tikoku",String.valueOf(countTikoku));
				attend.put("Sotai",String.valueOf(countSotai));
				attend.put("Kekka",String.valueOf(countKekka));
				attend.put("Todokede",String.valueOf(countTodokede));
				attend.put("Mutodoke",String.valueOf(countMutodoke));
				attends.add( attend );
				//System.out.println(attend);
			}
			
			//リソースの解放
			rs.close();
			stmt.close();

		} catch (SQLException ex) {
			// Handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		} finally {
			System.out.println("Closing the connection.");
			if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
		}
		return attends;
	}
	
	public ArrayList<Map<String, String>> getMeibo(String userClass){
		System.out.println("-----getMeibo------");
		
		ArrayList<Map<String, String>> members = new ArrayList<Map<String, String>>();
		
		// Load the JDBC driver
		try {
			System.out.println("Loading driver...");
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver loaded!");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Cannot find the driver in the classpath!", e);
		}

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DriverManager.getConnection(jdbcUrl);

			//準備
			Map<String, String> member;

			String sql = "SELECT * FROM student INNER JOIN user "
					+ "ON student.student_id=user.id "
					+ "WHERE class_id = ? ORDER BY student_number;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,userClass);
			rs = stmt.executeQuery();
			while (rs.next()) {
				String lastname = rs.getString("lastname");
				String firstname = rs.getString("firstname");
				int student_number = rs.getInt("student_number");
				int student_id = rs.getInt("student_id");

				member = new HashMap<String, String>();
				member.put("lastname",lastname);
				member.put("firstname",firstname);
				member.put("student_number",String.valueOf(student_number));
				member.put("student_id",String.valueOf(student_id));
				members.add( member );
				//System.out.println(member);
			}

			//リソースの解放
			rs.close();
			stmt.close();

		} catch (SQLException ex) {
			// Handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		} finally {
			System.out.println("Closing the connection.");
			if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
		}
		return members;
	}
	
	public ArrayList<Map<String, String>> getSubject(String userClass,String userClassSession){
		System.out.println("-----getSubject------");
		
		ArrayList<Map<String, String>> subjects = new ArrayList<Map<String, String>>();
		
		// Load the JDBC driver
		try {
			System.out.println("Loading driver...");
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver loaded!");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Cannot find the driver in the classpath!", e);
		}

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DriverManager.getConnection(jdbcUrl);

			//準備
			Map<String, String> subject;

			String sql = "SELECT * FROM timetable_base INNER JOIN subject "
						+ "USING (subject_id, class_id) "
						+ "WHERE class_id = ? AND session = ? "
						+ "ORDER BY lesson_number, week;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,userClass);
			stmt.setString(2,userClassSession);
			rs = stmt.executeQuery();
			while (rs.next()) {
				String week = rs.getString("week");
				String lesson_number = rs.getString("lesson_number");
				String subject_name = rs.getString("subject_name");
				String classroom = rs.getString("classroom");
				String lecture_name = rs.getString("lecture_name");
				
				subject = new HashMap<String, String>();
				subject.put("week",week);
				subject.put("lesson_number",lesson_number);
				subject.put("subject_name",subject_name);
				subject.put("classroom",classroom);
				subject.put("lecture_name",lecture_name);
				subjects.add( subject );
				//System.out.println(subject);
			}

			//リソースの解放
			rs.close();
			stmt.close();

		} catch (SQLException ex) {
			// Handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		} finally {
			System.out.println("Closing the connection.");
			if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
		}
		return subjects;
	}
	
	public String getClassName(String userClass){
		System.out.println("-----getClassName------");
		
		String class_name = "";
		
		
		// Load the JDBC driver
		try {
			System.out.println("Loading driver...");
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver loaded!");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Cannot find the driver in the classpath!", e);
		}

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DriverManager.getConnection(jdbcUrl);

			String sql = "SELECT class_name FROM classroom "
						+ "WHERE class_id = ?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,userClass);
			rs = stmt.executeQuery();
			rs.next();
			class_name = rs.getString("class_name");

			//リソースの解放
			rs.close();
			stmt.close();

		} catch (SQLException ex) {
			// Handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		} finally {
			System.out.println("Closing the connection.");
			if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
		}
		return class_name;
	}
	
	public ArrayList<Map<String, String>> getClassAttend(int year, int month, String userClass){
		System.out.println("-----getAttend------");

		ArrayList<Map<String, String>> attends = new ArrayList<Map<String, String>>();
		
		// Load the JDBC driver
		try {
			System.out.println("Loading driver...");
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver loaded!");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Cannot find the driver in the classpath!", e);
		}

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DriverManager.getConnection(jdbcUrl);
			
			//準備
			Map<String, String> attend;

			int prevStudent_number = 0;
			int countTiSou = 0;
			int countKekka = 0;
			int countKesseki = 0;
			int c = 0;//初回フラグ
			
			String sql = "SELECT * FROM attend_state INNER JOIN student "
					+ "USING (student_id) "
					+ "WHERE class_id = ? "
					+ "AND year LIKE ? "
					+ "AND month_day LIKE ? "
					+ "ORDER BY student_id, year, month_day;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,userClass);
			stmt.setString(2,String.valueOf(year));
			stmt.setString(3,String.valueOf(month)+"%");
			rs = stmt.executeQuery();
			while (rs.next()) {
				int lesson_number = rs.getInt("lesson_number");
				int attend_flag = rs.getInt("attend_flag");
				int absent_flag = rs.getInt("absent_flag");
				int student_number = rs.getInt("student_number");
				//System.out.println(lesson_number);
				//System.out.println(attend_flag);
				//System.out.println(absent_flag);
				//System.out.println(student_number);
				
				if(prevStudent_number != student_number){
					if(c!=0){
						System.out.println("------------通過----");
						//みなし計算
						countTiSou = countTiSou / 5;
						countKekka = countKekka / 4;
						int countMinasi = countTiSou + countKekka;

						attend = new HashMap<String, String>();
						attend.put("num",String.valueOf(prevStudent_number));
						attend.put("Minasi",String.valueOf(countMinasi));
						attend.put("Kesseki",String.valueOf(countKesseki));
						attends.add( attend );
						//System.out.println(attend);
						countTiSou = 0;
						countKekka = 0;
						countKesseki = 0;
						prevStudent_number = student_number;
					}else{
						prevStudent_number = student_number;
						c=1;
					}
				}
				//出課、欠課
				if((attend_flag == 1 && lesson_number==0) ||
						(attend_flag == 1 && lesson_number==9)){
					countTiSou++;			//遅刻早退のカウント
				}else if(attend_flag == 1){
					countKekka++;			//欠課のカウント
				}
				//出席、欠席
				if(absent_flag != 0 && prevStudent_number != student_number){
					countKesseki++;		//欠席のカウント
				}
				System.out.println("--------------------");
			}
			//最後の
			//みなし計算
			countTiSou = countTiSou / 5;
			countKekka = countKekka / 4;
			int countMinasi = countTiSou + countKekka;

			attend = new HashMap<String, String>();
			attend.put("num",String.valueOf(prevStudent_number));
			attend.put("Minasi",String.valueOf(countMinasi));
			attend.put("Kesseki",String.valueOf(countKesseki));
			attends.add( attend );
			//System.out.println(attend);

			//リソースの解放
			rs.close();
			stmt.close();

		} catch (SQLException ex) {
			// Handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		} finally {
			System.out.println("Closing the connection.");
			if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
		}
		return attends;
	}
	
	public int getTotalday(int year, int month, String userClass){
		System.out.println("-----getTotalday------");
		
		//準備
		int totalday = 0;
		
		// Load the JDBC driver
		try {
			System.out.println("Loading driver...");
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver loaded!");
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Cannot find the driver in the classpath!", e);
		}

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DriverManager.getConnection(jdbcUrl);
			
			String sql = "SELECT * FROM total "
						+ "WHERE class_id = ?"
						+ "AND year LIKE ?"
						+ "AND month LIKE ?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,userClass);
			stmt.setString(2,String.valueOf(year));
			stmt.setString(3,String.valueOf(month)+"%");
			rs = stmt.executeQuery();
			rs.next();
			totalday = rs.getInt("Total_date");
			//System.out.println(totalday);

			//リソースの解放
			rs.close();
			stmt.close();

		} catch (SQLException ex) {
			// Handle any errors
			System.out.println("SQLException: " + ex.getMessage());
			System.out.println("SQLState: " + ex.getSQLState());
			System.out.println("VendorError: " + ex.getErrorCode());
		} finally {
			System.out.println("Closing the connection.");
			if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
		}
		return totalday;
	}
}
