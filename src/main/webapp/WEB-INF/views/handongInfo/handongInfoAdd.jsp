<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#handongInfoAddForm').form({
            url : '${path}/handongInfo/add',
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
         $('#handongInfoAddQy').combotree({
        	url : '${path }/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            width:200,
            panelHeight : 300,
            onClick: function(node){
        		$("#handongInfoAddZwQy").val(node.text);
        	}
        });
    });
    
   
</script>
<div class="easyui-layout" data-options="fit:true,border:false" >
    <div data-options="region:'center',border:false" style="overflow: hidden;padding: 3px;" >
        <form id="handongInfoAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>位置</td>
                    <td><input name="addvnm" style="height: 29px;width:260px;" class="easyui-textbox" type="text" data-options="required:true" ></td>
                </tr>
                <tr>
                    <td>涵洞名称</td>
                    <td><input name="holeName" style="height: 29px;width:260px;" class="easyui-textbox" type="text" data-options="required:true"></td>
                </tr>
            	<tr>
                    <td>所在镇（街）</td>
                    <td>
                    	<select id="handongInfoAddQy" name="dscd"  style="width: 260px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select>
                    	<input name="twn" id="handongInfoAddZwQy" type="hidden">
                    </td>
                </tr>
                <tr>
                    <td>类型</td>
                    <td><input name="holeType" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
                </tr>
                <tr>
                    <td>洞身高(m)</td>
                    <td><input name="holeHight" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:2" type="text"></td>
                </tr>
                <tr>
                    <td>洞身宽或直径(m)</td>
                    <td><input name="holeWid" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:2" type="text"></td>
                </tr>
                <tr>
                    <td>经度（°）</td>
                    <td><input id="handongInfoAddJd" name="lgtd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" ><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="selMap('handongInfoAddJd','handongInfoAddWd');">查看地图</a></td>
                </tr>
                <tr>
                    <td>纬度（°）</td>
                    <td><input id="handongInfoAddWd" name="lttd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" ></td>
                </tr>
                <!-- 
                <tr>
                    <td>备注</td>
                    <td><input name="bz" style="height: 29px;width:260px;" class="easyui-textbox" type="text" ></td>
                </tr>
                 -->
            </table>
        </form>
    </div>
</div>