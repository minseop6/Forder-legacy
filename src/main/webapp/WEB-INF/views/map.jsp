<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
    <!-- Daum map API -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a7462a3c5074c7223a0efc1b182f553d"></script>

    <style>
      body, html{
        height: 100%;
      }
      #map{
        width: 80%;
        height: 75%;
        margin:0 auto;
      }
    </style>
  </head>
  <body>
    <jsp:include page="include.jsp" />
    <div id="map"></div>
  </body>
</html>

<script>
  var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
  var options = { //지도를 생성할 때 필요한 기본 옵션
  center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
  level: 3 //지도의 레벨(확대, 축소 정도)
  };

  var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

  // 마커를 표시할 위치와 title 객체 배열입니다
  var positions = [
      {
          title: 'TEST',
          latlng: new kakao.maps.LatLng(33.450605, 126.570677)
      },
      {
          title: '카카오',
          latlng: new kakao.maps.LatLng(33.450705, 126.570677)
      },
      {
          title: '생태연못',
          latlng: new kakao.maps.LatLng(33.450936, 126.569477)
      },
      {
          title: '텃밭',
          latlng: new kakao.maps.LatLng(33.450879, 126.569940)
      },
      {
          title: '근린공원',
          latlng: new kakao.maps.LatLng(33.451393, 126.570738)
      }
  ];

  // 마커 이미지의 이미지 주소입니다
  var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

  for (var i = 0; i < positions.length; i ++) {

      // 마커 이미지의 이미지 크기 입니다
      var imageSize = new kakao.maps.Size(24, 35);

      // 마커 이미지를 생성합니다
      var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

      // 마커를 생성합니다
      var marker = new kakao.maps.Marker({
          map: map, // 마커를 표시할 지도
          position: positions[i].latlng, // 마커를 표시할 위치
          title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
          image : markerImage // 마커 이미지
      });
  }


  kakao.maps.event.addListener(marker, 'click', function() {
    console.log(marker);
    alert(marker);
  });
</script>
