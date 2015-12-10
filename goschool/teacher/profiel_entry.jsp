<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <link rel="stylesheet" href="/goschool/css/main.css" type="text/css" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>卒検</title>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
<script type="text/javascript">

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
    	<div id="side-left">>> プロフィール登録</div>
    	<div id="main">
        <br>

            <div id="proentry">
                プロフィールを入力してください。<br><br>

                
                名前　　　　　　<input type="text" name="first" size="15">　<input type="text" name="last" size="15">
                <br /><br />
                生年月日　　　　<select id="month" style="margin-left:75px;"><option value="0">--</option></select>月
					<select id="day"><option value="0">--</option></select>日​
                                <br><br>

                性別　　　　　　<input type="radio" name="man" value="はい" checked> 男性
                            　<input type="radio" name="woman" value="いいえ"> 女性
                            <br><br>

                            <input type="submit" value="確認" class="profcheckbtn">

            </div>
                

        </div>
   <jsp:include page="../include/include2.jsp" flush="true" />
</html>
