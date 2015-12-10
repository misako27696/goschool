<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <link rel="stylesheet" href="/goschool/css/index.css" type="text/css" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>卒検</title>
    </head>
    
    <body>
    
<!-- header -->
	<hgroup class="heading"><br>
		<h1 class="major"><img src="/goschool/img/Logo_beta.png" style="margin-right:50px;margin-bottom:-100px;"><br/></h1>
	</hgroup>

<!-- form starts here -->
	<form action="/goschool/main" method="post" class="sign-up" >
	
    	<h1 class="sign-up-title">Login</h1>
    	ユーザID
    	<input type="text" name="userid" class="sign-up-input" />
    	パスワード
    	<input type="password" name="userpw" class="sign-up-input" />
    	<input type="radio" name="classif" value="student" checked/> 学生
    	<input type="radio" name="classif" value="teacher"  /> 講師<br />
    	
 	   <br /><br />
    	<input type="submit" value="ログイン" class="sign-up-button" />
	
	</form>

    </body>
</html>
