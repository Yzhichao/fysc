<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#reservoirInfoAddForm').form({
            url : '${path}/reservoirInfo/add',
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
        $('#reservoirInfoAddQy').combotree({
            url : '${path }/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            width:200,
            panelHeight : 300,
            onClick: function(node){
        		$("#reservoirInfoAddZwQy").val(node.text);
        	}
        });
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false" >
    <div data-options="region:'center',border:false" style="overflow: hidden;padding: 3px;" >
        <form id="reservoirInfoAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>水库名称</td>
                    <td>
                    <input name="rsname" style="height: 29px;width:260px;" class="easyui-textbox" type="text" data-options="required:true" ></td>
                </tr>
                 <tr>
                    <td>所在镇（街）</td>
                    <td>
                    	<select id="reservoirInfoAddQy" name="dscd"  style="width: 260px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select>
                    	<input name="twn" id="reservoirInfoAddZwQy" type="hidden">
                    </td>
                </tr>
                <tr>
                    <td>管理单位名称</td>
                    <td><input name="mdnm" style="height: 29px;width:260px;" class="easyui-textbox" type="text" ></td>
                </tr>
                <tr>
                    <td>主坝类型</td>
                    <td><input name="mdamtype" style="height: 29px;width:260px;" class="easyui-textbox" type="text" ></td>
                </tr>
                <tr>
                    <td>工程规模</td>
                    <td><input name="prsc" style="height: 29px;width:260px;" class="easyui-textbox" type="text" ></td>
                </tr>
                <tr>
                    <td>水库功能</td>
                    <td><input name="rsfn" style="height: 29px;width:260px;" class="easyui-textbox" type="text" ></td>
                </tr>
                <tr>
                    <td>最大坝高(m)</td>
                    <td><input name="mdMxHig" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="precision:2" type="text" ></td>
                </tr>
                <tr>
                    <td>设计洪水位(m)</td>
                    <td><input name="dsflz" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="precision:2" type="text" ></td>
                </tr>
                <tr>
                    <td>总库容(万m3)</td>
                    <td><input name="ttcp" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="precision:2" type="text" ></td>
                </tr>
                <tr>
                    <td>经度</td>
                    <td><input id="reservoirInfoAddJd" name="lgtd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" ><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="selMap('reservoirInfoAddJd','reservoirInfoAddWd');">查看地图</a></td>
                </tr>
                <tr>
                    <td>纬度</td>
                    <td><input id="reservoirInfoAddWd" name="lttd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" ></td>
                </tr>
                <tr>
                    <td>所在流域</td>
                    <td><input name="bsnm" style="height: 29px;width:260px;" class="easyui-textbox" type="text" ></td>
                </tr>
            </table>
        </form>
    </div>
</div>