<%@page pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <link rel="stylesheet" href="/goschool/css/student_mypage.css" type="text/css" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>学校へいこう</title>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">


<script type="text/javascript">
	$(function(){
		$("#monthdown").click(function () {
			var m =parseInt($("#month").text(), 10);
			if(m==1){
				m=13;
				var y =parseInt($("#year1").text(), 10);
				y=y-1;
				$("#year1").text(y);
			}
			m=m-1;
			$("#month").text(m);
		});
	});
	$(function(){
		$("#monthup").click(function () {
			var m =parseInt($("#month").text(), 10);
			if(m==12){
				m=0;
				var y =parseInt($("#year1").text(), 10);
				y=y+1;
				$("#year1").text(y);
			}
			m=m+1;
			$("#month").text(m);
		});
	});
	$(function(){
		$("#yeardown").click(function () {
			var y =parseInt($("#year").text(), 10);
			y=y-1;
			$("#year").text(y);
		});
	});
	$(function(){
		$("#yearup").click(function () {
			var y =parseInt($("#year").text(), 10);
			y=y+1;
			$("#year").text(y);
		});
	});
	$(function() {
	    $( "#tabhoge" ).tabs();
	  });
	</script>
	
	<script src="../js/Chart.js"></script>
	
	<script>
	

	var barChartData = {
		labels : ["4月","5月","6月","7月","8月","9月","10月","11月","12月","1月","2月","3月"],
		datasets : [
			{
				fillColor : "rgba(157,187,205,0.5)",
				strokeColor : "rgba(157,187,205,0.8)",
				highlightFill: "rgba(220,220,220,0.75)",
				highlightStroke: "rgba(220,220,220,1)",
				//↓ここにデータを入れる
				data : [30,30,30,30,30,30,30,30,30,30,30,30]
			},
		]
	}
	
	var option = {
			  //Boolean - 縦軸の目盛りの上書き許可
			  scaleOverride : true,
			  //** ↑がtrueの場合 **
			  //Number - 目盛りの間隔
			  scaleSteps : 10,
			  //Number - 目盛り区切りの間隔
			  scaleStepWidth : 10,
			  //Number - 目盛りの最小値
			  scaleStartValue : 0,
			  /* //String - 目盛りの線の色 
			  scaleLineColor : "rgba(0,0,0,.1)", */
			  /* //Number - 目盛りの線の幅  
			  scaleLineWidth : 10, */
			  //Boolean - 目盛りを表示するかどうか  
			  scaleShowLabels : true,
			  //String - 目盛りのフォント
			  scaleFontFamily : "'Arial'",
			  //Number - 目盛りのフォントサイズ 
			  scaleFontSize : 10,
			  //String - 目盛りのフォントスタイル bold→太字  
			  scaleFontStyle : "normal",
			  //String - 目盛りのフォント 
			  scaleFontColor : "#666",  
			  ///Boolean - チャートの背景にグリッドを描画するか
			  scaleShowGridLines : true,
			  //String - チャート背景のグリッド色
			  scaleGridLineColor : "rgba(0,0,0,.05)",
			  //Number - チャート背景のグリッドの太さ
			  scaleGridLineWidth : 1,  
			  //Boolean - 線を曲線にするかどうか。falseで折れ線になる
			  bezierCurve : true,
			  //Boolean - 点を描画するか
			  pointDot : true,
			  //Number - 点の大きさ
			  pointDotRadius : 3,
			  //Number - 点の周りの大きさ
			  pointDotStrokeWidth : 1,
			  //Number - 線の太さ
			  datasetStrokeWidth : 2,
			  //Boolean - アニメーションの有無
			  animation : true,
			  //Number - アニメーションの早さ(大きいほど遅い)
			  animationSteps : 60,
			  //Function - アニメーション終了時の処理
			  onAnimationComplete : null
			}
	
	window.onload = function(){
		var ctx = document.getElementById("canvas").getContext("2d");
		window.myBar = new Chart(ctx).Bar(barChartData, option);
	}
	</script>
	
	
</head>
<jsp:include page="../include/includeheadstudent.jsp" flush="true" />

<div id="side-left"><p>>> マイページ</p>
       
        <br><br>
			<jsp:include page="../include/include_teachericon.jsp" flush="true" />
        </div>
<div id="main">
        	
        		<%
        		ArrayList<Map<String, String>> attends = new ArrayList<Map<String, String>>();
				attends= (ArrayList<Map<String, String>>)request.getAttribute("attends");
        		
				if(1>attends.size()){
					out.println("<div id=\"sp\"><p id=\"pa\"><b>100％</b></p></div>");
				}else{
					// データを出力する。
					for ( int i = 0; i < attends.size(); ++i ) {
						Map<String, String> attend = attends.get( i );
						String Tikoku	=	attend.get( "Tikoku" ).toString();
						String Sotai	=	attend.get( "Sotai" ).toString();
						String Kekka	=	attend.get( "Kekka" ).toString();
						String Todokede	=	attend.get( "Todokede" ).toString();
						String Mutodoke	=	attend.get( "Mutodoke" ).toString();
						String Minasi	=	attend.get( "Minasi" ).toString();
						String Ruikei = String.valueOf(Integer.parseInt(Todokede) + Integer.parseInt(Mutodoke) + Integer.parseInt(Minasi));
						
						double s = Double.parseDouble(String.valueOf(request.getAttribute("totalDays"))) - Double.parseDouble(Ruikei);	
						double rate = 
								Math.floor(
								s / Double.parseDouble(String.valueOf(request.getAttribute("totalDays"))) * 100);
						int iRate = (int)rate;
						out.println("<div id=\"sp\"><p id=\"pa\"><b>"+iRate+"％</b></p></div>");
					}
				}
        		
        		%>
        		
        		<div class="box class_attendstate" style="height:900px;">
        		
        		<form name="js" method="post" action="/goschool/mypagestudent">
        		<input type="hidden" name="flag" value="flag" id="flag">
        		<br>     			
        			<table id="student_attend" >
        				<tr>
        					<td></td>
        					<td colspan="2"></td>
        					<td></td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;
        					border-bottom: 1px solid #000;">無届</td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;
        					border-bottom: 1px solid #000;">届出</td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;
        					border-bottom: 1px solid #000;">遅刻</td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;
        					border-bottom: 1px solid #000;">欠課</td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;
        					border-bottom: 1px solid #000;">早退</td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;
        					border-bottom: 1px solid #000;">みなし</td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;
        					border-bottom: 1px solid #000;">公欠</td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;
        					border-bottom: 1px solid #000;">出席日数</td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;
        					border-bottom: 1px solid #000;">累計</td>
        				</tr>
        				<tr>
        					<th style="border:none;border-left: 1px solid #000;border-top: 1px solid #000;">
				<input type="submit" id="yeardown" value="◀" name="yeardown">
			</th>
			<th colspan="2" style="border:none;border-top: 1px solid #000;width:100px;">
				<h2>
					<p id="year1"><%= session.getAttribute("year") %></p>年
				</h2>
			</th>
			<th style="border:none;border-top: 1px solid #000;">
				<input type="submit" id="yearup" value="▶" name="yearup">
			</th>
			<%
				attends = new ArrayList<Map<String, String>>();
				attends= (ArrayList<Map<String, String>>)request.getAttribute("attends");
				
				if(1>attends.size()){
					out.println("<td style=\"width:80px;text-align:center;border-left: 1px solid #000;\">0</td>"
							+ "<td style=\"width:80px;text-align:center;border-left: 1px solid #000;\">0</td>"
							+ "<td style=\"width:80px;text-align:center;border-left: 1px solid #000;\">0</td>"
							+ "<td style=\"width:80px;text-align:center;border-left: 1px solid #000;\">0</td>"
							+ "<td style=\"width:80px;text-align:center;border-left: 1px solid #000;\">0</td>"
							+ "<td style=\"width:80px;text-align:center;border-left: 1px solid #000;\">0</td>"
							+ "<td style=\"width:80px;text-align:center;border-left: 1px solid #000;\">0</td>"
							+ "<td style=\"width:80px;text-align:center;border-left: 1px solid #000;\">0</td>"
							+ "<td style=\"width:80px;text-align:center;border-left: 1px solid #000;\">0</td>"
						);
				}else{
					// データを出力する。
					for ( int i = 0; i < attends.size(); ++i ) {
						Map<String, String> attend = attends.get( i );
						String Tikoku	=	attend.get( "Tikoku" ).toString();
						String Sotai	=	attend.get( "Sotai" ).toString();
						String Kekka	=	attend.get( "Kekka" ).toString();
						String Todokede	=	attend.get( "Todokede" ).toString();
						String Mutodoke	=	attend.get( "Mutodoke" ).toString();
						String Minasi	=	attend.get( "Minasi" ).toString();
						String Ruikei = String.valueOf(Integer.parseInt(Todokede) + Integer.parseInt(Mutodoke) + Integer.parseInt(Minasi));
						
						double s = Double.parseDouble(String.valueOf(request.getAttribute("totalDays")))
									- Double.parseDouble(Ruikei);
						double rate = 
								Math.floor(
								s / Double.parseDouble(String.valueOf(request.getAttribute("totalDays"))) * 100);
						
						out.println("<td style=\"width:80px;text-align:center;border-left: 1px solid #000;\">"
								+ Mutodoke + "</td>"
								+ "<td style=\"width:80px;text-align:center;border-left: 1px solid #000;\">"
								+ Todokede + "</td>"
								+ "<td style=\"width:80px;text-align:center;border-left: 1px solid #000;\">"
								+ Tikoku + "</td>"
								+ "<td style=\"width:80px;text-align:center;border-left: 1px solid #000;\">"
								+ Kekka + "</td>"
								+ "<td style=\"width:80px;text-align:center;border-left: 1px solid #000;\">"
								+ Sotai + "</td>"
								+ "<td style=\"width:80px;text-align:center;border-left: 1px solid #000;\">"
								+ Minasi + "</td>"
								+ "<td style=\"width:80px;text-align:center;border-left: 1px solid #000;\">"
								+ "0</td>"
								+ "<td style=\"width:80px;text-align:center;border-left: 1px solid #000;\">"
								+ "0</td>"
								+ "<td style=\"width:80px;text-align:center;border-left: 1px solid #000;\">"
								+ Ruikei +"</td>"
							);
					}
				}
			%>
        					</tr>
        				
        				
        			</table>
        			
        			<br><br>
        			
        			<div id="tabhoge" style="width:897px;margin-left:30px;">
        			<br><br>
    <ul>
      <li><a href="#bymonth">月別</a></li>
      <li><a href="#bytuition">授業別</a></li>
      <li><a href="#detail">詳細</a></li>
    </ul>


<!-- クラスにする -->
    <div id="bymonth">
    <table id="student_attend" >
        				<tr>
        					<td></td>
        					<td colspan="2"></td>
        					<td></td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;border-bottom: 1px solid #000;">無届</td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;border-bottom: 1px solid #000;">届出</td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;border-bottom: 1px solid #000;">遅刻</td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;border-bottom: 1px solid #000;">欠課</td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;border-bottom: 1px solid #000;">早退</td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;border-bottom: 1px solid #000;">みなし</td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;border-bottom: 1px solid #000;">公欠</td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;border-bottom: 1px solid #000;">出席日</td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;border-bottom: 1px solid #000;">累計</td>
        				</tr>
        				<tr>
        					<th style="border:none;border-left: 1px solid #000;border-top: 1px solid #000;">
				<input type="button" id="monthdown" value="◀">
			</th>
			<th colspan="2" style="border:none;border-top: 1px solid #000;width:100px;">
				<h2>
					<p id="year1">2015</p>年<br>
				</h2>
			</th>
			<th style="border:none;border-top: 1px solid #000;">
				<input type="button" id="monthup" value="▶">
			</th>
							<td style="width:80px;text-align:center;border-left: 1px solid #000;">無届</td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;">届出</td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;">遅刻</td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;">欠課</td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;">早退</td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;">みなし</td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;">公欠</td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;">出席日</td>
        					<td style="width:80px;text-align:center;border-left: 1px solid #000;">累計</td>
        				</tr>
        				
        				
        			</table><br>
        		<canvas id="canvas" height="400" width="850" style="width: 850px; height: 400px;"></canvas>
    </div>
    <div id="bytuition" style="height:500px;overflow-y:scroll;">
    <br>
    		<table id="student_tuition">
    			<tr><th style="font-size:20px;width:70px;" style="background-color:#87cefa;">前期</th>
    			<th class="ex3">授業名</th>
    			<th class="ex4" style="background-color:#87cefa;">総欠課数</th>
    			<th class="ex4" style="background-color:#87cefa;">総コマ数</th>
    			<th class="ex4" style="background-color:#87cefa;">出席率</th>
    			<th class="ex4" style="background-color:#87cefa;">あと何コマ？</th></tr>
    			
    			<%for (int num = 0; num <=25; num++) 
					{%>
    			<tr><th></th>
    			<th class="ex3"></th>
    			<th class="ex4"></th>
    			<th class="ex4"></th>
    			<th class="ex4"></th>
    			<th class="ex4"></th></tr>
    			<% } %>
    </table>
    </div>
    <div id="detail" style="height:500px;overflow-y:scroll;">
	
    	<table id="student_pora">
    		<tr><td class="ex7"><img src="/goschool/img/marumu.png"></td>
    			<td class="ex8">無届</td>
    			<td class="ex7"><img src="/goschool/img/todoke.png"></td>
    			<td class="ex8">届出</td>
    			<td class="ex7"><img src="/goschool/img/tikoku.png"></td>
    			<td class="ex8">遅刻</td>
    			<td class="ex7"><img src="/goschool/img/kekka.png"></td>
    			<td class="ex8">遅刻</td>
    			<td class="ex7"><img src="/goschool/img/soutai.png"></td>
    			<td class="ex8">早退</td>
    			<td class="ex7"><img src="/goschool/img/kouketu.png"></td>
    			<td class="ex8">公欠</td></tr>
    	</table>
    	<br>
    	<table id="student_detail">
    	<%for (int detail = 1; detail <=12; detail++) 
					{%>
    			<tr>
    			<th class="ex5"><%= detail %>月</th>
    			</tr>
    		
    	    	<tr>
    	    	<th class="ex6"></th>
    			</tr>
    			<% } %>
    </table>
    
    
    </div>
    </div>
        		</form>
        		</div>
        	</div>
<jsp:include page="../include/include2.jsp" flush="true" />
</html>
        					