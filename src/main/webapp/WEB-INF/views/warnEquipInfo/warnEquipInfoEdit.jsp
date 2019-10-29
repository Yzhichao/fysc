<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#warnEquipInfoEditForm').form({
            url : '${path}/warnEquipInfo/edit',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                if(isValid){
                	var tree = $('#warnEquipInfoEditQy').combotree('tree');
                	if(tree.tree('getSelected')==null&&$('#warnEquipInfoEditQy').combotree('getValue')!=""){
                		$('#warnEquipInfoEditQy').combotree('setValue','${warnEquipInfo.dscd}');
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
        
       $('#warnEquipInfoEditQy').combotree({
    	    url : '${path }/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            width:200,
            panelHeight : 300,
            value : '${warnEquipInfo.szz}',
            onClick: function(node){
        		$("#warnEquipInfoEditZwQy").val(node.text);
        	}
        });
        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="warnEquipInfoEditForm" method="post">
            <table class="grid">
            	<tr>
                    <td>所在镇（街）</td>
                    <td>
                    <select id="warnEquipInfoEditQy" name="dscd"  style="width: 260px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select>
                    <input name="szz" id="warnEquipInfoEditZwQy" type="hidden" value="${warnEquipInfo.szz}" ></td>
                </tr>
                <tr>
                    <td>名称</td>
                    <td><input name="id"  type="hidden"  value="${warnEquipInfo.id}">
                    <input name="mc" style="height: 29px;width:260px;" class="easyui-textbox" type="text" data-options="required:true" value="${warnEquipInfo.mc}"></td>
                </tr>
                <tr>
                    <td>设施类型</td>
                    <td><input name="sslx" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${warnEquipInfo.sslx}"></td>
                </tr>
                <tr>
                    <td>经度(°)</td>
                    <td><input id="warnEquipInfoEditJd" name="jd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" value="${warnEquipInfo.jd}"><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="selMap('warnEquipInfoEditJd','warnEquipInfoEditWd');">查看地图</a></td>
                </tr>
                <tr>
                    <td>纬度(°)</td>
                    <td><input id="warnEquipInfoEditWd" name="wd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" value="${warnEquipInfo.wd}"></td>
                </tr>
                <tr>
                    <td>备注</td>
                    <td><input name="bz" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${warnEquipInfo.bz}"></td>
                </tr>
            </table>
        </form>
    </div>
</div>