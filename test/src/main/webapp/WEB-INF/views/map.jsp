<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <!-- openlayers -->
    <link rel="stylesheet" href="https://openlayers.org/en/v4.6.5/css/ol.css" type="text/css">
    <script src="https://openlayers.org/en/v4.6.5/build/ol.js"></script>
    
    <style>
        * {
            border: 0;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
    
        .container {
            display: flex;
        }
    
        .map-container {
            flex: 1;
            float: right;
            margin: 0;
            height: 700px;
        }
    
        .button-container {
            display: flex;
            flex-direction: column;
            justify-content: start;
            align-items: center;
            width: 20%;
            height: 700px;
            background-color: #f0f0f0;
            padding: 0;
        }
    
        .button-container h4 {
            margin-top: 20px;
            margin-bottom: 30px;
        }
    
        .button {
            display: block;
            margin-bottom: 10px;
            background-color: #007bff;
            color: #fff;
            text-align: center;
            text-decoration: none;
            border: none;
            cursor: pointer;
        }
        
        .button-box {
            width: 95%;
            border-radius: 30px;
            background-color: white;
            margin-bottom: 20px;
        }
        
        .button-box.visionSelect {
            display: flex;
            justify-content: space-around;
            align-items: center;
        }
        
        .button-box.visionSelect input[type="radio"] {
            display: none;
        }
        
        .button-box.visionSelect label {
            display: block;
            border: 2px solid #000;
            border-radius: 5px;
            padding: 5px 10px;
            cursor: pointer;
            text-align: center;
        }
        
        .button-box.visionSelect input[type="radio"]:checked + label {
            background-color: blue;
            color: white;
        }
        
        .visionSelect {
            height: 80px;
        }
        
        .carSelect {
            height: 150px;
        }
        
        .dateSelect {
            height: 250px;
        }
    </style>
    
    <script>
        var map; // 전역 변수로 맵 객체를 선언합니다.
    
        // dom ready
        $(document).ready(function() {
            init();
        });
    
        function init() {
            // 용인시의 좌표 정의
            var yonginCoords = ol.proj.fromLonLat([127.1775, 37.2410]);
            
            // 초기 맵 생성
            map = new ol.Map({
                layers: [
                    // 기본 맵 레이어
                    new ol.layer.Tile({
                        source: new ol.source.XYZ({
                            url: 'http://api.vworld.kr/req/wmts/1.0.0/1BED7823-51FA-30E5-8664-4B59FDCC983E/Base/{z}/{y}/{x}.png'
                        })
                    }),
                    
                    // 추가 레이어 1 (City)
                    new ol.layer.Tile({
                        source: new ol.source.TileWMS({
                            url: 'http://localhost:8000/geoserver/test/wms',
                            params: {
                                'LAYERS': 'opengis:City',
                                'TILED': true,
                            },
                            serverType: 'geoserver',
                        }),
                    }),
                    
                    // 추가 레이어 2 (LINK)
                    new ol.layer.Tile({
                        source: new ol.source.TileWMS({
                            url: 'http://localhost:8000/geoserver/test/wms',
                            params: {
                                'LAYERS': 'opengis:LINK',
                                'TILED': true,
                            },
                            serverType: 'geoserver',
                        }),
                    }),
                    
                    // 추가 레이어 3 (NODE)
                    new ol.layer.Tile({
                        source: new ol.source.TileWMS({
                            url: 'http://localhost:8000/geoserver/test/wms',
                            params: {
                                'LAYERS': 'opengis:NODE',
                                'TILED': true,
                            },
                            serverType: 'geoserver',
                        }),
                    }),
                ],
                target: 'map',
                view: new ol.View({
                    center: yonginCoords,
                    zoom: 11,
                }),
            });
        }
        
        function satellite() {
            // 용인시의 좌표 정의
            var yonginCoords = ol.proj.fromLonLat([127.1775, 37.2410]);
            
            // 초기 맵 생성
            map = new ol.Map({
                layers: [
                    // 기본 맵 레이어
                    new ol.layer.Tile({
                        source: new ol.source.XYZ({
                            url: 'http://api.vworld.kr/req/wmts/1.0.0/1BED7823-51FA-30E5-8664-4B59FDCC983E/Satellite/{z}/{y}/{x}.jpeg'
                        })
                    }),
                    
                    // 추가 레이어 1 (City)
                    new ol.layer.Tile({
                        source: new ol.source.TileWMS({
                            url: 'http://localhost:8000/geoserver/test/wms',
                            params: {
                                'LAYERS': 'opengis:City',
                                'TILED': true,
                            },
                            serverType: 'geoserver',
                        }),
                    }),
                    
                    // 추가 레이어 2 (LINK)
                    new ol.layer.Tile({
                        source: new ol.source.TileWMS({
                            url: 'http://localhost:8000/geoserver/test/wms',
                            params: {
                                'LAYERS': 'opengis:LINK',
                                'TILED': true,
                            },
                            serverType: 'geoserver',
                        }),
                    }),
                    
                    // 추가 레이어 3 (NODE)
                    new ol.layer.Tile({
                        source: new ol.source.TileWMS({
                            url: 'http://localhost:8000/geoserver/test/wms',
                            params: {
                                'LAYERS': 'opengis:NODE',
                                'TILED': true,
                            },
                            serverType: 'geoserver',
                        }),
                    }),
                ],
                target: 'map',
                view: new ol.View({
                    center: yonginCoords,
                    zoom: 11,
                }),
            });
        }
        
        function hybrid() {
            // 용인시의 좌표 정의
            var yonginCoords = ol.proj.fromLonLat([127.1775, 37.2410]);
            
            // 초기 맵 생성
            map = new ol.Map({
                layers: [
                    // 기본 맵 레이어
                    new ol.layer.Tile({
                        source: new ol.source.XYZ({
                            url: 'http://api.vworld.kr/req/wmts/1.0.0/1BED7823-51FA-30E5-8664-4B59FDCC983E/Hybrid/{z}/{y}/{x}.png'
                        })
                    }),
                    
                    // 추가 레이어 1 (City)
                    new ol.layer.Tile({
                        source: new ol.source.TileWMS({
                            url: 'http://localhost:8000/geoserver/test/wms',
                            params: {
                                'LAYERS': 'opengis:City',
                                'TILED': true,
                            },
                            serverType: 'geoserver',
                        }),
                    }),
                    
                    // 추가 레이어 2 (LINK)
                    new ol.layer.Tile({
                        source: new ol.source.TileWMS({
                            url: 'http://localhost:8000/geoserver/test/wms',
                            params: {
                                'LAYERS': 'opengis:LINK',
                                'TILED': true,
                            },
                            serverType: 'geoserver',
                        }),
                    }),
                    
                    // 추가 레이어 3 (NODE)
                    new ol.layer.Tile({
                        source: new ol.source.TileWMS({
                            url: 'http://localhost:8000/geoserver/test/wms',
                            params: {
                                'LAYERS': 'opengis:NODE',
                                'TILED': true,
                            },
                            serverType: 'geoserver',
                        }),
                    }),
                ],
                target: 'map',
                view: new ol.View({
                    center: yonginCoords,
                    zoom: 11,
                }),
            });
        }
    
       
    </script>
</head>
<body>
    <div class="container">
        <div class="button-container">
            <h4>용인시 청소차 관제 시스템</h4>
            
            <div class="button-box visionSelect">
                <input type="radio" name="vision" id="basic" value="basic" onclick="base()">
                <label for="basic">기본</label>
                
                <input type="radio" name="vision" id="satellite" value="satellite" onclick="satellite()">
                <label for="satellite">위성</label>
                
                <input type="radio" name="vision" id="hybrid" value="hybrid" onclick="hybrid()">
                <label for="hybrid">하이브리드</label>
            </div>
    
            <div class="button-box carSelect">
            </div>
            
            <div class="button-box dateSelect">
            </div>
        </div>
        <div class="map-container" id="map"></div>
    </div>
</body>
</html>
