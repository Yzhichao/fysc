<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#baseInfoEditForm').form({
            url : '${path}/baseInfo/edit',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                if(isValid){
                	var tree = $('#baseInfoEditQy').combotree('tree');
                	if(tree.tree('getSelected')==null&&$('#baseInfoEditQy').combotree('getValue')!=""){
                		$('#baseInfoEditQy').combotree('setValue','${baseInfo.dscd}');
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
        
        $('#baseInfoEditQy').combotree({
            url : '${path }/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            width:200,
            panelHeight : 300,
            value : '${baseInfo.zhen}',
            onClick: function(node){
        		$("#baseInfoEditZwQy").val(node.text);
        	}
        });
        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="baseInfoEditForm" method="post">
            <table class="grid">
                <tr>
                    <td>镇（街）</td>
                    <td><input name="id"  type="hidden"  value="${baseInfo.id}">
                    <select id="baseInfoEditQy" name="dscd"  style="width: 260px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select>
                    <input name="zhen" id="baseInfoEditZwQy" type="hidden"  value="${baseInfo.zhen}"></td>
                </tr>
                <tr>
                    <td>极高危险区户</td>
                    <td><input name="jgwxqHu" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0" type="text"   value="${baseInfo.jgwxqHu}"></td>
                </tr>
                <tr>
                    <td>极高危险区人</td>
                    <td><input name="jgwxqRen" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0" type="text"   value="${baseInfo.jgwxqRen}"></td>
                </tr>
                <tr>
                    <td>高危险区户</td>
                    <td><input name="gwxqHu" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0" type="text"   value="${baseInfo.gwxqHu}"></td>
                </tr>
                <tr>
                    <td>高危险区人</td>
                    <td><input name="gwxqRen" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0" type="text"   value="${baseInfo.gwxqRen}"></td>
                </tr>
                <tr>
                    <td>危险区户</td>
                    <td><input name="wxqHu" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0" type="text"   value="${baseInfo.wxqHu}"></td>
                </tr>
                <tr>
                    <td>危险区人</td>
                    <td><input name="wxqRen" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0" type="text"   value="${baseInfo.wxqRen}"></td>
                </tr>
                <tr>
                    <td>无线预警广播</td>
                    <td><input name="wxyjgb" style="height: 29px;width:260px;" class="easyui-textbox" type="text"   value="${baseInfo.wxyjgb}"></td>
                </tr>
                <tr>
                    <td>雨量报警站</td>
                    <td><input name="ylbjz" style="height: 29px;width:260px;" class="easyui-textbox" type="text"   value="${baseInfo.ylbjz}"></td>
                </tr>
                <tr>
                    <td>水位报警站</td>
                    <td><input name="swbjz" style="height: 29px;width:260px;" class="easyui-textbox" type="text"  value="${baseInfo.swbjz}"></td>
                </tr>
            </table>
        </form>
    </div>
</div>