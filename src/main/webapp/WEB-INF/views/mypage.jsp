<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <!-- Kakao -->
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  </head>
  <body>
    <jsp:include page="include.jsp" />
    <c:if test='${empty session}'>
      <a id="kakao-login-btn"></a>
      <a href="http://developers.kakao.com/logout"></a>
    </c:if>
    <c:if test='${session}'>
      <h1>${session}</h1>
    </c:if>
  </body>
</html>

<script>
<c:if test='${empty session}'>
  // 사용할 앱의 JavaScript 키를 설정해 주세요.
  Kakao.init('a7462a3c5074c7223a0efc1b182f553d');
  // 카카오 로그인 버튼을 생성합니다.
  Kakao.Auth.createLoginButton({
    container: '#kakao-login-btn',
    success: function(authObj) {
      Kakao.API.request({
        url: '/v1/user/me',
        success: function(res) {
          console.log(res.id); //id 정보 출력
          console.log(res.properties.nickname); //닉네임 출력
          console.log(authObj.access_token); //토큰값 출력
          $.post("/forder/kakaoLogin", {
            name: res.properties.nickname,
            token: authObj.access_token
          })
          location.href="/forder/"
       }
      })
    },
    fail: function(err) {
       alert(JSON.stringify(err));
    }
  });
</c:if>
</script>
