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
    
    <jsp:include page="../include/includeheadstudent.jsp" flush="true" />
    	<div id="side-left"><p>>> クラスルーム選択</p>
    		<jsp:include page="../include/include_studentsettingmenu.jsp" flush="true" />
    	</div>
    	
    	<div id="main">
        <br>

			<div class="box settingmail"><br />
				<p style="font-size:25px;">メールアドレスの変更</p>
				<form name="setting_pass">
					<p style="margin-right:275px;">新しいメールアドレスを入力してください。</p>
					<input type="email" style="margin-right:400px;">
					
					<p style="margin-right:300px;">確認のためもう一度入力してください。</p>
					<input type="email" style="margin-right:400px;">
				
				</form>
				
				<br />
			
				<input type="submit" value="変更" class="mail-change-button" />
	<br/><br/>
</div>
        </div>
   <jsp:include page="../include/include2.jsp" flush="true" />
</html>
