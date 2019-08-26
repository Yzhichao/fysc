<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#baseInfoAddForm').form({
            url : '${path}/baseInfo/add',
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
        $('#baseInfoAddQy').combotree({
            url : '${path }/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            width:200,
            panelHeight : 300,
            onClick: function(node){
        		$("#baseInfoAddZwQy").val(node.text);
        	}
        });
    });
    
    
</script>
<div class="easyui-layout" data-options="fit:true,border:false" >
    <div data-options="region:'center',border:false" style="overflow: hidden;padding: 3px;" >
        <form id="baseInfoAddForm" method="post">
            <table class="grid">
                
                <tr>
                    <td>镇（街）</td>
                    <td>
                    	<select id="baseInfoAddQy" name="dscd"  style="width: 260px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select>
                    	<input name="zhen" id="baseInfoAddZwQy" type="hidden">
                    </td>
                </tr>
                <tr>
                    <td>极高危险区户</td>
                    <td><input name="jgwxqHu" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0" type="text" ></td>
                </tr>
                <tr>
                    <td>极高危险区人</td>
                    <td><input name="jgwxqRen" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0" type="text" ></td>
                </tr>
                <tr>
                    <td>高危险区户</td>
                    <td><input name="gwxqHu" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0" type="text" ></td>
                </tr>
                <tr>
                    <td>高危险区人</td>
                    <td><input name="gwxqRen" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0" type="text" ></td>
                </tr>
                <tr>
                    <td>危险区户</td>
                    <td><input name="wxqHu" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0" type="text"></td>
                </tr>
                <tr>
                    <td>危险区人</td>
                    <td><input name="wxqRen" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0" type="text"></td>
                </tr>
                <tr>
                    <td>无线预警广播</td>
                    <td><input name="wxyjgb" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
                </tr>
                <tr>
                    <td>雨量报警站</td>
                    <td><input name="ylbjz" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
                </tr>
                <tr>
                    <td>水位报警站</td>
                    <td><input name="swbjz" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
                </tr>
            </table>
        </form>
    </div>
</div>