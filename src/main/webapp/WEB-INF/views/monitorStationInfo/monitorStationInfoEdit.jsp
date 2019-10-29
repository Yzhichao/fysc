<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#monitorStationInfoEditForm').form({
            url : '${path}/monitorStationInfo/edit',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                if(isValid){
                	var tree = $('#monitorStationInfoEditQy').combotree('tree');
                	if(tree.tree('getSelected')==null&&$('#monitorStationInfoEditQy').combotree('getValue')!=""){
                		$('#monitorStationInfoEditQy').combotree('setValue','${monitorStationInfo.dscd}');
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
        
       $('#monitorStationInfoEditQy').combotree({
    	    url : '${path }/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            width:200,
            panelHeight : 300,
            value : '${monitorStationInfo.twn}',
            onClick: function(node){
        		$("#monitorStationInfoEditZwQy").val(node.text);
        	}
        });
        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="monitorStationInfoEditForm" method="post">
            <table class="grid">
            	<tr>
                    <td>所在镇（街）</td>
                    <td>
                    <input name="id"  type="hidden"  value="${monitorStationInfo.id}">
                    <select id="monitorStationInfoEditQy" name="dscd"  style="width: 260px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select>
                    <input name="twn" id="monitorStationInfoEditZwQy" type="hidden" value="${monitorStationInfo.twn}" ></td>
                </tr>
				<tr>
				    <td>测站名称</td>
				    <td><input name="stnm" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${monitorStationInfo.stnm}"></td>
				</tr>
				<tr>
				    <td>测站编码</td>
				    <td><input name="stcd" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${monitorStationInfo.stcd}"></td>
				</tr>
				<tr>
				    <td>站址</td>
				    <td><input name="add" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${monitorStationInfo.add}"></td>
				</tr>
				<tr>
				    <td>所在河流</td>
				    <td><input name="rv" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${monitorStationInfo.rv}"></td>
				</tr>
				<tr>
				    <td>测站类型</td>
				    <td><input name="stType" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${monitorStationInfo.stType}"></td>
				</tr>
				<tr>
				    <td>建站时间</td>
				    <td><input name="esdt" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${monitorStationInfo.esdt}"></td>
				</tr>
				<tr>
				    <td>隶属单位</td>
				    <td><input name="addc" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${monitorStationInfo.addc}"></td>
				</tr>
				<tr>
				    <td>备注</td>
				    <td><input name="commrnts" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${monitorStationInfo.commrnts}"></td>
				</tr>
                <tr>
                    <td>经度(°)</td>
                    <td><input id="monitorStationInfoEditJd" name="lgtd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" value="${monitorStationInfo.lgtd}"><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="selMap('monitorStationInfoEditJd','monitorStationInfoEditWd');">查看地图</a></td>
                </tr>
                <tr>
                    <td>纬度(°)</td>
                    <td><input id="monitorStationInfoEditWd" name="lttd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" value="${monitorStationInfo.lttd}"></td>
                </tr>
            </table>
        </form>
    </div>
</div>