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

    <h1>seller main</h1>
    <button type="button" id="enrollment">메뉴 등록</button>
    <button type="button" id="store">상점 관리</button>
    <button type="button" id="order">주문 관리</button>
  </body>
</html>

<script>
  $('#enrollment').click(function(){
    location.href = "/forder/seller/menu";
  })
  $('#store').click(function(){
    location.href = "/forder/seller/store";
  })
  $('#order').click(function(){
    location.href = "/forder/seller/order";
  })
</script>
