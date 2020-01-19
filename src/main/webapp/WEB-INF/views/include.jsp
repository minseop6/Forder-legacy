<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
    <!-- bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <style>
      #header {
        height: 100px;
        width: 100%;
        padding: 1rem;
        font-weight: bold;
        justify-content: space-between;
      }
      #footer {
        position: fixed;
        bottom: 0;
        width: 100%;
       }
       #title{
         text-align: center;
         font-size: 100px;
       }
       .icon{
         width: 18%;
       }
    </style>
  </head>
  <body>
    <div id="header">
      <h1 id="title">FORDER</h1>
    </div>
    <div id="footer">
      <a href="/forder"><img class="icon" src="/static/img/icon-home.png"></a>
      <a href="/forder/alarm"><img class="icon" src="/static/img/icon-alarm.png"></a>
      <a href="/forder/map"><img class="icon" src="/static/img/icon-map.png"></a>
      <a href="/forder/like"><img class="icon" src="/static/img/icon-like.png"></a>
      <a href="/forder/user"><img class="icon" src="/static/img/icon-user.png"></a>
    </div>
  </body>
</html>
