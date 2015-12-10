<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <link rel="stylesheet" href="/goschool/css/teacher_mypage.css" type="text/css" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>マイページ - 学校へいこう！！</title>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">

<script type="text/javascript">
	$(function() {
	    $( "#tabhoge" ).tabs();
	  });

</script>

</head>
<jsp:include page="../include/includeheadteacher.jsp" flush="true" />

<div id="side-left"><p>>> マイページ</p>
        <input type="submit" value="クラスを変更" class="attendancebtn" style="width:250px">
        <br><br>

			<jsp:include page="../include/include_teachericon.jsp" flush="true" />

        </div>

<div id="main">
	<div id="text-left"><h1><%= request.getAttribute("className") %></h1></div>
	
		<div class="box class_attendstate">
			<br><br>
			<div style="margin-left:11px;">
				<form name="js" method="post" action="/goschool/mypagedaily">
					<input type="submit" class="btn" name="hibetsu" value="月別">
				</form>
				<form name="js" method="post" action="/goschool/mypagetuition">
					<input type="submit" class="btn" name="jugyoubetsu" value="授業別">
				</form>
			</div>
			<br>
			
	<form name="js">
	
	<div id="tabhoge" style="width:960px;margin-left:5px;">
    <ul>
      <li><a href="#t-1">前期</a></li>
      <li><a href="#t-2">中期</a></li>
      <li><a href="#t-3">後期</a></li>
    </ul>

    <div id="t-1">
    
    	<table id="teacher_tuition" style="font-size:12px;border:none;width:100%;">
    		
    		<tr>
    			<th style="border-top:1px solid #000;border-left:1px solid #000;">担任：<%= session.getAttribute("classTeacher") %></th>
    			<th class="ex9" style="border-top:1px solid #000;border-left:1px solid #000;">
    			<input type="button" id="yeardown" value="◀"></th>
    			<th class="ex8">スマホ</th>
    			<th class="ex8">PJ</th>
    			<th class="ex8">管理</th>
    			<th class="ex8">ディスカッション</th>
    			<th class="ex8">英語</th>
    			<th class="ex8">ビジネス</th>
    			<th class="ex8" style="border:none;border-top:1px solid #000;">国試</th>
    			<th class="ex9" style="border-right:1px solid #000;"><input type="button" id="monthdown" value="▶"></th>
    		</tr>
    		
    		<tr>
    			<th style="border: 1px solid #000;">トータルコマ数</th>
    			<th class="ex9"></th>
    			<td class="ex10" style="border:none;border-top:1px solid #000;"></td>
    			<td class="ex10"></td>
    			<td class="ex10"></td>
    			<td class="ex10"></td>
    			<td class="ex10"></td>
    			<td class="ex10"></td>
    			<td class="ex10" style="border:none;border-top:1px solid #000;"></td>
    			<th class="ex9" style="border-right:1px solid #000;"></th>
    		</tr>
    		
    		<tr>
    			<th style="border: 1px solid #000;">欠席可能数</th>
    			<th class="ex9"></th>
    			<td class="ex10" style="border:none;border-top:1px solid #000;border-bottom:1px solid #000;"></td>
    			<td class="ex10"></td>
    			<td class="ex10"></td>
    			<td class="ex10"></td>
    			<td class="ex10"></td>
    			<td class="ex10"></td>
    			<td class="ex10" style="border:none;border-top:1px solid #000;"></td>
    			<th class="ex9" style="border-right:1px solid #000;"></th>
    		</tr>
    		
    		<%
    		ArrayList<Map<String, String>> members = new ArrayList<Map<String, String>>();
			members= (ArrayList<Map<String, String>>)request.getAttribute("members");
			
			for ( int i = 0; i < members.size(); ++i ) {
				Map<String, String> member = members.get( i );
				String student_number	=	member.get( "student_number" ).toString();
				String lastname	=	member.get( "lastname" ).toString();
				String firstname	=	member.get( "firstname" ).toString();
				
				out.println("<tr style=\"border:none;\">"
						+ "<td style=\"border:none;border-bottom:1px solid #000;border-left:1px solid #000;\">"
						+ student_number + "：" + lastname + firstname + "</td>"
						+ "<th class=\"ex9\" style=\"border-left:1px solid #000;border-bottom:1px solid #000;\"></th>"
						+ "<td class=\"ex10\" style=\"border:none;border-bottom:1px solid #000;\">0</td>"
						+ "<td class=\"ex10\">0</td>"
						+ "<td class=\"ex10\">0</td>"
						+ "<td class=\"ex10\">0</td>"
						+ "<td class=\"ex10\">0</td>"
						+ "<td class=\"ex10\">0</td>"
						+ "<td class=\"ex10\" style=\"border:none;border-top:1px solid #000;border-bottom:1px solid #000;\">0</td>"
						+ "<th class=\"ex9\" style=\"border-right:1px solid #000;border-bottom:1px solid #000;\"></th>"
						+ "</tr>");
			}
    		
    		%> 	
    	</table>
    
    </div>
    <div id="t-2">
   <table id="teacher_tuition" style="font-size:12px;border:none;width:100%;">
    		
    		<tr>
    			<th style="border-top:1px solid #000;border-left:1px solid #000;">担任：<%= session.getAttribute("classTeacher") %></th>
    			<th class="ex9" style="border-top:1px solid #000;border-left:1px solid #000;">
    			<input type="button" id="yeardown" value="◀"></th>
    			<th class="ex8">スマホ</th>
    			<th class="ex8">PJ</th>
    			<th class="ex8">管理</th>
    			<th class="ex8">ディスカッション</th>
    			<th class="ex8">英語</th>
    			<th class="ex8">ビジネス</th>
    			<th class="ex8" style="border:none;border-top:1px solid #000;">国試</th>
    			<th class="ex9" style="border-right:1px solid #000;"><input type="button" id="monthdown" value="▶"></th>
    		</tr>
    		
    		<tr>
    			<th style="border: 1px solid #000;">トータルコマ数</th>
    			<th class="ex9"></th>
    			<td class="ex10" style="border:none;border-top:1px solid #000;"></td>
    			<td class="ex10"></td>
    			<td class="ex10"></td>
    			<td class="ex10"></td>
    			<td class="ex10"></td>
    			<td class="ex10"></td>
    			<td class="ex10" style="border:none;border-top:1px solid #000;"></td>
    			<th class="ex9" style="border-right:1px solid #000;"></th>
    		</tr>
    		
    		<tr>
    			<th style="border: 1px solid #000;">欠席可能数</th>
    			<th class="ex9"></th>
    			<td class="ex10" style="border:none;border-top:1px solid #000;border-bottom:1px solid #000;"></td>
    			<td class="ex10"></td>
    			<td class="ex10"></td>
    			<td class="ex10"></td>
    			<td class="ex10"></td>
    			<td class="ex10"></td>
    			<td class="ex10" style="border:none;border-top:1px solid #000;"></td>
    			<th class="ex9" style="border-right:1px solid #000;"></th>
    		</tr>
    		
    		<%
    		ArrayList<Map<String, String>> members2 = new ArrayList<Map<String, String>>();
			members= (ArrayList<Map<String, String>>)request.getAttribute("members");
			
			for ( int i = 0; i < members.size(); ++i ) {
				Map<String, String> member = members.get( i );
				String student_number	=	member.get( "student_number" ).toString();
				String lastname	=	member.get( "lastname" ).toString();
				String firstname	=	member.get( "firstname" ).toString();
				
				out.println("<tr style=\"border:none;\">"
						+ "<td style=\"border:none;border-bottom:1px solid #000;border-left:1px solid #000;\">"
						+ student_number + "：" + lastname + firstname + "</td>"
						+ "<th class=\"ex9\" style=\"border-left:1px solid #000;border-bottom:1px solid #000;\"></th>"
						+ "<td class=\"ex10\" style=\"border:none;border-bottom:1px solid #000;\">0</td>"
						+ "<td class=\"ex10\">0</td>"
						+ "<td class=\"ex10\">0</td>"
						+ "<td class=\"ex10\">0</td>"
						+ "<td class=\"ex10\">0</td>"
						+ "<td class=\"ex10\">0</td>"
						+ "<td class=\"ex10\" style=\"border:none;border-top:1px solid #000;border-bottom:1px solid #000;\">0</td>"
						+ "<th class=\"ex9\" style=\"border-right:1px solid #000;border-bottom:1px solid #000;\"></th>"
						+ "</tr>");
			}
    		
    		%> 	
    	</table>
    
    
    </div>
    <div id="t-3">
   <table id="teacher_tuition" style="font-size:12px;border:none;width:100%;">
    		
    		<tr>
    			<th style="border-top:1px solid #000;border-left:1px solid #000;">担任：<%= session.getAttribute("classTeacher") %></th>
    			<th class="ex9" style="border-top:1px solid #000;border-left:1px solid #000;">
    			<input type="button" id="yeardown" value="◀"></th>
    			<th class="ex8">スマホ</th>
    			<th class="ex8">PJ</th>
    			<th class="ex8">管理</th>
    			<th class="ex8">ディスカッション</th>
    			<th class="ex8">英語</th>
    			<th class="ex8">ビジネス</th>
    			<th class="ex8" style="border:none;border-top:1px solid #000;">国試</th>
    			<th class="ex9" style="border-right:1px solid #000;"><input type="button" id="monthdown" value="▶"></th>
    		</tr>
    		
    		<tr>
    			<th style="border: 1px solid #000;">トータルコマ数</th>
    			<th class="ex9"></th>
    			<td class="ex10" style="border:none;border-top:1px solid #000;"></td>
    			<td class="ex10"></td>
    			<td class="ex10"></td>
    			<td class="ex10"></td>
    			<td class="ex10"></td>
    			<td class="ex10"></td>
    			<td class="ex10" style="border:none;border-top:1px solid #000;"></td>
    			<th class="ex9" style="border-right:1px solid #000;"></th>
    		</tr>
    		
    		<tr>
    			<th style="border: 1px solid #000;">欠席可能数</th>
    			<th class="ex9"></th>
    			<td class="ex10" style="border:none;border-top:1px solid #000;border-bottom:1px solid #000;"></td>
    			<td class="ex10"></td>
    			<td class="ex10"></td>
    			<td class="ex10"></td>
    			<td class="ex10"></td>
    			<td class="ex10"></td>
    			<td class="ex10" style="border:none;border-top:1px solid #000;"></td>
    			<th class="ex9" style="border-right:1px solid #000;"></th>
    		</tr>
    		
    		<%
    		ArrayList<Map<String, String>> members3 = new ArrayList<Map<String, String>>();
			members= (ArrayList<Map<String, String>>)request.getAttribute("members");
			
			for ( int i = 0; i < members.size(); ++i ) {
				Map<String, String> member = members.get( i );
				String student_number	=	member.get( "student_number" ).toString();
				String lastname	=	member.get( "lastname" ).toString();
				String firstname	=	member.get( "firstname" ).toString();
				
				out.println("<tr style=\"border:none;\">"
						+ "<td style=\"border:none;border-bottom:1px solid #000;border-left:1px solid #000;\">"
						+ student_number + "：" + lastname + firstname + "</td>"
						+ "<th class=\"ex9\" style=\"border-left:1px solid #000;border-bottom:1px solid #000;\"></th>"
						+ "<td class=\"ex10\" style=\"border:none;border-bottom:1px solid #000;\">0</td>"
						+ "<td class=\"ex10\">0</td>"
						+ "<td class=\"ex10\">0</td>"
						+ "<td class=\"ex10\">0</td>"
						+ "<td class=\"ex10\">0</td>"
						+ "<td class=\"ex10\">0</td>"
						+ "<td class=\"ex10\" style=\"border:none;border-top:1px solid #000;border-bottom:1px solid #000;\">0</td>"
						+ "<th class=\"ex9\" style=\"border-right:1px solid #000;border-bottom:1px solid #000;\"></th>"
						+ "</tr>");
			}
    		
    		%> 	
    	</table>
    
    </div>
  </div>

	<br/>
	</form>
	</div>
</div>
<jsp:include page="../include/include2.jsp" flush="true" />
</html>