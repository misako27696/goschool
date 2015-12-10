<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>エラー - goschool</title>
	</head>
	<body>
		<center>
			<br><br>
			<Table Border="0">
				<Tr><Td></Td>
					<Td valign="bottom"><font size="6">エラー</font></Td>
				</Tr>
				<tr><Td colspan="2"></Td><Td>　　　　　　　　　　　　　</Td>
				</tr>
			</Table>
			<Table><Tr><Td colspan="2">
			<%= request.getAttribute("message") %></Td></Tr>
			<Tr><Td>　　　　　　　　　　</Td><Td>
			<a href="/goschool/">ログインへ</a></Td></Tr>
</Table>
		</center>
	</body>
</html>