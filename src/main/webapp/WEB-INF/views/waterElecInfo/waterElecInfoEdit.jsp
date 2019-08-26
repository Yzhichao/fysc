<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#waterElecInfoEditForm').form({
            url : '${path}/waterElecInfo/edit',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                if(isValid){
                	var tree = $('#waterElecInfoEditQy').combotree('tree');
                	if(tree.tree('getSelected')==null&&$('#waterElecInfoEditQy').combotree('getValue')!=""){
                		$('#waterElecInfoEditQy').combotree('setValue','${waterElecInfo.dscd}');
                	}
                }
                return isValid;
            },
            success : function(result) {
                progressClose();
                result = $.parseJSON(result);
                if (result.success) {
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    parent.$.messager.alert('错误', result.msg, 'error');
                }
            }
        });
        
       $('#waterElecInfoEditQy').combotree({
    	    url : '${path }/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            width:200,
            panelHeight : 300,
            value : '${waterElecInfo.twn}',
            onClick: function(node){
        		$("#waterElecInfoEditZwQy").val(node.text);
        	}
        });
        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="waterElecInfoEditForm" method="post">
            <table class="grid">
           		 <tr>
                    <td>电站名称</td>
                    <td><input name="id"  type="hidden"  value="${waterElecInfo.id}">
                    <input name="name" style="height: 29px;width:260px;" class="easyui-textbox" type="text" data-options="required:true" value="${waterElecInfo.name}"></td>
                </tr>
            	<tr>
                    <td>所在镇（街）</td>
                    <td>
                    <select id="waterElecInfoEditQy" name="dscd"  style="width: 260px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select>
                    <input name="twn" id="waterElecInfoEditZwQy" type="hidden"  value="${waterElecInfo.twn}"></td>
                </tr>
                <tr>
                    <td>类型</td>
                    <td><input name="ptype" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterElecInfo.ptype}"></td>
                </tr>
                <tr>
                    <td>工程等级</td>
                    <td><input name="prgrd" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterElecInfo.prgrd}"></td>
                </tr>
                <tr>
                    <td>装机容量(kW)</td>
                    <td><input name="ic" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:2" type="text" value="${waterElecInfo.ic}"></td>
                </tr>
                <tr>
                    <td>机组台数(台)</td>
                    <td><input name="ut" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0" type="text" value="${waterElecInfo.ut}"></td>
                </tr>
                <tr>
                    <td>管理单位名称</td>
                    <td><input name="adnm" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterElecInfo.adnm}"></td>
                </tr>
                <!-- 
                <tr>
                    <td>备注</td>
                    <td><input name="bz" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value=""></td>
                </tr>
                <tr>
                    <td>经度</td>
                    <td><input id="waterElecInfoEditJd" name="jd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" value=""><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="selMap('waterElecInfoEditJd','waterElecInfoEditWd');">查看地图</a></td>
                </tr>
                <tr>
                    <td>纬度</td>
                    <td><input id="waterElecInfoEditWd" name="wd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" value=""></td>
                </tr>
                 -->
            </table>
        </form>
    </div>
</div>