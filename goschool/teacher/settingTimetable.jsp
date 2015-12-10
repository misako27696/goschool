<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <link rel="stylesheet" href="/goschool/css/teacher_setting.css" type="text/css" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>学校へいこう！！ - 設定</title>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
        
        <script language="JavaScript">
        
        	
        
        </script>
        
    </head>
    
    <jsp:include page="../include/includeheadteacher.jsp" flush="true" />
    	<div id="side-left"><p>>> 設定 - 時間割</p>
    		<jsp:include page="../include/include_teachersettingmenu.jsp" flush="true" />
    	</div>
    	
    	<div id="main">
        <br>

		
			<div class="box settingtimetable"><br />
			<h2>追加したい授業名を入力してください。</h2>
			
		<!-- 学期 -->			
			<form name="timetable">
				学期：<input type="text" value="" name="addSemester" />
				<br/>
					
		<!-- 教科 -->
				教科：<input type="text" value="" name="addSubject"/>
						<br/>
			
			<!-- 教室 -->
				教室：<input type="text" value="" name="addRoom"/>
						<br/>
			
			<!-- 担当 -->
				担当：<input type="text" value="" name="addResponsible"/>
						<br/>
			
			<!-- コマ -->
				コマ数：<input type="text" value="" name="addComa"/><br/>
							<input type="button" value="追加" onClick=""/>
						<br/>
						<br/>
						
						
		<table border="1">
		<tr><td>月</td>
			<td>火</td>
			<td>水</td>
			<td>木</td>
			<td>金</td>
			</tr>
		
		 <%for (int tate = 0; tate <7; tate++) 
					{%>  
			<tr>
			  <%for (int yoko = 0; yoko <5; yoko++) 
					{%> 
			<td>
			
			<!-- 学期 -->
				<select name="ComputerSeme">
					<option value="seme">学期</option>
				</select><br />
				
			<!-- 教科 -->
				<select name="ComputerSub">
					<option value="sub">教科</option>
				</select><br />
				
			<!-- 教室 -->
				<select name="ComputerRoom">
					<option value="room">教室</option>
				</select><br />
			
			<!-- 担当 -->
				<select name="ComputerRes">
					<option value="res">担当</option>
				</select><br />
				
			<!-- コマ -->
				<select name="ComputerComa">
					<option value="coma">コマ数</option>
				</select><br />
		</td>
		 <% } %> 
		</tr>
		 <% } %>
	</table>
			</form>
				<br/><br/>
				</div>
        	</div>
   <jsp:include page="../include/include2.jsp" flush="true" />
</html>
