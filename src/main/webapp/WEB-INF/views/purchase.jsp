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
      <form action="purchase" method="post">
        <c:forEach var="item" items="${productList}" varStatus="status">
          <%-- <c:if test="${purchase[status.index].amount ne 0}"> --%>
            <div class="product">
              <input type="hidden" name="pno" value="${productList[status.index].pno}">
              <label>제품명</label><input type="text" name="pname" value="${productList[status.index].pname}" readonly><br>
              <label>가격</label><input type="text" name="price" id="price${status.index}" value="${productList[status.index].price}" readonly><br>
              <label>수량</label><input type="text" name="amount" id="amount${status.index}" value="${purchase[status.index].amount}" readonly><br>
            </div>
          <%-- </c:if> --%>
        </c:forEach>
        <input type="text" id="total" readonly>
        <button type="submit">결제</button>
      </form>
    </div>
  </body>
</html>

<script>
var total = 0;
<c:forEach var="item" items="${productList}" varStatus="status">
  <c:if test="${purchase[status.index].amount ne 0}">
    total += $('#price${status.index}').val() * $('#amount${status.index}').val();
  </c:if>
</c:forEach>
$('#total').val(total + ' 원');
</script>
