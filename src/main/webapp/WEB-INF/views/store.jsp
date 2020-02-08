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

    <h1>${info.name}</h1>
    <form action="/forder/purchase" method="get">
      <div class="container">
        <c:set var="count" value="0" />
        <c:set var="add" value="1" />
        <c:forEach var="item" items="${list }">
          <div class="product">
            <img class="food" src="/static/img/product/${item.image}">
            <ul class="information">
              <li>${item.pname}</li>
              <li>${item.price}</li>
            </ul>
            <div class="group">
              <button type="button" class="btn btn-default minus">-</button>
              <input type="text" name="purchase[${count}].amount" value="0">
              <button type="button" class="btn btn-default plus">+</button>
              <input type="hidden" name="purchase[${count}].product.pno" value="${item.pno}">
            </div>
          </div>
          <c:set var="count" value="${count + add}" />
        </c:forEach>
      </div>

      <div class="bottom">
        <button type="submit" class="btn btn-default order">주문하기</button>
      </div>
    </form>
  </body>
</html>

<script>
  //수량 +
  $('.plus').click(function(){
    var num = $(this).prev().val();
    var result = Number(num) + 1;
    $(this).prev().val(result);
  })

  //수량 -
  $('.minus').click(function(){
    var num = $(this).next().val();
    if(num > 0){
      var result = Number(num) - 1;
      $(this).next().val(result);
    }
  })

</script>
