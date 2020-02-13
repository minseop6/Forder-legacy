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
      .form-control{
        width: 30%;
      }
    </style>
  </head>
  <body>
    <jsp:include page="include.jsp" />

    <form action="menu" method="POST" enctype="multipart/form-data">
      <div class="form-group">
        <label class="col-sm-2 control-label">상품 이름</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="pname">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-2 control-label">가격</label>
        <div class="col-sm-10">
          <input type="text" class="form-control" name="price">
        </div>
      </div>
      <div class="form-group">
        <label>이미지 업로드</label>
        <input type="file" name="image">
      </div>
      <button type="submit" class="btn btn-default">등록</button>
    </form>
  </body>
</html>
