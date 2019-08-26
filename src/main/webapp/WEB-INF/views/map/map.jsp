<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>广东河湖名录</title>
	<link rel="stylesheet" href="http://rhpwk.gdsky.com.cn/arcgis_js_v320_api/library/3.20/3.20/esri/css/esri.css">
	<script src="http://rhpwk.gdsky.com.cn/arcgis_js_v320_api/library/3.20/3.20/init.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/style/css/map.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/easyui/jquery.min.js"></script>
	<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/easyui/themes/default/easyui.css" />
	<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/easyui/themes/icon.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/easyui/jquery.easyui.min.js" charset="utf-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/easyui/locale/easyui-lang-zh_CN.js" charset="utf-8"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/static/extJs.js" charset="utf-8"></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/static/qy.js"></script>
  	<style type="text/css">
    
    </style>
	
</head>
<body style="margin: 0"> 
     
 <input id="userid" type="hidden"  value="<shiro:principal property = "id"/>">  
 <div class="easyui-layout" data-options="fit:true,border:false">
    
    <div data-options="region:'center'" >
       <div id="mapDiv" style="position:absolute;"></div>
       <div  id="xzkcss" >
        <a href="javascript:void(0)" onclick="grantTcfwFun()" class="easyui-linkbutton" data-options="iconCls:'icon-list'" style="height: 29px;">地图服务</a>
	   	<select id="dtSelect" class="easyui-combobox" data-options="width:120,height:29,editable:false,panelHeight:'auto'">
		   	<option  value="1">矢量图(天地图)</option>
		   	<option  value="2">影像图(天地图)</option>
	  	</select>
	  	
	   </div>
    </div>
    
    <div class="easyui-layout" data-options="region:'west',border:true,split:false,title:'河湖列表'"  style="width:196px;overflow: hidden; ">
	    <div data-options="region:'north',border:false" style="height: 60px; overflow: hidden;background-color: #fff">
	        <form id="gdhhmlSearchForm">
	            <table style="font-size: 12px;">
	                <tr>
	                    <td style="width:32px;">区域:</td>
	                    <td><select id="qy" name="xzbm" style="width: 143px; height: 22px;"></select></td>
	                </tr>
	                <tr>
	                    <td>名称:</td>
	                    <td><input name="hlmc" class="easyui-textbox" style="width:108px"/>
	                         <a href="javascript:void(0);" class="easyui-linkbutton" onclick="gdhhmlSearchFun();">查询</a>
	                    </td>
	                </tr>
	            </table>
	        </form>
	     </div>
	 
	    <div data-options="region:'center',border:false">
	        <table id="gdhhmlDataGrid" data-options="fit:true,border:false"></table>
	    </div>
    </div>
</div>
 
</body>
</html>

    <script type="text/javascript">
    var tcfwdata=null;
    $(function() {
    	getTcfw();
      });
    
    parent.$.modalDialog.gids=[];
    function grantTcfwFun() {

        parent.$.modalDialog({
            title : '选择地图服务',
            width : 500,
            height : 500,
            href : '${pageContext.request.contextPath}/tcfw/tcfwMapGrant?id='+$("#userid").val(),
            buttons : [ {
                text : '确定',
                handler : function() {
                	parent.qdfun();
                	xztcFun();
                }
            } ]
        });
    }
    
    function getTcfw(){
    	$.ajax({
    		url:"${pageContext.request.contextPath}/tcfw/findUserIdTcfw",
    		type:"POST",
    		dataType:"json",
    		data:{userId:+$("#userid").val()},
    		success:function(data){
    			tcfwdata=data;
    		}
    	});
    }
    
    $('#qy').combotree({
        url : '${pageContext.request.contextPath}/user/tree',
        parentField : 'pid',
        valueField: 'id',
        lines : true,
        panelHeight : 300
    });
	    
	    $("#dtSelect").combobox({
	        onChange:function(n,o){
	        	if(n==1){
	   	    		vectorLayer();
	   	    	}if(n==2){
	   	    		rsLayer();
	   	    	}
	        }
	    });
	    
	   
      var map,gl,rowdata;
      var vectorLayer,rsLayer,dwFun,xztc,xztcFun;
      require([
        "esri/map","esri/geometry/Point","esri/dijit/Scalebar","esri/toolbars/draw",
        "esri/layers/WebTiledLayer","esri/geometry/Polyline","esri/layers/ArcGISImageServiceLayer","esri/layers/FeatureLayer","esri/tasks/FindTask",
        "esri/symbols/SimpleMarkerSymbol", "esri/symbols/SimpleLineSymbol","esri/layers/ArcGISDynamicMapServiceLayer","esri/tasks/FindParameters",
        "esri/symbols/PictureFillSymbol", "esri/symbols/CartographicLineSymbol", "esri/symbols/PictureMarkerSymbol","esri/layers/TileInfo",
        "esri/graphic", "esri/layers/GraphicsLayer","esri/InfoTemplate","esri/layers/ArcGISTiledMapServiceLayer","esri/geometry/Extent","esri/SpatialReference",
        "esri/Color", "dojo/dom", "dojo/on", "dojo/domReady!"
      ], function(
        Map,Point,Scalebar,Draw,
        WebTiledLayer,Polyline,ArcGISImageServiceLayer,FeatureLayer,FindTask,
        SimpleMarkerSymbol, SimpleLineSymbol,ArcGISDynamicMapServiceLayer,FindParameters,
        PictureFillSymbol, CartographicLineSymbol, PictureMarkerSymbol,TileInfo,
        Graphic, GraphicsLayer,InfoTemplate,ArcGISTiledMapServiceLayer,Extent,SpatialReference,
        Color, dom, on
      ) {

    	  map = new Map("mapDiv", {
              sliderStyle: "small"
            });

    	  
    	  var hhqd = new PictureMarkerSymbol("${pageContext.request.contextPath}/static/style/images/zbq.png",20,20);
    	  var hhzd = new PictureMarkerSymbol("${pageContext.request.contextPath}/static/style/images/zbz.png",20,20);
    	  
    	  var tileInfo = new TileInfo({
	           dpi: 90.71428571427429,
	          rows : 256,
	           cols : 256,
	           compressionQuality : 0,
	           origin : {
	            x : -180,
	             y : 90
	           },
	          spatialReference : {
	             wkid : 4326
	          },
	           lods : [
	            {level : 2,levelValue: 2, resolution : 0.3515625, scale : 147748796.52937502},
	            {level : 3,levelValue: 3, resolution : 0.17578125, scale : 73874398.264687508},
	            {level : 4,levelValue: 4,resolution : 0.087890625, scale : 36937199.132343754},
	             {level : 5,levelValue: 5, resolution : 0.0439453125, scale : 18468599.566171877},
	             {level : 6,levelValue: 6, resolution : 0.02197265625, scale : 9234299.7830859385},
	             {level : 7,levelValue: 7, resolution : 0.010986328125, scale : 4617149.8915429693},
	             {level : 8,levelValue: 8, resolution : 0.0054931640625, scale : 2308574.9457714846},
	            {level : 9,levelValue: 9, resolution : 0.00274658203125, scale : 1154287.4728857423},
	             {level : 10,levelValue: 10, resolution : 0.001373291015625, scale : 577143.73644287116},
	            {level : 11,levelValue: 11, resolution : 0.0006866455078125, scale : 288571.86822143558},
	           {level : 12,levelValue: 12, resolution : 0.00034332275390625, scale : 144285.93411071779},
	           {level : 13,levelValue: 13, resolution : 0.000171661376953125, scale : 72142.967055358895},
	            {level : 14,levelValue: 14, resolution : 8.58306884765625e-005, scale : 36071.483527679447},
	            {level : 15,levelValue: 15, resolution : 4.291534423828125e-005, scale : 18035.741763839724},
	            {level : 16,levelValue: 16, resolution : 2.1457672119140625e-005, scale : 9017.8708819198619},
	             {level : 17,levelValue: 17, resolution : 1.0728836059570313e-005, scale : 4508.9354409599309},
	            {level : 18,levelValue: 18, resolution : 5.3644180297851563e-006, scale : 2254.4677204799655},
	             { level: 19,levelValue: 19, resolution: 2.68220901489257815e-006, scale: 1127.23386023998275 },
	            { level: 20,levelValue: 2, resolution: 1.341104507446289075e-006, scale: 563.616930119991375 }
	          ]
	        });
    	  
    	  
    	  var mqSubDomains = ["t0","t1","t2","t3","t4","t5","t6","t7"];
    		mapQuest1 = new WebTiledLayer("http://{subDomain}.tianditu.com/DataServer?T=img_c&x={col}&y={row}&l={level}&tk=8af92b1cfaab1bf4c51a635dab1c3286", 
    			{
    				"id": "WebTiled_5904", 
    				"subDomains": mqSubDomains, 
    				"copyright":"TIANDITU",
  				tileInfo: tileInfo
    		  });
    		mapQuest2 = new WebTiledLayer("http://{subDomain}.tianditu.com/DataServer?T=cia_c&x={col}&y={row}&l={level}&tk=8af92b1cfaab1bf4c51a635dab1c3286", 
    			{
    				"id": "WebTiled_4587", 
    				"subDomains": mqSubDomains, 
    				"opacity":0.99,
    				"copyright":"TIANDITU",
  				tileInfo: tileInfo
    		  });
    		mapQuest3 = new WebTiledLayer("http://{subDomain}.tianditu.com/DataServer?T=vec_c&x={col}&y={row}&l={level}&tk=8af92b1cfaab1bf4c51a635dab1c3286", 
    				{
    				"id": "WebTiled_4805", 
    				"subDomains": mqSubDomains, 
    				"opacity":1,
    				"copyright":"TIANDITU",
    				tileInfo: tileInfo
    		 });
    		mapQuest4 = new WebTiledLayer("http://{subDomain}.tianditu.com/DataServer?T=cva_c&x={col}&y={row}&l={level}&tk=8af92b1cfaab1bf4c51a635dab1c3286", 
    				{
    				"id": "WebTiled_3057", 
    				"subDomains": mqSubDomains, 
    				"opacity":0.99,
    				"copyright":"TIANDITU",
    				tileInfo: tileInfo
    		});
      
      	map.addLayer(mapQuest3);
      	map.addLayer(mapQuest4);
      	var extent=new Extent(109.187576,21.623579,117.553665,25.320478,new SpatialReference({ wkid:4326}));
        map.setExtent(extent);
        
      	var obj = [];
      	var jid=[];
          
        
        
        
        /*----------------------------------------------------------------------------*/
        //在此注册函数
        vectorLayer=vectorLayerMap;
        rsLayer=rsLayerMap;
        dwFun=dwFunnb;
        xztcFun=xztcFunnb;
        
        gl=new GraphicsLayer();
  	  	map.addLayer(gl);
         
        function rsLayerMap(){
         	map.removeLayer(mapQuest3);
         	map.removeLayer(mapQuest4);
         	
         	map.addLayer(mapQuest1);
         	map.addLayer(mapQuest2);
         	
         	$.each(jid,function(index,id){
	        	  
	        	  if(typeof(obj[id])!="undefined"){
	        		map.reorderLayer(obj[id], 100);
	        	  }
	        	
	          });
         	
         	
         }
        
  		function vectorLayerMap(){
  			map.removeLayer(mapQuest1);
         	map.removeLayer(mapQuest2);
         	
  			map.addLayer(mapQuest3);
            map.addLayer(mapQuest4);
            
            $.each(jid,function(index,id){
	        	  
	        	  if(typeof(obj[id])!="undefined"){
	        		map.reorderLayer(obj[id], 100);
	        	  }
	        	
	          });
         }
  		
  		
  		function xztcFunnb(){
  			$.each(jid,function(index,id){
  				if(parent.$.modalDialog.gids.indexOf(id)==-1&&typeof(obj[id])!="undefined"){
  					map.removeLayer(obj[id]);
  				}
  			});
  			
  			var tt=0;
  			$.each(parent.$.modalDialog.gids,function(gindex,currentValue){
  				if(jid.indexOf(currentValue)==-1){
  					$.each(tcfwdata, function(index, value) {
        				if(value.id==currentValue&&value.fwdz!=''){
        					if(value.xslx=="FeatureLayer"){
        						obj[currentValue] = new FeatureLayer(value.fwdz,{outFields: ["*"]});
        						map.addLayer(obj[currentValue]);
        						obj[currentValue].on("click",function (event) {
            						showGraphicInfoWindow(event);
            	    			});
        					}else{
        						obj[currentValue] = new ArcGISDynamicMapServiceLayer(value.fwdz);
        						if(currentValue==28){
            						map.setLevel(12);
            					}
        						map.addLayer(obj[currentValue]);
        					}
 
        					if(tt==0){
        						var dicjz=true;
                    			obj[currentValue].on("update-end",function (){
                    				if(dicjz){
                        				map.setExtent(new Extent(obj[currentValue].fullExtent.xmin,obj[currentValue].fullExtent.ymin,obj[currentValue].fullExtent.xmax,obj[currentValue].fullExtent.ymax,new SpatialReference({ wkid:4326})));
                        				dicjz=false;
                    				}
                    			});	
        					}
        					tt++;
        				}
        			});
             	}
  				
  				
			 });
  			jid=parent.$.modalDialog.gids;
  			
  			
  				var max;
  	            for(var i=0; i<jid.length; i++){
  	                for(var j=i; j<jid.length; j++){
  	                    if(returnXh(jid[i])<returnXh(jid[j])){
  							max=jid[j];
  							jid[j]=jid[i];
  							jid[i]=max;
  	                    }
  	                }
  	            }
  	          
  	          $.each(jid,function(index,id){
  	        	  
  	        	  if(typeof(obj[id])!="undefined"){
  	        		map.reorderLayer(obj[id], 100);
  	        	  }
  	        	
  	          });
  	            
        }
  		
  		
  		
  		function returnXh(id){
  			var xh="";
  			$.each(tcfwdata, function(index, value) {
  				
  				if(value.id==id){
  					xh=value.xh;
  				}
  			});
  			return xh;
  		}
  		
  		
  		
  		function showGraphicInfoWindow(evt){
        	var attr=evt.graphic.attributes;
        	var str="<div class='conys'>";
        	//console.log(attr);
        	for(var key in attr){  
        		str+="<div><b>" + key + ":</b>"+ attr[key]+"</div>";
        	}
        	
        	map.infoWindow.resize(300, 200);
        	map.infoWindow.setContent(str+"</div>");
		    map.infoWindow.setTitle("");
			map.infoWindow.show(evt.mapPoint);
			
        }
        
  	  
  	 /*  map.on("mouse-move",function (evt) {
   	 	 longitude=evt.mapPoint.getLongitude();
		 latitude=evt.mapPoint.getLatitude();
		 location.innerHTML='经度:'+longitude.toFixed(5)+' '+'纬度:'+latitude.toFixed(5);
		 console.log(map.geographicExtent);
      }); */ 
  	  
  	  function dwFunnb() {
    	  	var find = new FindTask("http://58.248.66.220:6080/arcgis/rest/services/gdriver/MapServer");
			var params = new FindParameters();
			params.contains=false;
			params.returnGeometry = true;
			params.layerIds = [quth(rowdata.sj)];
			params.searchFields = [ "编码" ];
			params.searchText = rowdata.lhbm;
			find.execute(params, showResults, rejectedPromise);
      }
  	
  	  
	function showResults(response) {
		gl.clear();
		map.graphics.clear();
		var lineSymb = new SimpleLineSymbol(
				SimpleLineSymbol.STYLE_SHORTDASHDOTDOT,
				new Color([ 255, 0, 0 ]), 5);
		//STYLE_SHORTDASH
		
		var graphic = response["0"].feature;
		var points=graphic.geometry.paths[0];
		 gl.add(new Graphic(new Point(points[0][0], points[0][1]), hhqd));
		 gl.add(new Graphic(new Point(points[points.length-1][0], points[points.length-1][1]), hhzd));
		graphic.setSymbol(lineSymb);
		map.setExtent(graphic.geometry.getExtent());
		map.graphics.add(graphic);
		 
	    showInfoWindow(graphic.geometry.getExtent().getCenter());
	}
	
	function showInfoWindow(zjzb){
		var content = "<div class='conys'><div><b>名称: </b>"+rowdata.hlmc+"</div>" +
         "<div><b>管理级别: </b>"+rowdata.bzhlgljb+"</div>" +
         "<div><b>河段起止: </b>"+rowdata.hdqz+"</div>" +
         "<div><b>河段长度(km): </b>"+parseFloat(rowdata.hdcd).toFixed(2)+"</div>" +
         "<div><a href=\"#\" onclick=\"gdhhmlEditFun('"+rowdata.id+"');\">详情</a></div></div>";
  		map.infoWindow.resize(240, 200);
  		map.infoWindow.setContent(content);
	    map.infoWindow.setTitle(rowdata.hlmc);
	    map.infoWindow.show(zjzb);	
  	}
	
	function rejectedPromise(err) {
		alert(err);
	}
  	  
  	
  		
        
      });
      
     
      
      
      var gdhhmlDataGrid;
      $(function() {
          gdhhmlDataGrid = $('#gdhhmlDataGrid').datagrid({
          url : '${pageContext.request.contextPath}/gdhhml/dataGrid',
          striped : true,
          pagination : true,
          singleSelect : true,
          idField : 'id',
          sortName : 'id',
          sortOrder : 'asc',
          pageSize : 20,
          pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500],
          columns : [ [ {
              width : '60',
              title : '编号',
              field : 'id',
              sortable : true,
              hidden : true
          }, {
              width : '46',
              title : '市级',
              field : 'sj',
              sortable : true
          },{
              width : '106',
              title : '河流（段）名称',
              field : 'hlmc',
              sortable : true
          }, {
              width : '50',
              title : '联合编码',
              field : 'lhbm',
              hidden : true
          },{
              width : '100',
              title : '河段起止',
              field : 'hdqz',
              hidden : true
          }, {
        	  width : '100',
              title : '备注（河流管理级别）',
              field : 'bzhlgljb',
              hidden : true
          }, {
              width : '100',
              title : '河段长度（km）',
              field : 'hdcd',
              hidden : true
          },{
              field : 'action',
              title : '操作',
              width : 36,
              formatter : function(value, row, index) {
                  var str = '';
                  
                  str += '<a href="javascript:void(0)" class="gdhhml-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="fzFun('+row.id+');" ><img src="${pageContext.request.contextPath}/static/style/images/dw.png"></a>';
                 
                  return str;
              }
          } ] ],
          onLoadSuccess:function(data){
        	  
          },
          onDblClickRow:function(rowIndex,rowData){
          	gdhhmlEditFun(rowData.id);
          },
          toolbar : '#gdhhmlToolbar'
      });
         
          var p = $('#gdhhmlDataGrid').datagrid('getPager'); 
          $(p).pagination({ 
              beforePageText: '',
              afterPageText: '{pages}', 
              displayMsg: '', 
          }); 
          
          
  });
      
      
      
      function gdhhmlEditFun(id) {
    	    if (id == undefined) {
    	        var rows = gdhhmlDataGrid.datagrid('getSelections');
    	        id = rows[0].id;
    	    } else {
    	        gdhhmlDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    	    }
    	    parent.$.modalDialog({
    	        title : '编辑',
    	        width : 700,
    	        height : 630,
    	        href :  '${pageContext.request.contextPath}/gdhhml/editPage?id=' + id
    	    });
    	}
      
      function gdhhmlSearchFun() {
    	     gdhhmlDataGrid.datagrid('load', $.serializeObject($('#gdhhmlSearchForm')));
      }
    
      function fzFun(id){
    	  var row = gdhhmlDataGrid.datagrid('getRowIndex',id);
    	  var rows = gdhhmlDataGrid.datagrid('getRows');
    	  rowdata = rows[row];
    	  dwFun();
      }
     
     
     
      Array.prototype.remove=function(obj){
    	  for(var i =0;i <this.length;i++){
    	  var temp = this[i];
    	  if(!isNaN(obj)){
    	  temp=i;
    	  }
    	  if(temp == obj){
    	  for(var j = i;j <this.length;j++){
    	  this[j]=this[j+1];
    	  }
    	  this.length = this.length-1;
    	  }
    	  }
    	  };
      
    </script>