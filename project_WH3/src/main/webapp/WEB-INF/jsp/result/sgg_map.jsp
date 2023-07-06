<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>시군구 검색 지도</title>
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
  	font-size: 0.7vw;
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
  			범례 (kgCO2eq)
  			</c:when>
  			<c:when test="${legend_type eq 'equal'}">
  			<!-- 범례 (등간격) -->
  			범례 (kgCO2eq)
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
  
  <!-- 팝업 출력 -->
  <div id="popup" class="ol-popup">
  	<a href="#" id="popup-closer" class="ol-popup-closer"></a>
  	<div id="popup-content"></div>
  </div>
<script type="text/javascript">
  	
    // GeoServer WMS URL
    var wmsUrl = 'http://localhost:9080/geoserver/wms';
   
    // vworld
    var vworldApiKey = "B0D6B2D9-F984-3B92-9210-F4DD87B33B68";
    
    var container = document.getElementById('popup');
    var content = document.getElementById('popup-content');
    var closer = document.getElementById('popup-closer');
    
    // 범례 유형
    var legend_type = '${legend_type}';
    
    // 레이어 이름
    if(legend_type == "natural"){
    	var search_layerName = 'carbon:view_carbon_c_bjd';
    }else{
    	var search_layerName = 'carbon:view_carbon_c_bjd_equal';
    }
    
    var desiredZoomLevel = 7;

   
   	var center_x = '${center_x}';
   	var center_y = '${center_y}';
   	
   	console.log("center_x:"+center_x);
   	console.log("center_y:"+center_y);
   	
   	
   	var param1Value = '${sgg_cd}';
   	console.log('pram1Value:'+param1Value);
   	var param2Value = '';
    
    // 지도 생성
    var map = new ol.Map({
      target: 'map',
      layers: [
    	  
       /*  new ol.layer.Tile({
          source: new ol.source.OSM() // OpenStreetMap as base layer
        }),   */
       
        new ol.layer.Tile({
            source: new ol.source.XYZ({
                url: "http://xdworld.vworld.kr:8080/2d/Base/201802/{z}/{x}/{y}.png",
                attributions: '<a href="http://www.vworld.kr/">vworld</a>',
                maxZoom: 19,
                apiKey: vworldApiKey, // API 키 설정
            }),
        }),
 
       
         new ol.layer.Tile({
          source: new ol.source.TileWMS({
            url: wmsUrl,
            params: {
              'LAYERS': search_layerName,
              'viewparams' : 'SGGCD:' + param1Value,
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
        center: [center_x, center_y],
        zoom: 12, // 초기 확대/축소 수준
        extent: ol.proj.transformExtent([120, 30, 135, 40], 'EPSG:4326', 'EPSG:3857')
										// [왼쪽, 아래, 오른쪽, 위] 높을수록 쫍게
      })
    });
    
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
                'viewparams' : 'SGGCD:' + param1Value,
                'propertyName': 'bjd_usage' // 필터링할 컬럼 이름
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
                'FEATURE_COUNT': 100
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
                    				content.innerHTML = "탄소배출량: "+replacedValue+" kgCO2eq";			// 팝업창 안에 들어갈 내용
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

/*     
    var newLayer = new ol.layer.Tile({
          source: new ol.source.TileWMS({
            url: wmsUrl,
            params: {
              'LAYERS': sgg_search_layerName,
              'viewparams' : 'SGGCD:' + param1Value,
              'TILED': true
            },
            serverType: 'geoserver',
            transition: 0
          })
        });
    
    map.addLayer(newLayer);
*/
</script>
	



</body>
</html>