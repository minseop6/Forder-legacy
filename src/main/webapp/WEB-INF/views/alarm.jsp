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

    <table>
      <thead>
        <tr>
          <th>상품명</th>
          <th>수량</th>
          <th>가격</th>
          <th>주문시간</th>
          <th>수령</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="item" items="${list}">
          <c:if test="${item.alarm eq 1 and item.complete eq 0}">
            <form action="alarm" method="POST">
                <input type="hidden" name="_method" value="PUT"/>
                <input type="hidden" name="ono" value="${item.ono}"/>
                <tr>
                  <td>${item.product.pname}</td>
                  <td>${item.amount}개</td>
                  <td>${item.product.price}원</td>
                  <td>${item.otime}</td>
                  <td><input type="submit" value="수령"></td>
                </tr>
            </form>
          </c:if>
        </c:forEach>
      </tbody>
    </table>
  </body>
</html>
