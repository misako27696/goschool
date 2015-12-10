<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    
    <!-- CSS -->
	    <link href="/goschool/css/fullcalendar.min.css" rel="stylesheet" type="text/css">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>学校へいこう</title>

<!-- JavaScript -->
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
	<script type="text/javascript" src="../js/moment.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="../js/jquery-ui.custom.min.js"></script>
	<script type="text/javascript" src="../js/fullcalendar.min.js"></script>
	<script type="text/javascript" src="../js/ja.js"></script>
  



<script type="text/javascript">
	$(function(){
		$("#monthdown").click(function () {
			var m =parseInt($("#month").text(), 10);
			if(m==1){
				m=13;
				var y =parseInt($("#year1").text(), 10);
				y=y-1;
				$("#year1").text(y);
			}
			m=m-1;
			$("#month").text(m);
		});
	});
	$(function(){
		$("#monthup").click(function () {
			var m =parseInt($("#month").text(), 10);
			if(m==12){
				m=0;
				var y =parseInt($("#year1").text(), 10);
				y=y+1;
				$("#year1").text(y);
			}
			m=m+1;
			$("#month").text(m);
		});
	});
	$(function(){
		$("#yeardown").click(function () {
			var y =parseInt($("#year").text(), 10);
			y=y-1;
			$("#year").text(y);
		});
	});
	$(function(){
		$("#yearup").click(function () {
			var y =parseInt($("#year").text(), 10);
			y=y+1;
			$("#year").text(y);
		});
	});
	
	$(document).ready(function() {

		$('#calendar').fullCalendar({
			defaultDate: '2015-12-9',
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: [
				{
					title: '卒検発表',
					start: '2015-12-9'
				},
				{
					title: '学園祭',
					start: '2015-12-22',
					end: '2015-12-23'
				},
				/*{
					id: 999,
					title: 'Repeating Event',
					start: '2015-02-09T16:00:00'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2015-02-16T16:00:00'
				},
				{
					title: 'Conference',
					start: '2015-02-11',
					end: '2015-02-13'
				},
				{
					title: 'Meeting',
					start: '2015-02-12T10:30:00',
					end: '2015-02-12T12:30:00'
				},
				{
					title: 'Lunch',
					start: '2015-02-12T12:00:00'
				},
				{
					title: 'Meeting',
					start: '2015-02-12T14:30:00'
				},
				{
					title: 'Happy Hour',
					start: '2015-02-12T17:30:00'
				},
				{
					title: 'Dinner',
					start: '2015-02-12T20:00:00'
				},
				{
					title: 'Birthday Party',
					start: '2015-02-13T07:00:00'
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2015-02-28'
				}*/
			] 
		});
		
	});
	
</script>
	
	
	
</head>
<jsp:include page="../include/includeheadstudent.jsp" flush="true" />

<div id="side-left"><p>>> カレンダー</p>
        <div style="margin-left:30px;">
    </div>
        <br><br>
			<jsp:include page="../include/include_teachericon.jsp" flush="true" />
        </div>
        	<div id="main">
        	<br>
        		<div id="calendar"></div>
        		
        		
        	</div>
        	
        	        
<jsp:include page="../include/include2.jsp" flush="true" />
</html>
        					