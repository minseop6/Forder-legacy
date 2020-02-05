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

    <form action="signup" method="POST">
      <div class="form-group">
        <label>ID</label>
        <input type="text" class="form-control" name="id" placeholder="ID">
      </div>
      <div class="form-group">
        <label>PW</label>
        <input type="password" class="form-control" name="pw" placeholder="PW">
      </div>
      <div class="form-group">
        <label>NAME</label>
        <input type="text" class="form-control" name="name" placeholder="NAME">
      </div>
      <button type="submit" class="btn btn-default">SIGN UP</button>
    </form>
  </body>
</html>
