<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
<link rel="stylesheet" type="text/css" href="/goschool/css/avater.css">
<title>Avatar_ajax</title>

<!-- ▼▼========パーツタブ切り替え処理=========▼▼ -->
<script type="text/javascript">
function ChangeTab(tabname) {
   // 全部消す
   document.getElementById('tab1').style.display = 'none';
   document.getElementById('tab2').style.display = 'none';
   document.getElementById('tab3').style.display = 'none';
   document.getElementById('tab4').style.display = 'none';
   // 指定箇所のみ表示
   document.getElementById(tabname).style.display = 'block';
}
</script>
<!-- ▲▲=========パーツタブ切り替え処理=========▲▲ -->

<!-- ▼▼========画像切り替え処理=========▼▼ -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.1/jquery.min.js" type="text/javascript" ></script>
<script>
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
</script>
<!-- ▲▲=========画像切り替え処理=========▲▲ -->

</head>
<body>
<h1>Avatar_ajax</h1>


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
	          <a href="/goschool/img/eye_kiritto.png" id="eye"><img class="select" src="/goschool/img/eye_kiritto.png" alt="1．キリット"></a>
	          <a href="/goschool/img/eye_lobo.png" id="eye"><img class="select" src="/goschool/img/eye_lobo.png" alt="2.ロボット"></a>
	          <a href="/goschool/img/eye_matuge.png" id="eye"><img class="select" src="/goschool/img/eye_matuge.png" alt="3.下まつげ"></a>
		      <a href="/goschool/img/eye_matuge.png" id="eye"><img class="select" src="/goschool/img/eye_mumu.png" alt="4.ムムッ"></a>
		      <a href="/goschool/img/eye_nikoniko.png" id="eye"><img class="select" src="/goschool/img/eye_nikoniko.png" alt="5.ニコニコ"></a>
		      <a href="/goschool/img/eye_nobita.png" id="eye"><img class="select" src="/goschool/img/eye_nobita.png" alt="6.のびた"></a>
		      <a href="/goschool/img/eye_pachikuri.png" id="eye"><img class="select" src="/goschool/img/eye_pachikuri.png" alt="7.ぱちくり"></a>
		      <a href="/goschool/img/eye_fujiko.png" id="eye"><img class="select" src="/goschool/img/eye_fujiko.png" alt="8.不二子"></a>
		      <a href="/goschool/img/eye_jitome.png" id="eye"><img class="select" src="/goschool/img/eye_jitome.png" alt="9.じと目"></a>
		      <a href="/goschool/img/eye_shoujo.png" id="eye"><img class="select" src="/goschool/img/eye_shoujo.png" alt="10.少女"></a>
		      <a href="/goschool/img/eye_sleep.png" id="eye"><img class="select" src="/goschool/img/eye_sleep.png" alt="11.眠い"></a>
		      <a href="/goschool/img/eye_takeshi.png" id="eye"><img class="select" src="/goschool/img/eye_takeshi.png" alt="12.タケシ"></a>
		      <a href="/goschool/img/eye_tibashiri.png" id="eye"><img class="select" src="/goschool/img/eye_tibashiri.png" alt="13.血走り"></a>
		      <a href="/goschool/img/eye_usodaro.png" id="eye"><img class="select" src="/goschool/img/eye_usodaro.png" alt="14.嘘だろ"></a>
		      <a href="/goschool/img/eye_yanderu.png" id="eye"><img class="select" src="/goschool/img/eye_yanderu.png" alt="15.病んでる"></a>
		      <a href="/goschool/img/eye_dragon.png" id="eye"><img class="select" src="/goschool/img/eye_dragon.png" alt="16.ドラゴン"></a>
		      <a href="/goschool/img/eye_dqn.png" id="eye"><img class="select" src="/goschool/img/eye_dqn.png" alt="17.DQN"></a>
		   </div>
		   <div id="tab2" class="tab">
		     <!-- ▼▼=========髪のパーツ=========▼▼ -->
		     <a href="/goschool/img/hair_shagii.png" id="hair"><img class="select" src="/goschool/img/hair_shagii.png" alt="1.シャギー"></a>
		     <a href="/goschool/img/hair_bob.png" id="hair"><img class="select" src="/goschool/img/hair_bob.png" alt="ボブ"></a>
		     <a href="/goschool/img/hair_longcarl.png" id="hair"><img class="select" src="/goschool/img/hair_longcarl.png" alt="ロングカール"></a>
		     <a href="/goschool/img/hair_maki.png" id="hair"><img class="select" src="/goschool/img/hair_maki.png" alt="マキちゃん"></a>
		     <a href="/goschool/img/hair_okappa.png" id="hair"><img class="select" src="/goschool/img/hair_okappa.png" alt="おかっぱ"></a>
		     <a href="/goschool/img/hair_pink.png" id="hair"><img class="select" src="/goschool/img/hair_pink.png" alt="ピンク"></a>
		   </div>
		   <div id="tab3" class="tab">
		      <!-- ▼▼=========口のパーツ=========▼▼ -->
		      <a href="/goschool/img/mouth_fujiko.png" id="mouth"><img class="select" src="/goschool/img/mouth_fujiko.png" alt="口"></a>
		      <a href="/goschool/img/mouth_jitome.png" id="mouth"><img class="select" src="/goschool/img/mouth_jitome.png" alt="口"></a>
		      <a href="/goschool/img/mouth_kiritto.png" id="mouth"><img class="select" src="/goschool/img/mouth_kiritto.png" alt="口"></a>
		      <a href="/goschool/img/mouth_lobo.png" id="mouth"><img class="select" src="/goschool/img/mouth_lobo.png" alt="口"></a>
		      <a href="/goschool/img/mouth_matsuge.png" id="mouth"><img class="select" src="/goschool/img/mouth_matsuge.png" alt="口"></a>
		      <a href="/goschool/img/mouth_mumu.png" id="mouth"><img class="select" src="/goschool/img/mouth_mumu.png" alt="口"></a>
		      <a href="/goschool/img/mouth_nikoniko.png" id="mouth"><img class="select" src="/goschool/img/mouth_nikoniko.png" alt="口"></a>
		      <a href="/goschool/img/mouth_nobita.png" id="mouth"><img class="select" src="/goschool/img/mouth_nobita.png" alt="口"></a>
		      <a href="/goschool/img/mouth_pachikuri.png" id="mouth"><img class="select" src="/goschool/img/mouth_pachikuri.png" alt="口"></a>
		      <a href="/goschool/img/mouth_sleep.png" id="mouth"><img class="select" src="/goschool/img/mouth_sleep.png" alt="口"></a>
		      <a href="/goschool/img/mouth_takeshi.png" id="mouth"><img class="select" src="/goschool/img/mouth_takeshi.png" alt="口"></a>
		      <a href="/goschool/img/mouth_usodaro.png" id="mouth"><img class="select" src="/goschool/img/mouth_usodaro.png" alt="口"></a>
		      <a href="/goschool/img/mouth_dqn.png" id="mouth"><img class="select" src="/goschool/img/mouth_dqn.png" alt="口"></a>
		      <a href="/goschool/img/mouth_dragon.png" id="mouth"><img class="select" src="/goschool/img/mouth_dragon.png" alt="口"></a>
		   </div>
		   <div id="tab4" class="tab">
		      <!-- ▼▼=========眼鏡のパーツ=========▼▼ -->
		      <a href="/goschool/img/blank.png" id="glasses"><img class="select" src="/goschool/img/blank.png" alt="1.空白"
		         style="background-image: url(&quot;/goschool/img/eye_blank.png&quot;);"></a>
		      <a href="/goschool/img/eye_round.png" id="glasses"><img class="select" src="/goschool/img/eye_round.png" alt="2.ラウンド"></a>
		      <a href="/goschool/img/eye_square.png" id="glasses"><img class="select" src="/goschool/img/eye_square.png" alt="3．スクウェア"></a>
		      <a href="/goschool/img/eye_wellington.png" id="glasses"><img class="select" src="/goschool/img/eye_wellington.png" alt="4．ウェリントン"></a>
		   </div>

	</div>
</div>
<script type="text/javascript">
   // デフォルトのタブを選択
   ChangeTab('tab1');
</script>
<!-- ▲▲=========アバターパーツ=========▲▲ -->


<div class="clear"></div>
<%out.println(new java.util.Date());%>
<!-- ▼▼=========送信ボタン=========▼▼ -->
<form method="post" action="<%= request.getContextPath()%>/Avatar_ajax">
<input type="hidden" name="eye" value="" id="hidden_eye">
<input type="hidden" name="hair" value="" id="hidden_hair">
<input type="hidden" name="mouth" value="" id="hidden_mouth">
<input type="hidden" name="glasses" value="" id="hidden_glasses">
<input type="submit" value="送信">
</form>
<!-- ▲▲=========送信ボタン=========▲▲ -->
</body>
</html>