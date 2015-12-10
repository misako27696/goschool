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
  
</script>
     
    </head>
    
    <jsp:include page="../include/includeheadteacher.jsp" flush="true" />
    	<div id="side-left"><p>>> 設定 - クラス情報</p>
    		<jsp:include page="../include/include_teachersettingmenu.jsp" flush="true" />
    	</div>
    	
    	<div id="main">
        <br />

			<div class="box settingmail" style="text-align:center;"><br />
					
					<p style="font-size:25px;">変更するクラス情報を入力し直してください。</p><br />
					
				 <form action="" method="post" enctype="multipart/form-data">
				 
				 <p>学校名<input type="text" name="name" size="30" maxlength="20" style="margin-left:100px;">
            		</p>
            		
            		<p>担任名<input type="text" name="name" size="30" maxlength="20" style="margin-left:100px;">
            		</p>
            		
            		<p>副担任<input type="text" name="name" size="30" maxlength="20" style="margin-left:100px;">
            		</p>
            		
            		<p>クラスの名前<input type="text" name="name" size="30" maxlength="20" style="margin-left:60px;">
            		</p>
            		
            		<p style="margin-right:135px;">現在の年次<select id="language" name="language" style="margin-left:72px;">
						<option value="en" selected>1</option>
						<option value="de">2</option>
						<option value="fr">3</option>
					</select> 年</p>
									
					<p style="margin-right:120px;">学期数<select id="language" name="language" style="margin-left:97px;">
						<option value="en" selected>2学期制</option>
						<option value="de">3学期制</option>
					</select></p>
					
					<p style="margin-right:150px;">入学年
					<select id="language" name="language" style="margin-left:97px;">
						
						年
					</select></p>
					
					<p style="margin-left:20px;">年間総授業数
					<input type="text" value="150" name="name" size="30" maxlength="20" style="margin-left:60px;">
						日</p>
					
					<p style="margin-left:20px;">総授業料
					<input type="text" value="290000" name="name" size="30" maxlength="20" style="margin-left:85px;">
					円</p>
					<br />
					<input type="submit" value="クラスの情報を変更する" class="class-make-button" />
            </b>
						


					</form>
					<br/><br/>
					
</div>
        </div>
   <jsp:include page="../include/include2.jsp" flush="true" />
</html>
