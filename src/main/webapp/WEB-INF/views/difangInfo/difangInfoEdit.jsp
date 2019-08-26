<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#difangInfoEditForm').form({
            url : '${path}/difangInfo/edit',
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
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    parent.$.messager.alert('错误', result.msg, 'error');
                }
            }
        });
        
       $('#difangInfoEditQy').combotree({
    	    url : '${path }/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            width:200,
            panelHeight : 300,
            value : '${difangInfo.dscd}'
        });
        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="difangInfoEditForm" method="post">
            <table class="grid">
            	<tr>
                    <td>区域</td>
                    <td>
                    <select id="difangInfoEditQy" name="dscd"  style="width: 260px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select>
                    </td>
                </tr>
                <tr>
                    <td>堤防名称</td>
                    <td><input name="id"  type="hidden"  value="${difangInfo.id}">
                    <input name="dknm" style="height: 29px;width:260px;" class="easyui-textbox" type="text" data-options="required:true" value="${difangInfo.dknm}"></td>
                </tr>
                <!-- 
                <tr>
                    <td>所在河流</td>
                    <td><input name="szhl" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value=""></td>
                </tr>
                 -->
                <tr>
                    <td>跨界情况</td>
                    <td><input name="dkcr" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${difangInfo.dkcr}"></td>
                </tr>
                <tr>
                    <td>堤防类型</td>
                    <td><input name="dktype" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${difangInfo.dktype}"></td>
                </tr>
                <tr>
                    <td>堤防型式</td>
                    <td><input name="dktype1" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${difangInfo.dktype1}"></td>
                </tr>
                <!-- 
                <tr>
                    <td>堤防级别</td>
                    <td><input name="dfjb" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value=""></td>
                </tr>
                 -->
                <tr>
                    <td>规划防洪标准(年)</td>
                    <td><input name="plflst" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0" type="text" value="${difangInfo.plflst}"></td>
                </tr>
                <tr>
                    <td>堤防长度(m)</td>
                    <td><input name="dklen" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:2" type="text" value="${difangInfo.dklen}"></td>
                </tr>
                <!-- 
                <tr>
                    <td>高程系统</td>
                    <td><input name="gcxt" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value=""></td>
                </tr>
                <tr>
                    <td>设计水位(m)</td>
                    <td><input name="sjsw" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:2" type="text" value=""></td>
                </tr>
                <tr>
                    <td>备注</td>
                    <td><input name="bz" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value=""></td>
                </tr>
                 -->
            </table>
        </form>
    </div>
</div>