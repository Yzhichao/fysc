<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#avoideDisasterPointEditForm').form({
            url : '${path}/avoideDisasterPoint/edit',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                if(isValid){
                	var tree = $('#avoideDisasterPointEditQy').combotree('tree');
                	if(tree.tree('getSelected')==null&&$('#avoideDisasterPointEditQy').combotree('getValue')!=""){
                		$('#avoideDisasterPointEditQy').combotree('setValue','${avoideDisasterPoint.dscd}');
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
        
       $('#avoideDisasterPointEditQy').combotree({
    	    url : '${path }/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            width:200,
            panelHeight : 300,
            value : '${avoideDisasterPoint.twn}',
            onClick: function(node){
        		$("#avoideDisasterPointEditZwQy").val(node.text);
        	}
        });
        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="avoideDisasterPointEditForm" method="post">
            <table class="grid">
            	<tr>
                    <td>所在镇（街）</td>
                    <td>
                    <select id="avoideDisasterPointEditQy" name="dscd"  style="width: 260px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select>
                    <input name="twn" id="avoideDisasterPointEditZwQy" type="hidden" value="${avoideDisasterPoint.twn}" ></td>
                </tr>
                <tr>
                    <td>位置</td>
                    <td><input name="id"  type="hidden"  value="${avoideDisasterPoint.id}">
                    <input name="add" style="height: 29px;width:260px;" class="easyui-textbox" type="text" data-options="required:true" value="${avoideDisasterPoint.add}"></td>
                </tr>
                <tr>
                    <td>名称</td>
                    <td><input name="name" style="height: 29px;width:260px;" class="easyui-textbox" type="text" data-options="required:true" value="${avoideDisasterPoint.name}"></td>
                </tr>
                <tr>
                    <td>占地面积(m2)</td>
                    <td><input name="area" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:2" type="text" value="${avoideDisasterPoint.area}"></td>
                </tr>
                <tr>
                    <td>容纳人数</td>
                    <td><input name="atcp" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0" data-options="min:0,precision:0" type="text" value="${avoideDisasterPoint.atcp}"></td>
                </tr>
                <tr>
                    <td>场所等级</td>
                    <td><input name="shGrd" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${avoideDisasterPoint.shGrd}"></td>
                </tr>
                <tr>
                    <td>经度</td>
                    <td><input id="avoideDisasterPointEditJd" name="lgtd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" value="${avoideDisasterPoint.lgtd}"><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="selMap('avoideDisasterPointEditJd','avoideDisasterPointEditWd');">查看地图</a></td>
                </tr>
                <tr>
                    <td>纬度</td>
                    <td><input id="avoideDisasterPointEditWd" name="lttd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" value="${avoideDisasterPoint.lttd}"></td>
                </tr>
                <tr>
                    <td>备注</td>
                    <td><input name="comments" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${avoideDisasterPoint.comments}"></td>
                </tr>
            </table>
        </form>
    </div>
</div>