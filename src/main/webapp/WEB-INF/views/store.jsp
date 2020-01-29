<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
      <style>
        .product{
          width: 100%;
          overflow: hidden;
        }
        .food{
          float: left;
          width:30%;
        }
        .btn-group{
          float: left;
        }
        .bottom{
          padding: 10px;
          width: 100%;
          position: absolute;
          bottom: 10%;
        }
        .order{
          width: 100%;
        }
      </style>
  </head>
  <body>
    <jsp:include page="include.jsp" />
    <div class="container">
      <c:forEach var="item" items="${list }">
        <div class="product">
          <img class="food" src="/static/img/product/${item.image}">
          <ul class="information">
            <li>${item.pname}</li>
            <li>${item.price}</li>
          </ul>
          <div class="btn-group" role="group">
            <button type="button" class="btn btn-default minus">-</button>
            <button type="button" id="${item.pno}" class="btn btn-default count" disabled>0</button>
            <button type="button" class="btn btn-default plus">+</button>
          </div>
        </div>
      </c:forEach>
    </div>

    <div class="bottom">
      <button type="button" class="btn btn-default order">주문하기</button>
    </div>
  </body>
</html>

<script>
  //수량 +
  $('.plus').click(function(){
    var casting = Number($(this).prev().text());
    var result = String(casting + 1);
    $(this).prev().text(result);
  })

  //수량 -
  $('.minus').click(function(){
    var casting = Number($(this).next().text());
    if(casting > 0){
      var result = String(casting - 1);
      $(this).next().text(result);
    }
  })

  $('.order').click(function(){
    var order = {};
    <c:forEach var="item" items="${list }">
      if($('#${item.pno}').text() != 0){
        console.log($('#${item.pno}').text())

        order.p${item.pno} = $('#${item.pno}').text();
        console.log(order);
      }
    </c:forEach>

    $.ajax({
      type: "GET",
      url: "/forder/purchase",
      contentType: 'application/json; charset=UTF-8',
      data: JSON.stringify(order),
      success: function(){
        alter('success');
      },
      error: function(){
        alert("fail")
      }
    })
  })
</script>
