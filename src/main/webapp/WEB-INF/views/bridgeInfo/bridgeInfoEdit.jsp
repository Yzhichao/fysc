<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#bridgeInfoEditForm').form({
            url : '${path}/bridgeInfo/edit',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                if(isValid){
                	var tree = $('#bridgeInfoEditQy').combotree('tree');
                	if(tree.tree('getSelected')==null&&$('#bridgeInfoEditQy').combotree('getValue')!=""){
                		$('#bridgeInfoEditQy').combotree('setValue','${bridgeInfo.dscd}');
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
        
       $('#bridgeInfoEditQy').combotree({
    	    url : '${path }/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            width:200,
            panelHeight : 300,
            value : '${bridgeInfo.twn}',
            onClick: function(node){
        		$("#bridgeInfoEditZwQy").val(node.text);
        	}
        });
        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="bridgeInfoEditForm" method="post">
            <table class="grid">
            	<tr>
                    <td>所在镇（街）</td>
                    <td>
                    <input name="id"  type="hidden"  value="${bridgeInfo.id}">
                    <select id="bridgeInfoEditQy" name="dscd"  style="width: 260px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select>
                    <input name="twn" id="bridgeInfoEditZwQy" type="hidden" value="${bridgeInfo.twn}" ></td>
                </tr>
<%-- 
<tr>
    <td>行政编码</td>
    <td><input name="addvcd" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${bridgeInfo.addvcd}"></td>
</tr>
<tr>
    <td>行政区名称</td>
    <td><input name="addvnm" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${bridgeInfo.addvnm}"></td>
</tr>
 --%>
 <tr>
    <td>桥梁名称</td>
    <td><input name="brName" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${bridgeInfo.brName}"></td>
</tr><tr>
    <td>所在河道</td>
    <td><input name="rv" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${bridgeInfo.rv}"></td>
</tr><tr>
    <td>桥长(m)</td>
    <td><input name="brLen" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${bridgeInfo.brLen}"></td>
</tr><tr>
    <td>桥宽(m)</td>
    <td><input name="brWid" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${bridgeInfo.brWid}"></td>
</tr><tr>
    <td>桥高(m)</td>
    <td><input name="brHight" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${bridgeInfo.brHight}"></td>
</tr><tr>
    <td>桥梁类型</td>
    <td><input name="brType" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${bridgeInfo.brType}"></td>
</tr><tr>
    <td>备注</td>
    <td><input name="comments" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${bridgeInfo.comments}"></td>
</tr>

                <tr>
                    <td>经度(°)</td>
                    <td><input id="bridgeInfoEditJd" name="lgtd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" value="${bridgeInfo.lgtd}"><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="selMap('bridgeInfoEditJd','bridgeInfoEditWd');">查看地图</a></td>
                </tr>
                <tr>
                    <td>纬度(°)</td>
                    <td><input id="bridgeInfoEditWd" name="lttd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" value="${bridgeInfo.lttd}"></td>
                </tr>
            </table>
        </form>
    </div>
</div>