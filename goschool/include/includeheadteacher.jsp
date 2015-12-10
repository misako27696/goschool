<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>
<link rel="stylesheet" href="/goschool/css/main.css" type="text/css" />
<body>

	<div id="goschool">
		<div id="ceiling"></div>
		<div id="left-title"></div>
		<div id="title">
			<img src="/goschool/img/Chandelier_fin.png" height="150" width="" alt="">
		</div>
		
		<div id="right-title">
			<p style="margin-top:180px;margin-left:-80px;font-size:17px;">
				ようこそ、<%= session.getAttribute("userLName") %><%= session.getAttribute("userFName") %>さん
			</p>
			<form action="/goschool/logout" method="POST">
				<input type="submit" value="ログアウト" class="btn" />
			</form>
		</div>
		
		<div id="prop-left"></div>
		<div id="box">
		   
			<div id="tag">
			
				<div id="cssmenu" class="align-center">
					<ul>
						<li id="span">|</li>
   						<li>
   							<form id="fm" action="/goschool/classroomteacher" method="POST">
   								<input type="submit" id="sb" value="クラスルーム">
   							</form>
   						</li>
   						<li id="span">|</li>
  						<li>
  							<form id="fm" action="/goschool/mypagedaily" method="POST">
  								<input type="submit" id="sb" value="マイページ">
  							</form>
  						</li>
						<li id="span">|</li>
  						<li>
  							<form id="fm" action="/goschool/teacher/CalendarTeacher.jsp" method="POST">
  								<input type="submit" id="sb" value="カレンダー">
  							</form>
  						</li>
  						<li id="span">|</li>
  						<li>
  							<form id="fm" action="/goschool/teacher/settingprofile.jsp" method="POST">
  								<input type="submit" id="sb" value="設定">
  							</form>
  						</li>
  						<li id="span">|</li>
					</ul>
				</div>
			</div>
			