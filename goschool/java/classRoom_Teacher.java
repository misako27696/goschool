import java.util.*;

public class Hiduke {
   public static void main(String[] args){
      //インスタンス化
      Calendar now = Calendar.getInstance(); 

      int y = now.get(now.YEAR);          //年を取得
      int m = now.get(now.MONTH) + 1;     //月を取得(※1)
      int d = now.get(now.DATE);          //日を取得

      //日付を表示
      System.out.println(y+"年"+m+"月"+d+"日");

      RequestDispatcher rd = req.getRequestDispatcher("../student/classRoom_Teacher.jsp");
		rd.forward(req, resp);
   }
}