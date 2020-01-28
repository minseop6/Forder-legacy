<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  // var mapContainer = document.getElementById('map'), // 지도를 표시할 div
  //   mapOption = {
  //       // center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
  //       center: new kakao.maps.LatLng(37.6198612, 127.079471), // 지도의 중심좌표
  //       level: 3 // 지도의 확대 레벨
  //   };

  // HTML5의 geolocation으로 사용할 수 있는지 확인합니다
  if (navigator.geolocation) {
      // GeoLocation을 이용해서 접속 위치를 얻어옵니다
      navigator.geolocation.getCurrentPosition(function(position) {
          var lat = position.coords.latitude; // 위도
          var lan = position.coords.longitude; // 경도

          var locPosition = new kakao.maps.LatLng(lat, lan); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다

          var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(lat, lan), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

            // 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다
            var positions = [
              <c:forEach var="item" items="${list }">
          				  {
                      content: '<div><a href="/forder/store/${item.sno}">${item.name}</a>${item.category}</div>',
                      sno: ${item.sno},
                      latlng: new kakao.maps.LatLng(${item.lat}, ${item.lng})
                    },
          		</c:forEach>
            ];

            for (var i = 0; i < positions.length; i ++) {
              // 마커를 생성합니다
              var marker = new kakao.maps.Marker({
                  map: map, // 마커를 표시할 지도
                  position: positions[i].latlng // 마커의 위치
              });

              // 마커에 표시할 인포윈도우를 생성합니다
              var iwRemoveable = true;
              var infowindow = new kakao.maps.InfoWindow({
                  content: positions[i].content, // 인포윈도우에 표시할 내용
                  removable : iwRemoveable //인포 윈도우 닫기
              });

              // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
              // 이벤트 리스너로는 클로저를 만들어 등록합니다
              // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
              kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow));
            }

            // 인포윈도우를 표시하는 클로저를 만드는 함수입니다
            function makeClickListener(map, marker, infowindow) {
              return function() {
                  console.log(infowindow);
                  infowindow.open(map, marker);
              };
            }
        });
      }
</script>
