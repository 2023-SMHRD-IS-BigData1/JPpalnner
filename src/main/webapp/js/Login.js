$(document).ready(function() {
    $('#loginForm').on('submit', function(event) {
        event.preventDefault(); // 기본 폼 제출 동작을 막음
        var id = $('input[name=id]').val();
        var pw = $('input[name=pw]').val();
        
        var encodedId = encodeURIComponent(id);
        
        console.log(encodedId);

        $.ajax({
            type: "POST",
            url: "LoginService",
            data: {
                id: encodedId,
                pw: pw
            },
            dataType: "json",
            success: function(data) {
                if (data.url == "Main.jsp") {
                    // 로그인 성공 시 Main.jsp로 이동
                    window.location.href = data.url + "?id=" + data.id + "&nick=" + data.nick;
                } else if (data.url == "Join.jsp") {
                    // 로그인 실패 시 서버에서 받은 메시지를 사용하여 알림창을 띄움
                    alert('로그인 실패: ' + data.message);
                }
            },
            error: function(e) {
                // 에러 처리
            },
        });
    });
});