<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <link rel="stylesheet" href="/goschool/css/teacher_mypage.css" type="text/css" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>マイページ - 学校へ行こう！！</title>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
</head>
<jsp:include page="../include/includeheadteacher.jsp" flush="true" />

<div id="side-left"><p>>> マイページ</p>
	
	<div style="margin-left:30px;">
        <input type="submit" value="クラスを変更" class="btn" style="width:250px">
    </div>
        <br><br>

			<jsp:include page="../include/include_teachericon.jsp" flush="true" />

        </div>

<div id="main">
					<div id="text-left">
						<h1><%= request.getAttribute("className") %></h1>
					</div>
					
					<div class="box class_attendstate">
						<br><br>
						<form name="js" method="post" action="/goschool/mypagedaily">
							<input type="hidden" name="flag" value="flag" id="flag">
							<table id="class_attendstate_all" style="border:none;">
								<tr>	
									<th style="border:none;">
										<form name="js" method="post" action="/goschool/mypagedaily">
											<input type="submit" class="btn" name="hibetsu" value="月別">
										</form>
										
										<form name="js" method="post" action="/goschool/mypagetuition">
											<input type="submit" class="btn" name="jugyoubetsu" value="授業別">
										</form>
									</th>
									<th style="border:none;border-left: 1px solid #000;border-top: 1px solid #000;">
										<input type="submit" id="monthdown" value="◀" name="monthdown">
									</th>
									<th colspan="2" style="border:none;border-top: 1px solid #000;">
										<h2>
											<p id="year1"><%= session.getAttribute("year") %></p>年<br>
											<p id="month"><%= session.getAttribute("month") %></p>月
										</h2>
									</th>
									<th style="border:none;border-top: 1px solid #000;">
										<input type="submit" id="monthup" value="▶" name="monthup">
									</th>
									<th style="border:none;border-top: 1px solid #000;border-left: 1px solid #000;">
										<input type="submit" id="yeardown" value="◀" name="yeardown">
									</th>
									<th colspan="2" style="border:none;border-top: 1px solid #000;">
										<h2>
											<p id="year1"><%= session.getAttribute("year") %></p>年
										</h2>
									</th>
									<th style="border:none;border-top:1px solid #000;border-right: 1px solid #000;">
										<input type="submit" id="yearup" value="▶" name="yearup">
									</th>
								</tr>
								
								<tr style="border:none;border-bottom:1px solid #000;">
									<th style="border:none;border-bottom:1px solid #000;border-top:1px solid #000;">担任：<%= session.getAttribute("classTeacher") %></th>
									<th class="ex1">欠席</th>
									<th class="ex1">みなし欠席</th>
									<th class="ex1">総授業日数</th>
									<th class="ex1">出席率/%</th>
									<th class="ex1">欠席</th>
									<th class="ex1">みなし欠席</th>
									<th class="ex1">総授業欠席</th>
									<th class="ex1">出席率/%</th>
								</tr>
					
								<%
								ArrayList<Map<String, String>> members = new ArrayList<Map<String, String>>();
								members= (ArrayList<Map<String, String>>)request.getAttribute("members");
								ArrayList<Map<String, String>> attends = new ArrayList<Map<String, String>>();
								attends= (ArrayList<Map<String, String>>)request.getAttribute("attends");
								
								if(members.size()>attends.size()){
									for ( int i = 0; i < members.size(); ++i ) {
										Map<String, String> member = members.get( i );
										String student_number	=	member.get( "student_number" ).toString();
										String lastname	=	member.get( "lastname" ).toString();
										String firstname	=	member.get( "firstname" ).toString();
										
										out.println("<tr style=\"border:none;\">"
												+ "<td style=\"border:none;border-bottom:1px solid #000;\">"
												+ student_number + "：" + lastname + firstname + "</td>"
												+ "<td class=\"ex2\">0</td>"
												+ "<td class=\"ex2\">0</td>"
												+ "<td class=\"ex2\">0</td>"
												+ "<td class=\"ex2\">0</td>"
												+ "<td class=\"ex2\">0</td>"
												+ "<td class=\"ex2\">0</td>"
												+ "<td class=\"ex2\">0</td>"
												+ "<td class=\"ex2\">0</td>"
												+ "</tr>");
									}
								}else{
									// データを出力する。
									for ( int i = 0; i < members.size(); ++i ) {
										Map<String, String> member = members.get( i );
										String student_number	=	member.get( "student_number" ).toString();
										String lastname	=	member.get( "lastname" ).toString();
										String firstname	=	member.get( "firstname" ).toString();
										
										Map<String, String> attend = attends.get( i );
										String Minasi	=	attend.get( "Minasi" ).toString();
										String Kesseki	=	attend.get( "Kesseki" ).toString();
										
										double s = Double.parseDouble(String.valueOf(request.getAttribute("totalDays")))
													- Double.parseDouble(String.valueOf(Kesseki))
													- Double.parseDouble(String.valueOf(Minasi));
										double rate = 
												Math.floor(
												s / Double.parseDouble(String.valueOf(request.getAttribute("totalDays"))) * 100);
										
										out.println("<tr style=\"border:none;\">"
												+ "<td style=\"border:none;border-bottom:1px solid #000;\">"
												+ student_number + "：" + lastname + firstname + "</td>"
												+ "<td class=\"ex2\">" + Kesseki + "</td>"
												+ "<td class=\"ex2\">" + Minasi + "</td>"
												+ "<td class=\"ex2\">" + request.getAttribute("totalDays") + "</td>"
												+ "<td class=\"ex2\">" + (int)rate + "%</td>"
												+ "<td class=\"ex2\">0</td>"
												+ "<td class=\"ex2\">0</td>"
												+ "<td class=\"ex2\">0</td>"
												+ "<td class=\"ex2\">0</td>"
												+ "</tr>");
									}
								}
								%>
							</table>
						</form>
						<br/>
				</div><!-- box class_attendstate -->
				
			</div><!-- main -->
<jsp:include page="../include/include2.jsp" flush="true" />
</html>