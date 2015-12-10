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
    </head>
    
   <jsp:include page="../include/includeheadteacher.jsp" flush="true" />
    	<div id="side-left">>> プロフィール登録</div>
    	<div id="main">
        <br>

            <div id="proentry">
                プロフィールを入力してください。<br><br>

                
                名前　　　　　　<input type="text" name="first" size="15">　<input type="text" name="last" size="15"><br><br>
                生年月日　　　　<select name="month" style="width:90px">
                            　  <option value="">--</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                               </select>
                                月 
                                <select name="day" style="width:90px">
                                <option value="">--</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>
                                <option value="31">31</option>
                                </select>
                                日<br><br>

                性別　　　　　　<input type="radio" name="man" value="はい" checked> 男性
                            　<input type="radio" name="woman" value="いいえ"> 女性
                            <br><br>

                            <input type="submit" value="登録" class="profcheckbtn">

            </div>
                

        </div>
    <jsp:include page="../include/include2.jsp" flush="true" />
</html>
