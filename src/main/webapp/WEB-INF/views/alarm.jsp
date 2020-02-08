<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <style>
      .item{
        border: 1px solid black;
      }
    </style>
  </head>
  <body>
    <jsp:include page="include.jsp" />

    <c:forEach var="item" items="${list}">
      <div class="item">
        <label>${item.product.pname}</label>
        <label>${item.amount}개</label>
        <label>${item.product.price}원</label><br>
        <label>${item.otime}</label>
      </div>
    </c:forEach>
  </body>
</html>
