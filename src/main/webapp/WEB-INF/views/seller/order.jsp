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

    <h1>seller order</h1>
    <c:forEach var="item" items="${ordersList}">
      ${item.ono}
      ${item.otime}
    </c:forEach>
    <c:forEach var="item" items="${userList}">
      ${item.id}
    </c:forEach>
  </body>
</html>
