/**
 * date:2015/10/23
 * name:田中翔子
 * comm:GS用のDB接続Java
 **/

package student;

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
public class ConnectDBStudent {

	// コンストラクタ
	public ConnectDBStudent(){}

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

	public ArrayList<Map<String, String>> getAttend(String year, String userID){
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

			int countTikoku = 0;
			int countSotai = 0;
			int countKekka = 0;
			int countTodokede = 0;
			int countMutodoke = 0;

			String sql = "SELECT * FROM attend_state "
					+ "WHERE student_id = ? "
					+ "AND year = ?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1,userID);
			stmt.setString(2,year);
			rs = stmt.executeQuery();
			while (rs.next()) {
				int lesson_number = rs.getInt("lesson_number");
				int attend_flag = rs.getInt("attend_flag");
				int absent_flag = rs.getInt("absent_flag");
				//出課、欠課
				if(lesson_number==0 && attend_flag == 1){
					countTikoku++;			//遅刻のカウント
				}else if(lesson_number==9 && attend_flag == 1){
					countSotai++;			//早退のカウント
				}else if(attend_flag == 1){
					countKekka++;			//欠課のカウント
				}
				//出席、欠席
				if( absent_flag == 1){
					countTodokede++;		//届け出欠席のカウント
				}else if(absent_flag == 2){
					countMutodoke++;		//無届欠席のカウント
				}
			}
			//みなし計算
			int countTiSo = (countTikoku+countSotai) / 5;
			int countKe = countKekka / 4;
			int countMinasi = countTiSo + countKe;

			attend = new HashMap<String, String>();
			attend.put("Tikoku",String.valueOf(countTikoku));
			attend.put("Sotai",String.valueOf(countSotai));
			attend.put("Kekka",String.valueOf(countKekka));
			attend.put("Todokede",String.valueOf(countTodokede));
			attend.put("Mutodoke",String.valueOf(countMutodoke));
			attend.put("Minasi",String.valueOf(countMinasi));
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

				member = new HashMap<String, String>();
				member.put("lastname",lastname);
				member.put("firstname",firstname);
				member.put("student_number",String.valueOf(student_number));
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
	
	public String inNissi(int todokede, int mutodokede, int tikoku,int soutai,int time, int kekka, String sDay){
		System.out.println("-----inNissi------");
		
		System.out.println(todokede);
		System.out.println(mutodokede);
		System.out.println(tikoku);
		System.out.println(soutai);
		System.out.println(time);
		System.out.println(kekka);
		System.out.println(sDay);
		String msg = "";
		
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
		
		if(todokede != 999){
			System.out.println("-----届け出------");
			try {
				conn = DriverManager.getConnection(jdbcUrl);
				
				String sql = "INSERT INTO attend_state VALUES(?,2015,?,0,0,1,3);";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1,String.valueOf(todokede));
				stmt.setString(2,String.valueOf(sDay));
				stmt.executeUpdate();
			} catch (SQLException ex) {
				// Handle any errors
				System.out.println("SQLException: " + ex.getMessage());
				System.out.println("SQLState: " + ex.getSQLState());
				System.out.println("VendorError: " + ex.getErrorCode());
			} finally {
				System.out.println("Closing the connection.");
				if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
			}
		}
		
		if(mutodokede != 999){
			System.out.println("------無届------");
			try {
				conn = DriverManager.getConnection(jdbcUrl);
				
				String sql = "INSERT INTO attend_state VALUES(?,2015,?,0,0,2,3);";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1,String.valueOf(mutodokede));
				stmt.setString(2,String.valueOf(sDay));
				stmt.executeUpdate();
			} catch (SQLException ex) {
				// Handle any errors
				System.out.println("SQLException: " + ex.getMessage());
				System.out.println("SQLState: " + ex.getSQLState());
				System.out.println("VendorError: " + ex.getErrorCode());
			} finally {
				System.out.println("Closing the connection.");
				if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
			}
		}
		
		if(tikoku != 999){
			System.out.println("-----遅刻------");
			try {
				conn = DriverManager.getConnection(jdbcUrl);
				String sql = "INSERT INTO attend_state VALUES(?,2015,?,0,1,0,3);";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1,String.valueOf(tikoku));
				stmt.setString(2,String.valueOf(sDay));
				stmt.executeUpdate();
			} catch (SQLException ex) {
				// Handle any errors
				System.out.println("SQLException: " + ex.getMessage());
				System.out.println("SQLState: " + ex.getSQLState());
				System.out.println("VendorError: " + ex.getErrorCode());
			} finally {
				System.out.println("Closing the connection.");
				if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
			}
		}
		
		if(soutai != 999){
			System.out.println("-----早退------");
			try {
				conn = DriverManager.getConnection(jdbcUrl);
				String sql = "INSERT INTO attend_state VALUES(?,'2015',?,'9','1','0','3');";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1,String.valueOf(soutai));
				stmt.setString(2,String.valueOf(sDay));
				stmt.executeUpdate();
			} catch (SQLException ex) {
				// Handle any errors
				System.out.println("SQLException: " + ex.getMessage());
				System.out.println("SQLState: " + ex.getSQLState());
				System.out.println("VendorError: " + ex.getErrorCode());
			} finally {
				System.out.println("Closing the connection.");
				if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
			}
		}
		
		if(kekka != 999){
			System.out.println("-----欠課------");
			try {
				conn = DriverManager.getConnection(jdbcUrl);
				String sql = "INSERT INTO attend_state VALUES(?,'2015',?,?,'1','0','3');";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1,String.valueOf(kekka));
				stmt.setString(2,String.valueOf(sDay));
				stmt.setString(3,String.valueOf(time));
				stmt.executeUpdate();
			} catch (SQLException ex) {
				// Handle any errors
				System.out.println("SQLException: " + ex.getMessage());
				System.out.println("SQLState: " + ex.getSQLState());
				System.out.println("VendorError: " + ex.getErrorCode());
			} finally {
				System.out.println("Closing the connection.");
				if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
			}
		}
		
		//リソースの解放
		try {
			stmt.close();
		} catch (SQLException e) {
			System.out.println("stmtがありません");
		}
		return msg;
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
			totalday = 20;
		} finally {
			System.out.println("Closing the connection.");
			if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
		}
		return totalday;
	}
}
