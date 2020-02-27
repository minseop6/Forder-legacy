<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <style media="screen">
      #orders{
        border: 1px solid black;
      }
    </style>
  </head>
  <body>
    <jsp:include page="include.jsp" />

    <h1>seller order</h1>
    <table id="orders">
      <thead>
        <tr>
          <th>주문번호</th>
          <th>주문내역</th>
          <th>주문시간</th>
          <th>주문자</th>
          <th>알림 발송</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="item" items="${ordersList}" varStatus="status">
          <c:if test="${ordersList[status.index].complete eq 0}">
            <tr id="${ordersList[status.index].ono}">
              <td>${ordersList[status.index].ono}</td>
              <td>${productList[status.index].pname} ${ordersList[status.index].amount}개</td>
              <td>${ordersList[status.index].otime}</td>
              <td>${userList[status.index].id}</td>
              <td>
                <c:if test="${ordersList[status.index].alarm eq 0}">
                  <button type="button" class="button">처리</button>
                </c:if>
                <c:if test="${ordersList[status.index].alarm eq 1}">
                  <button type="button" disabled>수령 대기중</button>
                </c:if>
              </td>
            </tr>
          </c:if>
        </c:forEach>
      </tbody>
    </table>
  </body>
</html>

<script>
  $('.button').click(function(){
    var ono = $(this).parent().parent().children().first().text();
    $.ajax({
      type: "POST",
      url: "/forder/seller/order",
      data:{
        "ono": ono,
      },
      success: function(ono){
        $('#orders').load(window.location.href+"#orders");
      }
    })
  })
</script>
