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
       $('#year').append('<option value="' + i + '">' + i + '年</option>');
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
    	<div id="side-left"><p>>> 設定 - 名簿</p>
    		<jsp:include page="../include/include_teachersettingmenu.jsp" flush="true" />
    	</div>
    	
    	<div id="main">
        <br>

			<div class="box settingclasslist"><br />
			<h2>生徒を選択し、正しい各項目を選んで下さい</h2>
			
			
			<select id="classlist" name="sample4" multiple>
			<table border="1">
			<%for (int num = 0; num <=50; num++) 
					{%>
					<Tr>
  				<option value="1">
  				<Td><%= num %></Td>
  				<td>前田吉輝</td>
  				</option>
  				</Tr>
  				<% } %>
  				</table>
			</select>
			
			<!-- 削除ボタン -->
			<a href="#setting_delete" name="modal">
			<input type="button" class="btn_delete" value="削除" />
			</a>
			
			<!-- 転科ボタン -->
			<a href="#setting_changedele" name="modal">
			<input type="button" class="btn_changedele" value="転科" />
			</a>
			
			<!-- 留年ボタン -->
			<a href="#setting_proffe" name="modal">
			<input type="button" class="btn_proffe" value="留年" />
			</a>
			
			<!-- 繰り上げボタン -->
			<a href="#setting_carry" name="modal">
			<input type="button" class="btn_carry" value="学年の繰り上げ" />
			</a>
			
			<!-- 全削除ボタン -->
			<a href="#setting_alldele" name="modal">
			<input type="button" class="btn_alldele" value="名簿全削除" />
			</a>
			<br/><br/>
</div>

<!-- 削除ボタンのモーダル -->
         <div id="setting_delete" class="window">
         
         <!-- close button is defined as close class -->
            <div style="text-align:left"><a href="#" class="close">Close it</a></div>
            
            
            <form name="class_make">
            <b>
            		<p style="text-align:left;font-size:20px;">本当に</p>
            		<h1 style="font-size:110px;color:#ff0000;">ここに名前がくるよ</h1>
            		<p style="text-align:right;font-size:20px;">を削除させてもよろしいですか？</p><br />
					<input type="submit" value="はい" class="class-make-button" 
					style=""/>
					<input type="submit" value="キャンセル" class="class-make-button" 
					style=""/>
            </b>
            </form>
            
         </div>
         <!-- Do not remove div#mask, because you'll need it to fill the whole screen -->
         <div id="mask"></div>
         <!-- 削除ボタンのモーダルおわり -->
         
         
         <!-- 転科ボタンのモーダル -->
         <div id="setting_changedele" class="window">
         
         <!-- close button is defined as close class -->
            <div style="text-align:left"><a href="#" class="close">Close it</a></div>
            
            
            <form name="class_make">
            <b>
            		
            		<h2>転科する学校、学科を選択してください。</h1><br />
            		<select id="year" style="margin-right:50px;font-size:20px;">
            		<option value="0">入学年</option></select>
            		
            		<select id="schoolname" style="margin-right:50px;font-size:20px;">
            		<option value="school">学科名</option></select>

            		<select id="classname" style="font-size:20px;">
            		<option value="class">学科クラス名</option></select>
            		<br /><br /><br />
            		
            		
					<input type="submit" value="確認" class="class-make-button" 
					style="font-size:20px;"/>
            </b>
            </form>
            
         </div>
         <!-- Do not remove div#mask, because you'll need it to fill the whole screen -->
         <div id="mask"></div>
         <!-- 転科ボタンのモーダルおわり -->
         
         
         <!-- 留年ボタンのモーダル -->
         <div id="setting_proffe" class="window">
         
         <!-- close button is defined as close class -->
            <div style="text-align:left"><a href="#" class="close">Close it</a></div>
            
            
            <form name="class_make">
            <b>
            		<p style="text-align:left;font-size:20px;">本当に</p>
            		<h1 style="font-size:110px;color:#ff0000;">ここに名前がくるよ</h1>
            		<p style="text-align:right;font-size:20px;">を留年させてもよろしいですか？</p><br />
					<input type="submit" value="はい" class="class-make-button" 
					style=""/>
					<input type="submit" value="キャンセル" class="class-make-button" 
					style=""/>
            </b>
            </form>
            
         </div>
         <!-- Do not remove div#mask, because you'll need it to fill the whole screen -->
         <div id="mask"></div>
         <!-- 留年ボタンのモーダルおわり -->
         
         
         <!-- 繰り上げボタンのモーダル -->
         <div id="setting_carry" class="window">
         
         <!-- close button is defined as close class -->
            <div style="text-align:left"><a href="#" class="close">Close it</a></div>
            
            
            <form name="class_make">
            <b>
            		<p style="text-align:left;font-size:20px;">本当に</p>
            		<h1 style="font-size:110px;color:#ff0000;">ここname</h1>
            		<p style="text-align:right;font-size:20px;">を学年を繰り上げさせてもよろしいですか？</p><br />
					<input type="submit" value="はい" class="class-make-button" 
					style=""/>
					<input type="submit" value="キャンセル" class="class-make-button" 
					style=""/>
            </b>
            </form>
            
         </div>
         <!-- Do not remove div#mask, because you'll need it to fill the whole screen -->
         <div id="mask"></div>
         <!-- 繰り上げボタンのモーダルおわり -->
         
         
         <!-- 全削除ボタンのモーダル -->
         <div id="setting_alldele" class="window">
         
         <!-- close button is defined as close class -->
            <div style="text-align:left"><a href="#" class="close">Close it</a></div>
            
            
            <form name="class_make">
            <b>
            		<p style="text-align:left;font-size:20px;">本当に</p>
            		<h1 style="font-size:110px;color:#ff0000;">全名簿</h1>
            		<p style="text-align:right;font-size:20px;">を削除させてもよろしいですか？</p><br />
					<input type="submit" value="はい" class="class-make-button" 
					style=""/>
					<input type="submit" value="キャンセル" class="class-make-button" 
					style=""/>
            </b>
            </form>
            
         </div>
         <!-- Do not remove div#mask, because you'll need it to fill the whole screen -->
         <div id="mask"></div>
         <!-- 全削除ボタンのモーダルおわり -->
         
        </div>
   <jsp:include page="../include/include2.jsp" flush="true" />
</html>
