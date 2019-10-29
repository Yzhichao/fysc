<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#monitorStationInfoAddForm').form({
            url : '${path}/monitorStationInfo/add',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                return isValid;
            },
            success : function(result) {
                progressClose();
                result = $.parseJSON(result);
                if (result.success) {
                    //之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    parent.$.messager.alert('错误', result.msg, 'error');
                }
            }
        });
         $('#monitorStationInfoAddQy').combotree({
        	url : '${path }/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            width:200,
            panelHeight : 300,
            onClick: function(node){
        		$("#monitorStationInfoAddZwQy").val(node.text);
        	}
        });
    });


</script>
<div class="easyui-layout" data-options="fit:true,border:false" >
    <div data-options="region:'center',border:false" style="overflow: hidden;padding: 3px;" >
        <form id="monitorStationInfoAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>所在镇（街）</td>
                    <td>
                    	<select id="monitorStationInfoAddQy" name="dscd"  style="width: 260px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select>
                    	<input name="twn" id="monitorStationInfoAddZwQy" type="hidden">
                    </td>
                </tr>

				<tr>
				    <td>测站名称</td>
				    <td><input name="stnm" data-options="required:true" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
				</tr>
				<tr>
				    <td>测站编码</td>
				    <td><input name="stcd" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
				</tr>
				<tr>
				    <td>站址</td>
				    <td><input name="add" data-options="required:true" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
				</tr>
				<tr>
				    <td>所在河流</td>
				    <td><input name="rv" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
				</tr>
				<tr>
				    <td>测站类型</td>
				    <td><input name="stType" data-options="required:true" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
				</tr>
				<tr>
				    <td>建站时间</td>
				    <td><input name="esdt" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
				</tr>
				<tr>
				    <td>隶属单位</td>
				    <td><input name="addc" data-options="required:true" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
				</tr>
				<tr>
				    <td>备注</td>
				    <td><input name="commrnts" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
				</tr>

                <tr>
                    <td>经度(°)</td>
                    <td><input id="monitorStationInfoAddJd" name="lgtd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5,required:true" type="text" ><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="selMap('monitorStationInfoAddJd','monitorStationInfoAddWd');">查看地图</a></td>
                </tr>
                <tr>
                    <td>纬度(°)</td>
                    <td><input id="monitorStationInfoAddWd" name="lttd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5,required:true" type="text" ></td>
                </tr>
            </table>
        </form>
    </div>
</div>
