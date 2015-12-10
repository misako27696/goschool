<%@page contentType="text/html" %>
<%@page pageEncoding="UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="java.text.*" %>

<div class="question_Box">
        <div class="question_image">
        <img src="/goschool/img/teacher_man_fin.png" height="280" width="150" alt="" /></div>
            <div class="arrow_question">
            	<div class="oneword">
                
                <%
      				GregorianCalendar cal = new GregorianCalendar();
      				SimpleDateFormat format = new SimpleDateFormat("yyyy年M月d日");
      				String datestr = format.format(cal.getTime());
      				out.println( datestr );
    			%>
    			
    			<p style="font-size:15px;">今日も１日頑張ろう</p>
    			</div>
                
            </div><!-- /.arrow_question -->
        </div><!-- /.question_Box -->