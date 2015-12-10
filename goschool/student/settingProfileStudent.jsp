<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <link rel="stylesheet" href="/goschool/css/avater.css" type="text/css" />
    <link rel="stylesheet" href="/goschool/css/student_setting.css" type="text/css" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>設定 - 学校へいこう！！</title>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.1/jquery.min.js" type="text/javascript" ></script>
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
   
   <!-- ▼▼========パーツタブ切り替え処理=========▼▼ -->
   function ChangeTab(tabname) {
      // 全部消す
      document.getElementById('tab1').style.display = 'none';
      document.getElementById('tab2').style.display = 'none';
      document.getElementById('tab3').style.display = 'none';
      document.getElementById('tab4').style.display = 'none';
      // 指定箇所のみ表示
      document.getElementById(tabname).style.display = 'block';
   }
   <!-- ▲▲=========パーツタブ切り替え処理=========▲▲ -->

   <!-- ▼▼========画像切り替え処理=========▼▼ -->

   $(document).ready(function(){
   	//ナビゲーションのmouseover。画像切り替えとは関係ない。
   	$("div > div > div > a").hover(function(){
   		$(this).fadeTo(200,0.5);
   	},function() {
   		$(this).fadeTo(200,1);
   	});

   	//画像切り替え、内容を変更する。
   	$("div > div > div > a").click(function(){
   		var src = $(this).attr("href");
   		var id = $(this).attr("id");
   		if ( id == "eye"){
   			//目のパーツ
   			$("#cvs_eye").fadeOut("slow",function() {
   				$(this).attr("src",src);
   				$(this).fadeIn();
   				$('#hidden_eye').val(src);
   			});
   		}else if (id == "hair"){
   			//髪のパーツ
   			$("#cvs_hair").fadeOut("slow",function() {
   				$(this).attr("src",src);
   				$(this).fadeIn();
   				$('#hidden_hair').val(src);
   			});
   		}else if (id == "mouth"){
   			//髪のパーツ
   			$("#cvs_mouth").fadeOut("slow",function() {
   				$(this).attr("src",src);
   				$(this).fadeIn();
   				$('#hidden_mouth').val(src);
   			});
   		}else if ( id == "glasses"){
   			//眼鏡のパーツ
   			$("#cvs_glasses").fadeOut("slow",function() {
   				$(this).attr("src",src);
   				$(this).fadeIn();
   				$('#hidden_glasses').val(src);
   			});
   		}

   		//口のパーツ
   		return false;
   	});
   });
   <!-- ▲▲=========画像切り替え処理=========▲▲ -->

</script>
     
    </head>
    
    <jsp:include page="../include/includeheadstudent.jsp" flush="true" />
    	<div id="side-left"><p>>> クラスルーム選択</p>
    		<jsp:include page="../include/include_studentsettingmenu.jsp" flush="true" />
    	</div>
    	
    	<div id="main">
        <br/>

			<div class="box settingprof" style="height:800px;"><br />
				<p style="font-size:25px;">プロフィール変更</p>
				
				<table id="prof_change">
					
					<tr>
					<th style="margin-right:10px;">名前</th>
					<td><input type="text" value="編集できない値" readonly style="height:30px;
					background-color:#dcdcdc"/></td>
					
					<td><input type="text" value="編集できない値" readonly style="height:30px;
					background-color:#dcdcdc"/></td>
					</tr>
					
					<tr>
					<th>生年月日</th>
					<td><input readonly type="text" value="編集できない値" style="height:30px;
					margin-left:25px;background-color:#dcdcdc"/>　月</td>
					
					<td><input type="text" value="編集できない値" readonly style="height:30px;
					margin-left:25px;background-color:#dcdcdc"/>　日</td>
					</tr>
					
					<tr>
					<th>性別</th>
					<td><input type="text" value="編集できない値" readonly style="height:30px;background-color:#dcdcdc"/></td>
					</tr>
				</table>
				<br />
				<a href="#setting_profdialog" name="modal">
				<input type="submit" value="変更" class="prof-change-button" />
				</a>
				<br/>
				<br/>
				
				<!-- ▼▼=========キャンバス=========▼▼ -->
						<div id="canvas">
						<img id="cvs_body" src="/goschool/img/body_girl_fin.png"/>
						<img id="cvs_hair" src="/goschool/img/hair_bob.png"/>
						<img id="cvs_eye" src="/goschool/img/eye_kiritto.png"/>
						<img id="cvs_mouth" src="/goschool/img/mouth_kiritto.png"/>
						<img id="cvs_glasses" src="/goschool/img/eye_round.png"/>
						</div>
				<!-- ▲▲=========キャンバス=========▲▲ -->


					<!-- ▼▼=========アバターパーツ=========▼▼ -->
						<div id="right">
							<div class="tabbox">
							   <p class="tabs">
							      <a href="#tab1" class="tab1" onclick="ChangeTab('tab1'); return false;">目</a>
							      <a href="#tab2" class="tab2" onclick="ChangeTab('tab2'); return false;">髪</a>
							      <a href="#tab3" class="tab3" onclick="ChangeTab('tab3'); return false;">口</a>
							      <a href="#tab4" class="tab4" onclick="ChangeTab('tab4'); return false;">眼鏡</a>
							   </p>
								   <div id="tab1" class="tab">
		      <!-- ▼▼=========目のパーツ=========▼▼ -->
	          <a href="/goschool/img/eye_kiritto.png" id="eye"><img class="select" src="/goschool/img/eye_kiritto.png" alt="1．キリット"/></a>
	          <a href="/goschool/img/eye_lobo.png" id="eye"><img class="select" src="/goschool/img/eye_lobo.png" alt="2.ロボット"/></a>
	          <a href="/goschool/img/eye_matuge.png" id="eye"><img class="select" src="/goschool/img/eye_matuge.png" alt="3.下まつげ"/></a>
		      <a href="/goschool/img/eye_matuge.png" id="eye"><img class="select" src="/goschool/img/eye_mumu.png" alt="4.ムムッ"/></a>
		      <a href="/goschool/img/eye_nikoniko.png" id="eye"><img class="select" src="/goschool/img/eye_nikoniko.png" alt="5.ニコニコ"/></a>
		      <a href="/goschool/img/eye_nobita.png" id="eye"><img class="select" src="/goschool/img/eye_nobita.png" alt="6.のびた"/></a>
		      <a href="/goschool/img/eye_pachikuri.png" id="eye"><img class="select" src="/goschool/img/eye_pachikuri.png" alt="7.ぱちくり"/></a>
		      <a href="/goschool/img/eye_fujiko.png" id="eye"><img class="select" src="/goschool/img/eye_fujiko.png" alt="8.不二子"/></a>
		      <a href="/goschool/img/eye_jitome.png" id="eye"><img class="select" src="/goschool/img/eye_jitome.png" alt="9.じと目"/></a>
		      <a href="/goschool/img/eye_shoujo.png" id="eye"><img class="select" src="/goschool/img/eye_shoujo.png" alt="10.少女"/></a>
		      <a href="/goschool/img/eye_sleep.png" id="eye"><img class="select" src="/goschool/img/eye_sleep.png" alt="11.眠い"/></a>
		      <a href="/goschool/img/eye_takeshi.png" id="eye"><img class="select" src="/goschool/img/eye_takeshi.png" alt="12.タケシ"/></a>
		      <a href="/goschool/img/eye_tibashiri.png" id="eye"><img class="select" src="/goschool/img/eye_tibashiri.png" alt="13.血走り"/></a>
		      <a href="/goschool/img/eye_usodaro.png" id="eye"><img class="select" src="/goschool/img/eye_usodaro.png" alt="14.嘘だろ"/></a>
		      <a href="/goschool/img/eye_yanderu.png" id="eye"><img class="select" src="/goschool/img/eye_yanderu.png" alt="15.病んでる"/></a>
		      <a href="/goschool/img/eye_dragon.png" id="eye"><img class="select" src="/goschool/img/eye_dragon.png" alt="16.ドラゴン"/></a>
		      <a href="/goschool/img/eye_dqn.png" id="eye"><img class="select" src="/goschool/img/eye_dqn.png" alt="17.DQN"/></a>
		   </div>
		   <div id="tab2" class="tab">
		     <!-- ▼▼=========髪のパーツ=========▼▼ -->
		     <a href="/goschool/img/hair_shagii.png" id="hair"><img class="select" src="/goschool/img/hair_shagii.png" alt="1.シャギー"/></a>
		     <a href="/goschool/img/hair_bob.png" id="hair"><img class="select" src="/goschool/img/hair_bob.png" alt="ボブ"/></a>
		     <a href="/goschool/img/hair_longcarl.png" id="hair"><img class="select" src="/goschool/img/hair_longcarl.png" alt="ロングカール"/></a>
		     <a href="/goschool/img/hair_maki.png" id="hair"><img class="select" src="/goschool/img/hair_maki.png" alt="マキちゃん"/></a>
		     <a href="/goschool/img/hair_okappa.png" id="hair"><img class="select" src="/goschool/img/hair_okappa.png" alt="おかっぱ"/></a>
		     <a href="/goschool/img/hair_pink.png" id="hair"><img class="select" src="/goschool/img/hair_pink.png" alt="ピンク"/></a>
		   </div>
		   <div id="tab3" class="tab">
		      <!-- ▼▼=========口のパーツ=========▼▼ -->
		      <a href="/goschool/img/mouth_fujiko.png" id="mouth"><img class="select" src="/goschool/img/mouth_fujiko.png" alt="口"/></a>
		      <a href="/goschool/img/mouth_jitome.png" id="mouth"><img class="select" src="/goschool/img/mouth_jitome.png" alt="口"/></a>
		      <a href="/goschool/img/mouth_kiritto.png" id="mouth"><img class="select" src="/goschool/img/mouth_kiritto.png" alt="口"/></a>
		      <a href="/goschool/img/mouth_lobo.png" id="mouth"><img class="select" src="/goschool/img/mouth_lobo.png" alt="口"/></a>
		      <a href="/goschool/img/mouth_matsuge.png" id="mouth"><img class="select" src="/goschool/img/mouth_matsuge.png" alt="口"/></a>
		      <a href="/goschool/img/mouth_mumu.png" id="mouth"><img class="select" src="/goschool/img/mouth_mumu.png" alt="口"/></a>
		      <a href="/goschool/img/mouth_nikoniko.png" id="mouth"><img class="select" src="/goschool/img/mouth_nikoniko.png" alt="口"/></a>
		      <a href="/goschool/img/mouth_nobita.png" id="mouth"><img class="select" src="/goschool/img/mouth_nobita.png" alt="口"/></a>
		      <a href="/goschool/img/mouth_pachikuri.png" id="mouth"><img class="select" src="/goschool/img/mouth_pachikuri.png" alt="口"/></a>
		      <a href="/goschool/img/mouth_sleep.png" id="mouth"><img class="select" src="/goschool/img/mouth_sleep.png" alt="口"/></a>
		      <a href="/goschool/img/mouth_takeshi.png" id="mouth"><img class="select" src="/goschool/img/mouth_takeshi.png" alt="口"/></a>
		      <a href="/goschool/img/mouth_usodaro.png" id="mouth"><img class="select" src="/goschool/img/mouth_usodaro.png" alt="口"/></a>
		      <a href="/goschool/img/mouth_dqn.png" id="mouth"><img class="select" src="/goschool/img/mouth_dqn.png" alt="口"/></a>
		      <a href="/goschool/img/mouth_dragon.png" id="mouth"><img class="select" src="/goschool/img/mouth_dragon.png" alt="口"/></a>
		   </div>
		   <div id="tab4" class="tab">
		      <!-- ▼▼=========眼鏡のパーツ=========▼▼ -->
		      <a href="/goschool/img/blank.png" id="glasses"><img class="select" src="/goschool/img/blank.png" alt="1.空白"
		         style="background-image: url(&quot;/goschool/img/eye_blank.png&quot;);"/></a>
		      <a href="/goschool/img/eye_round.png" id="glasses"><img class="select" src="/goschool/img/eye_round.png" alt="2.ラウンド"/></a>
		      <a href="/goschool/img/eye_square.png" id="glasses"><img class="select" src="/goschool/img/eye_square.png" alt="3．スクウェア"/></a>
		      <a href="/goschool/img/eye_wellington.png" id="glasses"><img class="select" src="/goschool/img/eye_wellington.png" alt="4．ウェリントン"/></a>
		   </div>

	</div>
</div>
<script type="text/javascript">
   // デフォルトのタブを選択
   ChangeTab('tab1');
</script>
<!-- ▲▲=========アバターパーツ=========▲▲ -->


<div class="clear"></div><br/>
<!-- ▼▼=========送信ボタン=========▼▼ -->
<form method="post" action="<%= request.getContextPath()%>/Avatar_ajax">
<input type="hidden" name="eye" value="" id="hidden_eye"/>
<input type="hidden" name="hair" value="" id="hidden_hair"/>
<input type="hidden" name="mouth" value="" id="hidden_mouth"/>
<input type="hidden" name="glasses" value="" id="hidden_glasses"/>
<input type="submit" value="送信"/>
</form>
<!-- ▲▲=========送信ボタン=========▲▲ -->
	
</div>

			
				
				        <!-- #customize your modal window here -->
         <div id="setting_profdialog" class="window">
         
         <!-- close button is defined as close class -->
            <a href="#" class="close">Close it</a>
            
            <form name="class_make">
            <b>
            		<h2>クラス情報を入力してください。</h2><br />
            		<p>名前
            		<input type="text" name="name" size="15" maxlength="20" style="margin-left:100px;"/>
            		<input type="text" name="name" size="15" maxlength="20" style="margin-left:10px;"/>
            		</p><br />
            		
            		<p>生年月日
					<select id="month" style="margin-left:75px;"><option value="0">--</option></select>月
					<select id="day"><option value="0">--</option></select>日​
					</p><br />
            		
            		<p>性別
            		<input type="radio" name="sex" value="man" checked="checked" style="margin-left:100px;"/>男性
					<input type="radio" name="sex" value="woman"/>女性
            		</p><br />
            		
					<input type="submit" value="変更" class="class-make-button" style="margin-left:210px;"/>
            </b>
            </form>
            
         </div>
         <!-- Do not remove div#mask, because you'll need it to fill the whole screen -->
         <div id="mask"></div>

        </div>
   <jsp:include page="../include/include2.jsp" flush="true" />
</html>
