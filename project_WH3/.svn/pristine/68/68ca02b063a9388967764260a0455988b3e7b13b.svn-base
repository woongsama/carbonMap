<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>시도 전체 지도</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="https://openlayers.org/en/v6.5.0/css/ol.css" type="text/css">
<script src="https://openlayers.org/en/v6.5.0/build/ol.js"></script>
<!-- <script type="text/javascript" src="http://map.vworld.kr/js/vworldMapInit.js.do?apiKey=[B0D6B2D9-F984-3B92-9210-F4DD87B33B68]"></script> -->
<style>
.legend{
	position:absolute;
	right:30px;
	bottom:30px;
	width:200px;
	height:200px;
	border: 1px solid black;
	border-top:none;
	border-right:none;
	border-left:none;
	border-bottom:none;
	z-index: 2;
}
.title{
	height: 20%;
	background-color: white;
	border: 1px solid black;
	box-sizing:border-box;
	display: flex;
  	justify-content: center;
  	align-items: center;
}
.content{
	height:80%;
	box-sizing:border-box;
}
.pop_legend{
	display:flex;
	height:32px;
	border: 1px solid black;
	border-top:none;
	border-right:none;
	border-left:none;
	border-bottom:none;
	box-sizing:border-box;
}
.col_num1{
	background-color: white;
	flex-basis:20%;
	border: 1px solid black;
	border-top:none;
	box-sizing:border-box;
	display: flex;
	justify-content: center;
  	align-items: center;
}
.col_num2{
	background-color: white;
	flex-basis:80%;
	border: 1px solid black;
	border-top:none;
	border-left:none;
	box-sizing:border-box;
	display: flex;
	justify-content: center;
  	align-items: center;
  	font-size: 0.8vw;
}

  .ol-popup {
  	display: flex;
  	justify-content: center;
  	align-items: center;
    background-color: white;
    box-shadow: 0 1px 4px rgba(0,0,0,0.2);
    border-radius: 5px;
    font-size: 14px;
    width:250px;
    height:50px;
  }

  .ol-popup-closer {
    top: 2px;
    right: 8px;
    color: #bababa;
    font-size: 16px;
    font-weight: bold;
    text-decoration: none;
    position: absolute;
  }
  .ol-popup-closer:after {
    content: "✖";
  }
</style>
</head>
<body>

  <div id="map" class="map" style="width:100%; height:100%; position:relative; z-index: 1;">
  	<div class="legend">
  		<div class="title" style="text-align:center;">
  			<c:choose>
  			<c:when test="${legend_type eq 'natural'}">
  			<!-- 범례 (자연 구간) -->
  			범례 (단위:tonCO2eq)
  			</c:when>
  			<c:when test="${legend_type eq 'equal'}">
  			<!-- 범례 (등간격) -->
  			범례 (단위:tonCO2eq)
  			</c:when>
  			</c:choose>
  		</div>
  		<div class="content">
  		<c:forEach var="jenksbins_list" items="${jenksbins }" varStatus="loop">
  			<div class="pop_legend">
  				<div class="col_num1" style="background-color: ${backgroundColor[loop.index] }">
  				</div>
  				<div class="col_num2">
  				${jenksbins_list }
  				</div>
  			</div>
		</c:forEach>
		</div>
  	</div>
  </div>
  
  <!-- geoserver 리턴 데이터 확인용 
  <div id="info"></div>
  -->
  
  <!-- 팝업 출력 -->
  <div id="popup" class="ol-popup">
  	<a href="#" id="popup-closer" class="ol-popup-closer"></a>
  	<div id="popup-content"></div>
  </div>

  	<script type="text/javascript">
  	
 	// GeoServer WMS URL
    var wmsUrl = 'http://localhost:9080/geoserver/wms';
  	
  	var legend_type = '${legend_type}';
  	
  	if(legend_type == 'natural'){
    	// 레이어 이름
    	var search_layerName = 'carbon:view_carbon_sd_all';
  	}else{
  		var search_layerName ='carbon:view_carbon_sd_all_equal';
  	}
   
    // vworld
    var vworldApiKey = "B0D6B2D9-F984-3B92-9210-F4DD87B33B68";
    
    var container = document.getElementById('popup');
    var content = document.getElementById('popup-content');
    var closer = document.getElementById('popup-closer');
    
    
    
    // 지도 생성
    var map = new ol.Map({
      target: 'map',
      layers: [
       
        new ol.layer.Tile({
            source: new ol.source.XYZ({
                url: "http://xdworld.vworld.kr:8080/2d/Base/201802/{z}/{x}/{y}.png",
                attributions: '<a href="http://www.vworld.kr/" target="_blank">vworld</a>',
                maxZoom: 19,
                apiKey: vworldApiKey, // API 키 설정
            }),
        }),
        
        new ol.layer.Tile({
            source: new ol.source.TileWMS({
              url: wmsUrl,
              params: {
                'LAYERS': search_layerName,
                'TILED': true
              },
              serverType: 'geoserver',
              transition: 0
            }),
           opacity: 0.7
          })
      ],
      view: new ol.View({
    	projection:'EPSG:3857',
        center: ol.proj.fromLonLat([127.766922, 35.907757]), // 중심 좌표 (EPSG:3857)
        zoom: 7,
        extent: ol.proj.transformExtent([120, 30, 135, 40], 'EPSG:4326', 'EPSG:3857')
		// [왼쪽, 아래, 오른쪽, 위] 높을수록 쫍게
      })
    });
    
    // 출력되는 범위 제한
    map.getView().on('change:resolution', function() {
        var currentZoomLevel = map.getView().getZoom();
        if (currentZoomLevel < desiredZoomLevel) {
            map.getView().setZoom(desiredZoomLevel);
        }
    });
    
    // geoserver 정보 추출(getfeatureInfo)
    var geoTile = new ol.layer.Tile({
    	source: new ol.source.TileWMS({
    		url:'http://localhost:9080/geoserver/wms',
    		params:{
                'tiled': true,
                "LAYERS": search_layerName,
                'propertyName': 'sd_usage' // 필터링할 컬럼 이름
    		},
    		serverType: 'geoserver',
    	})
    });
    
    map.on('singleclick', function(evt) {
        var view = map.getView();
        var viewResolution = view.getResolution();
        var source = geoTile.getSource();
        var url = source.getFeatureInfoUrl(
            evt.coordinate, viewResolution, view.getProjection(), {
                'INFO_FORMAT': 'text/html',
                'FEATURE_COUNT': 50
            });
        if (url) {
            fetch(url)
              .then((response) => response.text())
              .then((html) => {
            	  var parser = new DOMParser();
            	  var doc = parser.parseFromString(html, 'text/html');
            	  var table = doc.querySelector('table'); // 결과 테이블 요소 선택
            		if (table) {
            			var targetRowIndex = 1; // 추출할 행 인덱스 (0부터 시작)
            			var targetColumnIndex = 1; // 추출할 열 인덱스 (0부터 시작)
            			var rows = table.getElementsByTagName('tr');
            			if (rows.length > targetRowIndex) {
            				var cells = rows[targetRowIndex].getElementsByTagName('td');
            	    		if (cells.length > targetColumnIndex) {
            	    			var cellValue = cells[targetColumnIndex].textContent;
            	        		console.log(cellValue); // 2행 2열의 데이터 출력
            	        		var replacedValue = cellValue.replace(/\B(?=(\d{3})+(?!\d))/g, ',');
            	        		if(cellValue.trim() !==""){
//                  				document.getElementById('info').innerHTML = html;
                    				content.innerHTML = "탄소배출량: "+replacedValue+" tonCO2eq";			// 팝업창 안에 들어갈 내용
                    				var coordinate = evt.coordinate;
                    				overlay.setPosition(coordinate);
                	        		}else{
                	        			// 데이터가 없는 경우 팝업 닫기
                	        			overlay.setPosition(undefined);
                	        		}
                	    		}
                			}
               			}
                  });
            }else{ 
            // if(url) end
            // 데이터가 없는 경우 팝업 닫기
    	    overlay.setPosition(undefined);
            }
        });
    
    var overlay = new ol.Overlay({
        element: container,
        autoPan: true,
        autoPanAnimation: {
          duration: 250
        }
      });
      map.addOverlay(overlay);
      
      closer.onclick = function() {
    	    overlay.setPosition(undefined);
    	    closer.blur();
    	    return false;
    	  };
    

    
 /*	//팝업 출력 코드   
    var overlay = new ol.Overlay({
        element: container,
        autoPan: true,
        autoPanAnimation: {
          duration: 250
        }
      });
      map.addOverlay(overlay);
      
      closer.onclick = function() {
    	    overlay.setPosition(undefined);
    	    closer.blur();
    	    return false;
    	  };
    		  
    	// Add a click handler to the map to display the popup.
    	  map.on('click', function(evt) {
    	    var coordinate = evt.coordinate;
    	    var hdms = ol.coordinate.toStringHDMS(ol.proj.toLonLat(coordinate));

    	    content.innerHTML = '<p>You clicked here:</p><code>' + hdms + '</code>';
    	    overlay.setPosition(coordinate);
    	  });
*/
    	
    	
    		    
    		/*  // GeoServer 타일 레이어를 찾아서 features 가져오기
    		    var geoServerLayer = null;
    		    map.getLayers().forEach(function(layer) {
    		      if (layer instanceof ol.layer.Tile && layer.getSource() instanceof ol.source.TileWMS && layer.getOpacity() === 0.7) {
    		        geoServerLayer = layer;
    		      }
    		    });

    		    // GeoServer 타일 레이어에서 geom 정보 가져오기
    		    if (geoServerLayer) {
    		      var source = geoServerLayer.getSource();
    		      source.getFeaturesAtCoordinate(coordinate, function(foundFeatures) {
    		        if (foundFeatures.length > 0) {
    		          var geom = foundFeatures[0].getGeometry();
    		          // geom 값을 활용하여 필요한 작업 수행
    		          // 예: hdms에 추가 정보 넣기
    		          console.log("geom:"+geom);
    		          hdms += '<br>' + 'Geom: ' + geom;
    		        }
    		        content.innerHTML = '<code>' + hdms + '</code>';
    		        overlay.setPosition(coordinate);
    		      });
    		    } else {
    		      content.innerHTML = '<code>' + hdms + '</code>';
    		      overlay.setPosition(coordinate);
    		    }
    		    
    		    var pixelCoord = evt.pixel;
    	    	  var layer_Name = 'carbon:view_carbon_sd_all';
    	    	  var url = 'http://localhost:9980/geoserver/wms?' +
    	    	  'SERVICE=WMS&' +
    	    	  'VERSION=1.1.1&' +
    	    	  'REQUEST=GetFeatureInfo&' +
    	    	  'LAYERS=' + layer_Name + '&' +
    	    	  'QUERY_LAYERS=' + layer_Name + '&' +
    	    	  'INFO_FORMAT=application/json&' +
    	    	  'FEATURE_COUNT=1&' +
    	    	  'X=' + Math.round(pixelCoord[0]) + '&' +
    	    	  'Y=' + Math.round(pixelCoord[1]);

    	    	// GetFeatureInfo 요청 보내기
    	    	  fetch(url, {
    	    		  headers: {
    	    		    Accept: "application/json",
    	    		  },
    	    		  method: "GET",
    	    		})
    	    		  .then(function(response) {
    	    		    return response.json();
    	    		  })
    	    		  .then(function(jsonResponse) {
    	    		    // GetFeatureInfo 응답 처리
    	    		    var features = jsonResponse.features;
    	    		    if (features.length > 0) {
    	    		      var properties = features[0].properties;
    	    		      // 속성 값 활용
    	    		      console.log(properties);
    	    		    }
    	    		  }); 
    		  });*/
  	</script>
	



</body>
</html>