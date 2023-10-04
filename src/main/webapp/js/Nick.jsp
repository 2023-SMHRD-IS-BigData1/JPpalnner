<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>
	<%
	String email = request.getParameter("email");
	String img = request.getParameter("img");
	%>

	<form action="JoinService" method="post" id="joinForm">
		<table border="1">
			<tr>
				<th for="nick">닉네임</th>
				<td><input type="text" name="nick" id="nickInput"></td>
			</tr>
			<tr>
				<th></th>
				<td><button type="button" id="btn">아이디 중복확인</button>
				<p id="idcheck"></p></td>
				<td><input type="submit" value="닉네임 입력완료"
					></td>
			</tr>
		</table>
		<input type="hidden" name="email" id="emailInput" value="<%=email%>">
		<input type="hidden" name="img" id="imgInput" value="<%=img%>">
	</form>
	<div id="nickcheck"></div>
	
	
	<script type="text/javascript">
    $(document).ready(function() {
        // 초기에 버튼 비활성화
        $('#joinForm :input[type="submit"]').prop("disabled", true);

        $('#btn').on('click', function() {
            var nick = $('input[name=nick]').val();
            console.log("닉가져오기: " + nick);
            $.ajax({
                type: "POST", /* 어떤 방식으로 보낼지? */
                url: "NickcheckService", /* 어디로 보낼지? */
                data: {
                    nick: nick
                }, /* 어떤 데이터를 보낼지? */
                dataType: "text", /* 어떤 데이터 타입으로 받아올지? */
                success: function(data) {
                    console.log(data);
                    if (data == 'false') {
                        $('#nickcheck').html('사용불가능한 아이디입니다!');
                        // 아이디가 사용불가능할 때 버튼 비활성화
                        $('#joinForm :input[type="submit"]').prop("disabled", true);
                    } else if (data == 'true') {
                        $('#nickcheck').html('사용가능한 아이디입니다!');
                        // 아이디가 사용가능할 때 버튼 활성화
                        $('#joinForm :input[type="submit"]').prop("disabled", false);
                    }
                },
                error: function(e) {
                    // 에러 처리
                },
            });
        });
    });
</script>
	
	
</body>
</html>