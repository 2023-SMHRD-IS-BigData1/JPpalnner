 $(document).ready(function() {
        // 초기에 버튼 비활성화
        $('#joinForm :input[type="submit"]').prop("disabled", true);

        $('#btn').on('click', function() {
            var id = $('input[name=id]').val();
            console.log("아이디가져오기: " + id);
            $.ajax({
                type: "POST", /* 어떤 방식으로 보낼지? */
                url: "IDcheckService", /* 어디로 보낼지? */
                data: {
                    id : id
                }, /* 어떤 데이터를 보낼지? */
                dataType: "text", /* 어떤 데이터 타입으로 받아올지? */
                success: function(data) {
                    console.log(data);
                    if (data == 'false') {
                        $('#idcheck')
                        alert('사용불가능한 아이디입니다');
                        // 아이디가 사용불가능할 때 버튼 비활성화
                        $('#joinForm :input[type="submit"]').prop("disabled", true);
                    } else if (data == 'true') {
                        $('#idcheck')
                        alert('사용가능한 아이디입니다');
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