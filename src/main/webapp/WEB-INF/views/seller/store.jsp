<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

    <h1>Store Management</h1>
    <form action="store" method="post">
      <input type="hidden" name="_method" value="PUT" />
      <input type="hidden" name="sno" value="${store.sno}">
      <div class="form-group">
        <label class="col-sm-2 control-label">상점 이름</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="name" value="${store.name}">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-2 control-label">카테고리</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="category" value="${store.category}">
        </div>
      </div>
      <div class="form-group">
        <label>On/Off</label>
        <input type="checkbox" id="storeStatus" name="storeStatus" data-onstyle="success">
      </div>
      <button type="submit" class="btn btn-default">등록</button>
    </form>

    <h1>Product Management</h1>
    <form action="product" method="POST" enctype="multipart/form-data">
      <input type="hidden" name="_method" value="PUT" />
      <c:forEach var="item" items="${productList}">
        <div class="">
          <input type="hidden" name="pno" value="${item.pno}">
          <div class="form-group">
            <label class="col-sm-2 control-label">상품 이름</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="pname" value="${item.pname}">
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">가격</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="price" value="${item.price}">
            </div>
          </div>
          <div class="form-group">
            <label>On/Off</label>
            <input type="checkbox" id="${item.pno}" name="${item.pno}" data-onstyle="success">
          </div>
        </div>
      </c:forEach>
      <button type="submit" class="btn btn-default">등록</button>
    </form>
  </body>
</html>

<!-- bootstrap toggle -->
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<script>
  //store status
  if('${store.status}' == 1){
    $('#storeStatus').bootstrapToggle('on')
  }else{
    $('#storeStatus').bootstrapToggle('off')
  }

  //products status
  <c:forEach var="item" items="${productList}">
    if('${item.status}' == 1){
      $('#${item.pno}').bootstrapToggle('on')
    }else{
      $('#${item.pno}').bootstrapToggle('off')
    }
  </c:forEach>
</script>
