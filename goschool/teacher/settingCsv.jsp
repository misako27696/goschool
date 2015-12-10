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
   function disp(){

   	window.alert('アラートの表示');

   }

</script>
     
    </head>
    
    <jsp:include page="../include/includeheadteacher.jsp" flush="true" />
    	<div id="side-left"><p>>> 設定 - CSVの読み込み</p>
    		<jsp:include page="../include/include_teachersettingmenu.jsp" flush="true" />
    	</div>
    	
    	<div id="main">
        <br />

			<div class="box settingmail" style="text-align:center;"><br />
					
					<p style="font-size:25px;">招待した先生のメールアドレスを入力してください。</p><br />
					
				 <form action="" method="post" enctype="multipart/form-data">
						<p>
							<input type="file" name="datafile" style="font-size:15px;">
						</p>
						<br />
						<p>
							<input type="submit" value="読み込み" style="font-size:20px;" onClick="disp()">
						</p>
					</form>
					<br/><br/>
</div>
        </div>
   <jsp:include page="../include/include2.jsp" flush="true" />
</html>
