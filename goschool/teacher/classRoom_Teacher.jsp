<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <link rel="stylesheet" href="/goschool/css/classroom.css" type="text/css" />

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>クラスルーム - 学校へ行こう！！</title>
        
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
         <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.1/angular.min.js"></script>
         
<script type="text/javascript">
   $(function(){
      //select all the a tag with name equal to modal
      $('a[name=modal]').click(function(){
         /* href属性を取得 */
         var id = $(this).attr('href');
         /* スクリーンの高さと幅を取得 */
         var maskHeight = $(document).height();
         var maskWidth = $(window).width();
         /* スクリーン全体をおおうマスクの高さと幅を指定 */
         $('#mask').css({'width':maskWidth,'height':maskHeight});
         /* フェード効果を付ける */
         //transition effect
         $('#mask').fadeIn(1000);
         $('#mask').fadeTo("slow",0.8);
         /* ウィンドウの高さと幅を取得 */
         //Get the window height and width
         var winH = $(window).height();
         var winW = $(window).width();
          /* ウィンドウの中央にポップアップするよう設定 */
         $(id).css('top',  winH/2-$(id).height()/2);
         $(id).css('left', winW/2-$(id).width()/2);
         /* フェード効果を付ける */
         $(id).fadeIn(2000);
      });
      /* 閉じるボタンがクリックされた時 */
      $('.window .close').click(function(){
         $('#mask, .window').hide();
      });
      /* マスクがクリックされた時 */
      $('#mask').click(function(){
         $(this).hide();
         $('.window').hide();
      });
   });
   
   //カレンダー表示するためのやつ
   $(document).ready(function(){
  //現在の年数オブジェクトを4桁で生成
   var time = new Date();
   var year = time.getFullYear();

 //1900年まで表示
   for (var i = year; i >= 1900; i--) {
       $('#year').append('<option value="' + i + '">' + i + '</option>');
   }
   //1～12の数字を生成
   for (var i = 1; i <= 12; i++) {
       $('#month').append('<option value="' + i + '">' + i + '</option>');
   }
   //1～31の数字を生成
   for (var i = 1; i <= 31; i++) {
       $('#day').append('<option value="' + i + '">' + i + '</option>');
   }
   });
   
   
  
</script>
<script src="http://code.jquery.com/jquery.min.js"></script>
		<script src="script.js"></script>

<jsp:include page="../include/script_classroom.jsp" flush="true" />

    </head>
    
    <jsp:include page="../include/includeheadteacher.jsp" flush="true" />
    
       <div id="side-left" style="font-size:15px;"><p>>> クラスルーム</p>
        
       
       <div style="margin-left:30px;">
       <a href="#attendance" name="modal">
        <input type="button" value="今日の出席状況を編集" class="btn" style="width:250px">
        </a>
 
        <input type="button" value="クラス変更" class="btn" onclick="location.href='/goschool/teacher/classList.jsp'" style="width:250px">
        </div>
        
        <br><br>

        <div class="question_Box">
        <div class="question_image">
        <img src="/goschool/img/teacher_man_fin.png" height="280" width="150" alt=""></div>
            <div class="arrow_question">
            	<div class="oneword">
                <% out.println(request.getAttribute("toDay")); %>
                <p style="font-size:15px;">今日も1日頑張ろう</p>
    			</div>
                
            </div><!-- /.arrow_question -->
        </div><!-- /.question_Box -->
        </div>
        
        
    	<div id="main">
			<div id="class_atend">
			<form action="/goschool/classroomteacher" method="post">
				<input type="date"  name="calender" id="calender" value="<%= request.getAttribute("registDay") %>" >　<!-- ←空白あり消さないで -->
				<input type="submit" value="変更" name="week" style="width:100px">
			</form>
			
				<br>
				<table class="atend_head" >
					    <tbody>
					        <tr>
					            <th>日にち</th>
					            <td class="data">
					                届出欠席
					            </td>
					            <td class="data">
					                無届欠席
					            </td>
					            <td class="data">
					                遅刻
					            </td>
					            <td class="data">
					                欠課
					            </td>
					            <td class="data">
					                早退
					            </td>
					            <td class="data">
					                記入者
					            </td>
					        </tr>
					    </tbody>
					</table><br>
					
								
					<%
					ArrayList<Map<String, String>> attends = new ArrayList<Map<String, String>>();
					attends= (ArrayList<Map<String, String>>)request.getAttribute("attends");
					
					// データを出力する。
					for ( int i = 0; i < 7; ++i ) {
						Map<String, String> attend = attends.get( i );
						String Day	=	attend.get( "Day" ).toString();
						String Tikoku	=	attend.get( "Tikoku" ).toString();
						String Sotai	=	attend.get( "Sotai" ).toString();
						String Kekka	=	attend.get( "Kekka" ).toString();
						String Todokede =	attend.get( "Todokede" ).toString();
						String Mutodoke =	attend.get( "Mutodoke" ).toString();
						
						out.println("<table class=\"atend_date\">"
								+"<tbody><tr><th>" + Day + "</th>"
								+ "<td class=\"data\">" + Todokede + "</td>"
								+ "<td class=\"data\">" + Mutodoke + "</td>"
								+ "<td class=\"data\">" + Tikoku + "</td>"
								+ "<td class=\"data\">" + Kekka + "</td>"
								+ "<td class=\"data\">" + Sotai + "</td>"
								+ "<td class=\"data2\">" + "田中" + "</td>"
								+ "</tr></tbody></table><br>");
					}
					%>       
			</div>

			
			<div id="class_timetable">
			<br>
			<table class="atend_timetable">
					    <tbody>
					        <tr>
					        	<th>　</th>
					            <th>月</th>
					            <th>火</th>
					            <th>水</th>
					            <th>木</th>
					            <th>金</th>
					        </tr>
					        
					        <%
							ArrayList<Map<String, String>> subjects = new ArrayList<Map<String, String>>();
					        subjects = (ArrayList<Map<String, String>>)request.getAttribute("subjects");
					        out.println("<tr>");
					        out.println("<td class=\"data\">1</td>");
					    	// データを出力する。
							for ( int i = 0; i < subjects.size(); ++i ) {													
								Map<String, String> subject = subjects.get( i );
								int lesson_number = Integer.parseInt(subject.get( "lesson_number" ));
								int week			 = Integer.parseInt(subject.get( "week" ));
								String subject_name	 = subject.get( "subject_name" ).toString();
								String lecture_name	 = subject.get( "lecture_name" ).toString();
								String classroom 	 = subject.get( "classroom" ).toString();
								if(subject_name.equals(" ")){
									out.println("<td class=\"data\">" + "</td>");
								}else{
									out.println("<td class=\"data\">"
											+ "<strong>"+subject_name + "</strong>" + "<br>"
											+ lecture_name+"先生 "
											+ classroom
											+ "</td>");
								}
								if(week == 6) {
									if(lesson_number != 7){
										out.println("</tr>");
										out.println("<tr>");
										int ls = Integer.parseInt(String.valueOf(lesson_number))+1;
										out.println("<td class=\"data\">" + ls + "</td>");
									}
								}
								
					        }
							%>
							</tr>
					    </tbody>
					</table>
					
				<div id="class_roster">
					<table class="atend_roster">
					    <tbody>
					        <tr>
					            <th>出席番号</th>
					            <th>氏名</th>
					        </tr>
					        
							<%
							ArrayList<Map<String, String>> members = new ArrayList<Map<String, String>>();
							members= (ArrayList<Map<String, String>>)request.getAttribute("members");
							
							// データを出力する。
							for ( int i = 0; i < members.size(); ++i ) {
								Map<String, String> member = members.get( i );
								String student_number	=	member.get( "student_number" ).toString();
								String lastname	=	member.get( "lastname" ).toString();
								String firstname	=	member.get( "firstname" ).toString();
								
								out.println("<tr>"
										+ "<td class=\"data\">" + student_number + "</td>"
										+ "<td class=\"data2\">" + lastname + firstname + "</td>"
										+ "</tr>");
							}
							%>

					    </tbody>
					</table>
				</div>

			</div>
			
			<!-- #customize your modal window here -->
         <div id="attendance" class="window">
         
         <!-- close button is defined as close class -->
            <a href="#" class="close">Close it</a>
            
            <form name="class_make">
            <b>
            		<h2>出席簿を入力します。</h2><br />
            		
		<!-- 届出欠席 -->
							<ul>
								<li>届出欠席<input type="button" value="欠席を追加" id="btn_todokede">
									<ol id="todokede_list">
										<li><input type="text" size="40" name="todokede_list_0" value=""></li>
									</ol>
								</li>
							</ul>
							<br/>
						
						<!-- 無届欠席 -->
							<ul>
								<li>無届欠席<input type="button" value="欠席を追加" id="btn_mutodokede">
									<ol id="mutodokede_list">
										<li><input type="text" size="40" name="mutodokede_list_0" value=""></li>
									</ol>
								</li>
							</ul>
							<br/>
							
						<!-- 遅刻 -->
							<ul>
								<li>遅刻<input type="button" value="欠席を追加" id="btn_tikoku">
									<ol id="tikoku_list">
										<li><input type="text" size="40" name="tikoku_list_0" value=""></li>
									</ol>
								</li>
							</ul>
							<br/>
							
						<!-- 早退 -->
							<ul>
								<li>早退<input type="button" value="欠席を追加" id="btn_soutai">
									<ol id="soutai_list">
										<li><input type="text" size="40" name="soutai_list_0" value=""></li>
									</ol>
								</li>
							</ul>
							<br/>
							
						<!-- 欠課 -->
							<ul>
								<li>欠課<input type="button" value="欠席を追加" id="btn_kekka">
									<ol id="kekka_list">
										<li>
											<select name="month" style="width:90px">
												<option value="">欠席時限</option>
												<option value="1">1限目</option>
												<option value="2">2限目</option>
												<option value="3">3限目</option>
												<option value="4">4限目</option>
												<option value="5">5限目</option>
												<option value="6">6限目</option>
												<option value="7">7限目</option>
											</select>
											<br/>
											<input type="text" size="40" name="kekka_list_0" value="">
										</li>
									</ol>
								</li>
							</ul>
			<br/>
		
			<input type="submit" value="更新" name="submit" style="margin-left:195px;">

            </b>
            </form>
            
         </div>
         <!-- Do not remove div#mask, because you'll need it to fill the whole screen -->
         <div id="mask"></div>
			
			
        </div>
    <jsp:include page="../include/include2.jsp" flush="true" />
</html>
