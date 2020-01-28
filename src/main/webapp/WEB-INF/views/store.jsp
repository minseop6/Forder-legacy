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
          <div class="btn-group" role="group" aria-label="...">
            <button type="button" class="btn btn-default">-</button>
            <button type="button" class="btn btn-default" disabled>0</button>
            <button type="button" class="btn btn-default">+</button>
          </div>
        </div>
      </c:forEach>
    </div>
  </body>
</html>
