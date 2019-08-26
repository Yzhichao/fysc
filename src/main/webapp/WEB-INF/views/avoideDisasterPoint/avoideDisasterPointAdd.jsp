<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#avoideDisasterPointAddForm').form({
            url : '${path}/avoideDisasterPoint/add',
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
         $('#avoideDisasterPointAddQy').combotree({
        	url : '${path }/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            width:200,
            panelHeight : 300,
            onClick: function(node){
        		$("#avoideDisasterPointAddZwQy").val(node.text);
        	}
        });
    });
    
   
</script>
<div class="easyui-layout" data-options="fit:true,border:false" >
    <div data-options="region:'center',border:false" style="overflow: hidden;padding: 3px;" >
        <form id="avoideDisasterPointAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>所在镇（街）</td>
                    <td>
                    	<select id="avoideDisasterPointAddQy" name="dscd"  style="width: 260px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select>
                    	<input name="twn" id="avoideDisasterPointAddZwQy" type="hidden">
                    </td>
                </tr>
                <tr>
                    <td>位置</td>
                    <td><input name="id"  type="hidden"  value="${avoideDisasterPoint.id}">
                    <input name="add" style="height: 29px;width:260px;" class="easyui-textbox" type="text" data-options="required:true" ></td>
                </tr>
                <tr>
                    <td>名称</td>
                    <td><input name="name" style="height: 29px;width:260px;" class="easyui-textbox" type="text" data-options="required:true" ></td>
                </tr>
                <tr>
                    <td>占地面积(m2)</td>
                    <td><input name="area" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:2" type="text" ></td>
                </tr>
                <tr>
                    <td>容纳人数</td>
                    <td><input name="atcp" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0" type="text"></td>
                </tr>
                <tr>
                    <td>场所等级</td>
                    <td><input name="shGrd" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
                </tr>
                <tr>
                    <td>经度</td>
                    <td><input id="avoideDisasterPointAddJd" name="lgtd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" ><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="selMap('avoideDisasterPointAddJd','avoideDisasterPointAddWd');">查看地图</a></td>
                </tr>
                <tr>
                    <td>纬度</td>
                    <td><input id="avoideDisasterPointAddWd" name="lttd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" ></td>
                </tr>
                <tr>
                    <td>备注</td>
                    <td><input name="comments" style="height: 29px;width:260px;" class="easyui-textbox" type="text" ></td>
                </tr>
            </table>
        </form>
    </div>
</div>