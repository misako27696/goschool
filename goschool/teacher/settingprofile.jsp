<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <link rel="stylesheet" href="/goschool/css/teacher_setting.css" type="text/css" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>設定 - 学校へいこう！！</title>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
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
     
    </head>
    
    <jsp:include page="../include/includeheadteacher.jsp" flush="true" />
    	<div id="side-left"><p>>> 設定 - プロフィール設定</p>
    		<jsp:include page="../include/include_teachersettingmenu.jsp" flush="true" />
    	</div>
    	
    	<div id="main">
        <br>

			<div class="box settingprof"><br />
				<p style="font-size:25px;">プロフィール変更</p>
				
				<table id="prof_change">
					
					<tr>
					<th style="margin-right:10px;">名前</th>
					<td><input type="text" value="編集できない値" readonly style="height:30px;
					background-color:#dcdcdc"></td>
					
					<td><input type="text" value="編集できない値" readonly style="height:30px;
					background-color:#dcdcdc"></td>
					</tr>
					
					<tr>
					<th>生年月日</th>
					<td><input type="text" value="編集できない値" readonly style="height:30px;
					margin-left:25px;background-color:#dcdcdc">　月</td>
					
					<td><input type="text" value="編集できない値" readonly style="height:30px;
					margin-left:25px;background-color:#dcdcdc">　日</td>
					</tr>
					
					<tr>
					<th>性別</th>
					<td><input type="text" value="編集できない値" readonly style="height:30px;background-color:#dcdcdc"></td>
					</tr>
				</table>
				<br />
				<a href="#setting_profdialog" name="modal">
				<input type="button" value="変更" class="prof-change-button" />
				</a>
	<br/><br/>
</div>

			
				
				        <!-- #customize your modal window here -->
         <div id="setting_profdialog" class="window">
         
         <!-- close button is defined as close class -->
            <a href="#" class="close">Close it</a>
            
            <form name="class_make">
            <b>
            		<h2>クラス情報を入力してください。</h2><br />
            		<p>名前
            		<input type="text" name="name" size="15" maxlength="20" style="margin-left:100px;">
            		<input type="text" name="name" size="15" maxlength="20" style="margin-left:10px;">
            		</p><br />
            		
            		<p>生年月日
					<select id="month" style="margin-left:75px;"><option value="0">--</option></select>月
					<select id="day"><option value="0">--</option></select>日​
					</p><br />
            		
            		<p>性別
            		<input type="radio" name="sex" value="man" checked="checked" style="margin-left:100px;">男性
					<input type="radio" name="sex" value="woman">女性
            		</p><br />
            		
					<input type="button" value="変更" class="class-make-button" style="margin-left:210px;"/>
            </b>
            </form>
            
         </div>
         <!-- Do not remove div#mask, because you'll need it to fill the whole screen -->
         <div id="mask"></div>

        </div>
   <jsp:include page="../include/include2.jsp" flush="true" />
</html>
