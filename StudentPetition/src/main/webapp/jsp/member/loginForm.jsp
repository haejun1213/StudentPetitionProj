<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/StudentPetition/resources/css/layout.css">
<script src="/StudentPetition/resources/js/jquery-3.7.1.min.js"></script>
<script src="/StudentPetition/resources/js/myJS.js"></script>
<c:choose>
	<c:when test="${ param.message eq 0 }">
		<script>
			alert("아이디 또는 비밀번호가 올바르지 않습니다.");
		</script>
	</c:when>
	<c:when test="${ param.message eq 1 }">
		<script>
			alert("비활성된 계정입니다.");
		</script>
	</c:when>
</c:choose>
<script>
   var script = document.createElement('script');
   script.src = "https://developers.kakao.com/sdk/js/kakao.min.js";
   script.async = true;
   document.head.appendChild(script);
   
   script.onload = function() {
       console.log('카카오 SDK 로드 성공');
       Kakao.init('79ed8b8453472651b1de51022dfaadfb');
   };
   
   script.onerror = function() {
       console.error('카카오 SDK 로드 실패');
   };
   
   
</script>

<script type="text/javascript">
function kakaoLogin() {
    Kakao.Auth.login({
        success: function(response) {
            console.log('로그인 성공:', response); // 성공 로그 추가
            Kakao.API.request({
                url: '/v2/user/me',
                success: function(response) {
                    console.log('사용자 정보 요청 성공:', response); // 사용자 정보 로그 추가
                    var userInfo = {
                        id: response.id,
                        nickname: response.properties.nickname,
                        email: response.kakao_account.email
                    };

                    // AJAX 요청으로 데이터를 전송
                    fetch('/StudentPetition/member/kakaoLogin.do', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded'
                        },
                        body: new URLSearchParams(userInfo)
                    })
                    .then(response => {
                        console.log('Fetch 성공:', response); // Fetch 성공 로그 추가
                        return response.text();
                    })
                    .then(data => {
                        console.log('서버 응답:', data); // 서버 응답 로그 추가
                        document.open();
                        document.write(data);
                        document.close();
                    })
                    .catch(error => {
                        console.error('Fetch 에러:', error); // Fetch 에러 로그 추가
                    });
                },
                fail: function(error) {
                    console.error('사용자 정보 요청 실패:', error); // 사용자 정보 요청 실패 로그 추가
                    alert(JSON.stringify(error));
                }
            });
        },
        fail: function(error) {
            console.error('로그인 실패:', error); // 로그인 실패 로그 추가
            alert(JSON.stringify(error));
        }
    });
}
</script>

<script>


	let checkForm = function() {

		let id = document.loginForm.id
		let password = document.loginForm.password

		if (checkBlacnk(id, "아이디를 입력해주세요")) {
			return false
		}

		if (checkBlacnk(password, "비밀번호를 입력해주세요")) {
			return false
		}

		return true
	}
</script>
</head>
<body>
	<header>
		<%@ include file="/jsp/include/topMenu.jsp"%>
	</header>
	<section class="login-section">
    <div id="login-container" class="form-container">
        <h2 class="form-title">로그인</h2>
        <form name="loginForm" id="login-form" class="form-content"
            action="login.do" method="post" onsubmit="return checkForm()">
            <label for="userId" class="form-label">아이디:</label> 
            <input type="text" id="userId" name="userId" class="form-input" required><br>
            <label for="password" class="form-label">비밀번호:</label> 
            <input type="password" id="password" name="password" class="form-input" required><br>

            <button type="submit" class="form-button">로그인</button>
        </form>

        <!-- 카카오 로그인 버튼 -->
        <div class="kakao-login-container">
            <button id="kakao-login-btn" onclick="kakaoLogin()" class="kakao-login-btn">
                <img src="/StudentPetition/resources/images/kakao_login_medium_narrow.png" alt="카카오톡 로그인">
            </button>
        </div>
    </div>
</section>


	<footer>
		<%@ include file="/jsp/include/footer.jsp"%>
	</footer>
</body>
</html>