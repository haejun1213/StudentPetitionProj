<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>찾아오시는 길</title>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=79ed8b8453472651b1de51022dfaadfb"></script>
    <style>
        /* 지도 스타일 */
        #map {
            width: 100%; /* 너비 100% */
            height: 500px; /* 높이 500px */
        }
    </style>
    <link rel="stylesheet" href="/StudentPetition/resources/css/layout.css"> <!-- 외부 CSS 파일 추가 -->
</head>

<body>
    
    <header>
        <jsp:include page="/jsp/include/topMenu.jsp" />
    </header>

    
    <section>
        <h1>찾아오시는 길</h1>

       <div id="map"></div>

    <script>
        // 지도를 생성할 div의 ID
        var mapContainer = document.getElementById('map');

        // 지도 옵션 설정
        var mapOption = { 
            center: new kakao.maps.LatLng(37.4591, 127.1534), // 초기 지도 중심 좌표 (서울 시청)
            level: 3 // 확대 레벨
        };

        // 지도 생성
        var map = new kakao.maps.Map(mapContainer, mapOption);

        // 마커 설정
        var markerPosition = new kakao.maps.LatLng(37.4591, 127.1534); // 마커 위치 (서울 시청)
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });
        marker.setMap(map); // 지도에 마커 표시
    </script>
    
    </section>

    <!-- 푸터 포함 -->
    <footer>
        <%@ include file="/jsp/include/footer.jsp" %>
    </footer>

</body>
</html>
