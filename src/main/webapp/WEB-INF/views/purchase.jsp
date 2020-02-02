<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
    <jsp:include page="include.jsp" />

    <div id="container">
      <form action="index.html" method="post">
        <c:forEach var="item" items="${productList }">
          <div class="product">
            <label>제품명</label><input type="text" name="pname" value="${item.pname}" disabled>
            <label>가격</label><input type="text" name="price" value="${item.price}" disabled>
        </c:forEach>
        <c:forEach var="item" items="${purchase }">
            <label>수량</label><input type="text" name="amount" value="${item.amount}" disabled>
          </div>
        </c:forEach>
        <button type="submit">결제</button>
      </form>
    </div>
  </body>
</html>

<script>
<c:forEach var="item" items="${productList }">
  console.log('${item.pno}');
</c:forEach>
<c:forEach var="item" items="${purchase }">
  console.log('${item.amount}');
</c:forEach>
</script>
