/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.8
 * Generated at: 2015-10-26 09:08:48 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.teacher;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.text.*;

public final class classRoom_005fTeacher_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\n");
      out.write("    <head>\n");
      out.write("    <link rel=\"stylesheet\" href=\"../css/main.css\" type=\"text/css\" />\n");
      out.write("\n");
      out.write("\t<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>学校へ行こう！！</title>\n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../include/include1.jsp", out, true);
      out.write("\n");
      out.write("        \n");
      out.write("        \n");
      out.write("    \t<div id=\"side-left\">>> クラスルーム<br><br>\n");
      out.write("        <input type=\"button\" value=\"今日の出席状況を入力\" class=\"attendancebtn\" style=\"width:250px\">\n");
      out.write("        <input type=\"button\" value=\"クラス変更\" class=\"classchangebtn\" style=\"width:250px\">\n");
      out.write("        <br><br>\n");
      out.write("\n");
      out.write("        <div class=\"question_Box\">\n");
      out.write("        <div class=\"question_image\">\n");
      out.write("        <img src=\"../img/teacher_man_fin.png\" height=\"280\" width=\"150\" alt=\"\"></div>\n");
      out.write("            <div class=\"arrow_question\">\n");
      out.write("            \t<div class=\"oneword\">\n");
      out.write("                ");

      				GregorianCalendar cal = new GregorianCalendar();
      				SimpleDateFormat format = new SimpleDateFormat("yyyy年M月d日");
      				String datestr = format.format(cal.getTime());
      				out.println( datestr );
    			
      out.write("\n");
      out.write("    \t\t\t</div>\n");
      out.write("                \n");
      out.write("            </div><!-- /.arrow_question -->\n");
      out.write("        </div><!-- /.question_Box -->\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("    \t<div id=\"main\">\n");
      out.write("\t\t\t<div id=\"class_atend\">\n");
      out.write("\t\t\t<form action=\"/goschool/classroomteacher\" method=\"POST\">\n");
      out.write("\t\t\t\t<input type=\"week\" id=\"calender\">　<!-- ←空白あり消さないで -->\n");
      out.write("\t\t\t\t<input type=\"submit\" value=\"変更\" name=\"selectweek\" style=\"width:100px\">\n");
      out.write("\t\t\t</form>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t\t<br>\n");
      out.write("\t\t\t\t<table class=\"atend_head\">\n");
      out.write("\t\t\t\t\t    <tbody>\n");
      out.write("\t\t\t\t\t        <tr>\n");
      out.write("\t\t\t\t\t            <th>\n");
      out.write("\t\t\t\t\t            \t日にち\n");
      out.write("\t\t\t\t\t            </th>\n");
      out.write("\t\t\t\t\t            <td class=\"data\">\n");
      out.write("\t\t\t\t\t                届出欠席\n");
      out.write("\t\t\t\t\t            </td>\n");
      out.write("\t\t\t\t\t            <td class=\"data\">\n");
      out.write("\t\t\t\t\t                無届欠席\n");
      out.write("\t\t\t\t\t            </td>\n");
      out.write("\t\t\t\t\t            <td class=\"data\">\n");
      out.write("\t\t\t\t\t                遅刻\n");
      out.write("\t\t\t\t\t            </td>\n");
      out.write("\t\t\t\t\t            <td class=\"data\">\n");
      out.write("\t\t\t\t\t                欠課\n");
      out.write("\t\t\t\t\t            </td>\n");
      out.write("\t\t\t\t\t            <td class=\"data\">\n");
      out.write("\t\t\t\t\t                早退\n");
      out.write("\t\t\t\t\t            </td>\n");
      out.write("\t\t\t\t\t            <td class=\"data\">\n");
      out.write("\t\t\t\t\t                記入者\n");
      out.write("\t\t\t\t\t            </td>\n");
      out.write("\t\t\t\t\t        </tr>\n");
      out.write("\t\t\t\t\t    </tbody>\n");
      out.write("\t\t\t\t\t</table><br>\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t");
for (int count = 0; count < 7; count++) 
					{
      out.write("\n");
      out.write("\t\t\t\t\t<table class=\"atend_date\">\n");
      out.write("\t\t\t\t\t    <tbody>\n");
      out.write("\t\t\t\t\t        <tr>\n");
      out.write("\t\t\t\t\t            <th>\n");
      out.write("\t\t\t\t\t            \t");
      out.print( request.getAttribute("date"+count) );
      out.write("\n");
      out.write("\t\t\t\t\t            </th>\n");
      out.write("\t\t\t\t\t            <td class=\"data\">\n");
      out.write("\t\t\t\t\t                ");
      out.print( request.getAttribute("absence_notice"+count) );
      out.write("\n");
      out.write("\t\t\t\t\t            </td>\n");
      out.write("\t\t\t\t\t            <td class=\"data\">\n");
      out.write("\t\t\t\t\t                ");
      out.print( request.getAttribute("absence_withoutnotice"+count) );
      out.write("\n");
      out.write("\t\t\t\t\t            </td>\n");
      out.write("\t\t\t\t\t            <td class=\"data\">\n");
      out.write("\t\t\t\t\t                ");
      out.print( request.getAttribute("late"+count) );
      out.write("\n");
      out.write("\t\t\t\t\t            </td>\n");
      out.write("\t\t\t\t\t            <td class=\"data\">\n");
      out.write("\t\t\t\t\t                ");
      out.print( request.getAttribute("absence_class"+count) );
      out.write("\n");
      out.write("\t\t\t\t\t            </td>\n");
      out.write("\t\t\t\t\t            <td class=\"data\">\n");
      out.write("\t\t\t\t\t                ");
      out.print( request.getAttribute("leaves_early"+count) );
      out.write("\n");
      out.write("\t\t\t\t\t            </td>\n");
      out.write("\t\t\t\t\t            <td class=\"data2\">\n");
      out.write("\t\t\t\t\t                ");
      out.print( request.getAttribute("addname"+count) );
      out.write("\n");
      out.write("\t\t\t\t\t            </td>\n");
      out.write("\t\t\t\t\t        </tr>\n");
      out.write("\t\t\t\t\t    </tbody>\n");
      out.write("\t\t\t\t\t</table><br>\n");
      out.write("\t\t\t\t\t");
 } 
      out.write("\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t<div id=\"class_timetable\">\n");
      out.write("\t\t\t<br>\n");
      out.write("\t\t\t<table class=\"atend_timetable\">\n");
      out.write("\t\t\t\t\t    <tbody>\n");
      out.write("\t\t\t\t\t        <tr>\n");
      out.write("\t\t\t\t\t            <th>月</th>\n");
      out.write("\t\t\t\t\t            <th>火</th>\n");
      out.write("\t\t\t\t\t            <th>水</th>\n");
      out.write("\t\t\t\t\t            <th>木</th>\n");
      out.write("\t\t\t\t\t            <th>金</th>\n");
      out.write("\t\t\t\t\t        </tr>\n");
      out.write("\t\t\t\t\t ");
for (int count = 0; count < 7; count++) 
					{
      out.write("\n");
      out.write("\t\t\t\t\t        <tr>\n");
      out.write("\t\t\t\t\t            <td class=\"data\">\n");
      out.write("\t\t\t\t\t                \n");
      out.write("\t\t\t\t\t            </td>\n");
      out.write("\t\t\t\t\t            <td class=\"data\">\n");
      out.write("\t\t\t\t\t                \n");
      out.write("\t\t\t\t\t            </td>\n");
      out.write("\t\t\t\t\t            <td class=\"data\">\n");
      out.write("\t\t\t\t\t                \n");
      out.write("\t\t\t\t\t            </td>\n");
      out.write("\t\t\t\t\t            <td class=\"data\">\n");
      out.write("\t\t\t\t\t                \n");
      out.write("\t\t\t\t\t            </td>\n");
      out.write("\t\t\t\t\t            <td class=\"data\">\n");
      out.write("\t\t\t\t\t                \n");
      out.write("\t\t\t\t\t            </td>\n");
      out.write("\t\t\t\t\t        </tr>\n");
      out.write("\t\t\t\t\t    ");
 } 
      out.write("\n");
      out.write("\t\t\t\t\t    </tbody>\n");
      out.write("\t\t\t\t\t</table>\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t<div id=\"class_roster\">\n");
      out.write("\t\t\t\t\t<table class=\"atend_roster\">\n");
      out.write("\t\t\t\t\t    <tbody>\n");
      out.write("\t\t\t\t\t        <tr>\n");
      out.write("\t\t\t\t\t            <th>出席番号</th>\n");
      out.write("\t\t\t\t\t            <th>氏名</th>\n");
      out.write("\t\t\t\t\t        </tr>\n");
      out.write("\t\t\t\t\t ");
for (int num = 0; num <=50; num++) 
					{
      out.write("\n");
      out.write("\t\t\t\t\t        <tr>\n");
      out.write("\t\t\t\t\t            <td class=\"data\">\n");
      out.write("\t\t\t\t\t              ");
      out.print( num );
      out.write("\n");
      out.write("\t\t\t\t\t            </td>\n");
      out.write("\t\t\t\t\t            <td class=\"data2\">\n");
      out.write("\t\t\t\t\t                前田吉輝\n");
      out.write("\t\t\t\t\t            </td>\n");
      out.write("\t\t\t\t\t        </tr>\n");
      out.write("\t\t\t\t\t    ");
 } 
      out.write("\n");
      out.write("\t\t\t\t\t    </tbody>\n");
      out.write("\t\t\t\t\t</table>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t</div>\n");
      out.write("        </div>\n");
      out.write("    ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../include/include2.jsp", out, true);
      out.write("\n");
      out.write("</html>\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
