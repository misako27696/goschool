<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <link rel="stylesheet" href="/goschool/css/classlist.css" type="text/css" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>卒検</title>
       
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

</script>
     
    </head>
    
    <jsp:include page="../include/includeheadteacher.jsp" flush="true" />
    	<div id="side-left">>> クラスルーム選択</div>
    	<div id="main">
        <br>
        
<div id="modal">
 
<!-- CODE -->
         <h2 style="margin-left:200px;">クラスを選択して下さい</h2>
         <!-- #dialog is the id of a DIV defined in the code below -->
         <p><a href="#dialog" name="modal"><img src="../img/class_makemaru.png" alt="classmake" border="0">
         <div style="margin-left:20px;">クラスを作成</div></a></p>
         <!-- #customize your modal window here -->
         <div id="dialog" class="window">
         
         <!-- close button is defined as close class -->
            <a href="#" class="close">Close it</a>
            
            <form name="class_make">
            <b>
            		<h2>クラス情報を入力してください。</h2>
            		<p>学校名<input type="text" name="name" size="30" maxlength="20" style="margin-left:100px;">
            		</p>
            		
            		<p>担任名<input type="text" name="name" size="30" maxlength="20" style="margin-left:100px;">
            		</p>
            		
            		<p>副担任<input type="text" name="name" size="30" maxlength="20" style="margin-left:100px;">
            		</p>
            		
            		<p>クラスの名前<input type="text" name="name" size="30" maxlength="20" style="margin-left:60px;">
            		</p>
            		
            		<p>現在の年次<select id="language" name="language" style="margin-left:72px;">
						<option value="en" selected>1</option>
						<option value="de">2</option>
						<option value="fr">3</option>
					</select> 年</p>
									
					<p>学期数<select id="language" name="language" style="margin-left:97px;">
						<option value="en" selected>2学期制</option>
						<option value="de">3学期制</option>
					</select></p>
					
					<p>入学年
					<select id="language" name="language" style="margin-left:97px;">
						
						年
					</select></p>
					
					<p>年間総授業数
					<input type="text" value="150" name="name" size="30" maxlength="20" style="margin-left:60px;">
						日</p>
					
					<p>総授業料
					<input type="text" value="290000" name="name" size="30" maxlength="20" style="margin-left:85px;">
					円</p>
					
					<input type="submit" value="クラスを作成する" class="class-make-button" style="margin-left:140px;"/>
            </b>
            </form>
            
         </div>
         <!-- Do not remove div#mask, because you'll need it to fill the whole screen -->
         <div id="mask"></div>
         
        </div>
        </div>
   <jsp:include page="../include/include2.jsp" flush="true" />
</html>
