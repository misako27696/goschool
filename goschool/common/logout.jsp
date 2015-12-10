<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ログアウト - 学校へ行こう！！</title>
</head>
<body>
<center>
<br><br>

<Table Border="0">
<Tr><Td> </Td>
	<Td valign="bottom"><img src="/goschool/img/Logo_beta.png" style="margin-left:100px;"></Td>
</Tr>
<Tr><Td colspan="2"></Td><Td>　　　　　　　　　　　　　</Td>
</Tr>
</Table>

<Table>
<Tr><Td colspan="2" style="font-size:20px;"><%= request.getAttribute("message") %></Td></Tr>
<Tr><Td>　　　　　　　　　　</Td><Td style="font-size:20px;"><a href="/goschool">ログインへ</a></Td></Tr>
</Table>

</center>
</body>
</html>