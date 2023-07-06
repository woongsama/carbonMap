<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>전체지도</title>
<link rel="stylesheet" href="https://openlayers.org/en/v6.5.0/css/ol.css" type="text/css">
<script src="https://openlayers.org/en/v6.5.0/build/ol.js"></script>
<!-- <script type="text/javascript" src="http://map.vworld.kr/js/vworldMapInit.js.do?apiKey=[B0D6B2D9-F984-3B92-9210-F4DD87B33B68]"></script> -->
</head>
<body>
  <div id="map" class="map" style="width:100%; height:100%"></div>

  	<script type="text/javascript">
  	
   
    // vworld
    var vworldApiKey = "B0D6B2D9-F984-3B92-9210-F4DD87B33B68";
    
    var desiredZoomLevel = 7;

    // 지도 생성
    var map = new ol.Map({
      target: 'map',
      layers: [
    	  
/*           new ol.layer.Tile({
              source: new ol.source.OSM() // OpenStreetMap as base layer
            }), */  
       
        new ol.layer.Tile({
            source: new ol.source.XYZ({
                url: "http://xdworld.vworld.kr:8080/2d/Base/201802/{z}/{x}/{y}.png",
                attributions: '<a href="http://www.vworld.kr/" target="_blank">vworld</a>',
                maxZoom: 19,
                apiKey: vworldApiKey, // API 키 설정
            }),
        }) 
      ],
      view: new ol.View({
    	projection:'EPSG:3857',
        center: ol.proj.fromLonLat([200.766922, 35.907757]), // 중심 좌표 (EPSG:3857)
        zoom: 7, 	// 초기 확대,축소 수준
        // 마우스 이동범위 제한
        extent: ol.proj.transformExtent([120, 30, 135, 40], 'EPSG:4326', 'EPSG:3857')
        								// [왼쪽, 아래, 오른쪽, 위] 높을수록 쫍게
      })
    });
    
    // 축소시 출력되는 범위 제한
    map.getView().on('change:resolution', function() {
        var currentZoomLevel = map.getView().getZoom();
        if (currentZoomLevel < desiredZoomLevel) {
            map.getView().setZoom(desiredZoomLevel);
        }
    });
  	</script>
	



</body>
</html>