<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
    
	 <style type="text/css">
	      html, body{
	        padding:0;
	        margin:0;
	        height:100%;
	        width:100%;
	      }
	     .btn01 { 
		     border:0; 
		     color:#0a246a; 
		     font-size:12px;
		     width:65px; 
		     color:#fff; 
		     height:23px; 
		     margin-right:4px; 
		     padding:0; 
		     background: url(${path}/static/style/images/t01.gif) 0 -123px no-repeat; 
		     font-weight:bold; 
		     line-height:23px; 
		     cursor:pointer; 
		     overflow:hidden; 
	     }
	      .btn02 { 
		     border:0; 
		     color:#0a246a; 
		     font-size:12px;
		     width:65px; 
		     color:#fff; 
		     height:23px; 
		     margin:0 4px 6px 0; 
		     padding:0; 
		     background: url(${path}/static/style/images/t01.gif) -85px -123px no-repeat; 
		     font-weight:bold; 
		     line-height:23px; 
		     cursor:pointer; 
		     overflow:hidden; 
	     }
		.tdt-control-copyright{
			display: none;
		}
		 #vectorLayer{
      	z-index:990;
      	position:absolute;
      	right:68px;
      	top:2px;
      	font-size:12px;
      	background: url(${path}/static/style/images/zbtn_2.gif);
      	height:19px;
      	width:52px;
      	text-decoration: none;
      	color:#ecf584;
      	padding: 3px 0 0 12px;
      	cursor: pointer;
	  }  
	  
	    #rsLayer{
      	z-index:990;
      	position:absolute;
      	right:4px;
      	top:2px;
      	font-size:12px;
      	background: url(${path}/static/style/images/ybtn_1.gif) ;
      	height:19px;
      	width:54px;
      	text-decoration: none;
      	padding: 3px 0 0 10px;
      	color:#fff;
      	cursor: pointer;
	  } 
		
	#mapDiv {
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
     }
	 </style>
 
    <script> 
        var map,lay,cia; 
        var jwd="";
	
        var wd=23.110049,jd=113.302002,zoom=8;
       
        function onLoad() { 
        	
        	if( $("#"+qjjd).val()!=""){
    			jd=$("#"+qjjd).val();
    			wd=$("#"+qjwd).val();
    			zoom=18;
    		}
			
        	map = new T.Map("mapDiv");
           
            map.centerAndZoom(new T.LngLat(parseFloat(jd),parseFloat(wd)), zoom); 
            
			var ctrl = new T.Control.MapType();
            //添加控件
            map.addControl(ctrl);
            
            var imageURL = "http://t0.tianditu.cn/img_w/wmts?" +
            "SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=img&STYLE=default&TILEMATRIXSET=w&FORMAT=tiles" +
            "&TILEMATRIX={z}&TILEROW={y}&TILECOL={x}";
            lay = new T.TileLayer(imageURL,{minZoom:1,maxZoom:18});
            
            var ciaURL = "http://t0.tianditu.cn/cia_w/wmts?" +
            "SERVICE=WMTS&REQUEST=GetTile&VERSION=1.0.0&LAYER=cia&STYLE=default&TILEMATRIXSET=w&FORMAT=tiles" +
            "&TILEMATRIX={z}&TILEROW={y}&TILECOL={x}";
   			cia = new T.TileLayer(ciaURL,{minZoom:1,maxZoom:18});
   			 
   			var marker = new T.Marker(new T.LngLat(parseFloat(jd),parseFloat(wd)));
    		map.addOverLay(marker);
        map.setMapType(TMAP_HYBRID_MAP);
             
        } 
        
        function clFun(){
        	$(vectorLayer).css("background","url(${path}/static/style/images/zbtn_2.gif) ");
        	$(vectorLayer).css("color","#ecf584");
        	$('#rsLayer').css("background","url(${path}/static/style/images/ybtn_1.gif)");
        	$('#rsLayer').css("color","#fff");
        	map.removeLayer(lay);
            map.removeLayer(cia);
        }
        
        function yxFun(){
        	$('#rsLayer').css("background","url(${path}/static/style/images/ybtn_2.gif) ");
        	$('#rsLayer').css("color","#ecf584");
        	$('#vectorLayer').css("background","url(${path}/static/style/images/zbtn_1.gif)");
        	$('#vectorLayer').css("color","#fff");
        	map.addLayer(lay);
            map.addLayer(cia);
        }
        
        function selZb(){
        		
        		parent.$.messager.confirm('询问','确定选择<br>经度：'+setZhJwd(map.getCenter().getLng())+'   纬度：'+setZhJwd(map.getCenter().getLat()), function(b) {
        	         if (b) {
        	        	 $("#"+qjjd).textbox('setValue',map.getCenter().getLng());
        	        	 $("#"+qjwd).textbox('setValue',map.getCenter().getLat());
        	        	
        	        	 $('#selMapWin').window('close'); 
        	         }
        	     });

        }
        
        function setZhJwd(value) {  
            value = Math.abs(value);  
            var v1 = Math.floor(value);//度  
            var v2 = Math.floor((value - v1) * 60);//分  
            var v3 = Math.round((value - v1) * 3600 % 60);//秒  
            return v1 + '°' + v2 + '\'' + v3 + '"';
        }; 
        
        function closeMap(){
        	$('#selMapWin').window('close');
        }
       
    </script> 

<div id="mapDiv"></div> 
<div style="position:absolute;right:12px; top:100px; z-Index:990;">
<div><input type="button" id="btnSave" name="xczb" value="关闭" class="btn02" onclick="closeMap();"/></div>
<div><input type="button" id="btnSave" name="xczb" value="选取坐标" class="btn01" onclick="selZb();"/></div>
</div>
<div style="position:absolute;right:379px; top:257px; z-Index:990;"><img src="static/style/images/dwtb.png"/></div>
