<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#waterElecInfoEditForm').form({
            url : '${path}/waterElecInfo/edit',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                if(isValid){
                	var tree = $('#waterElecInfoEditQy').combotree('tree');
                	if(tree.tree('getSelected')==null&&$('#waterElecInfoEditQy').combotree('getValue')!=""){
                		$('#waterElecInfoEditQy').combotree('setValue','${waterElecInfo.dscd}');
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

       $('#waterElecInfoEditQy').combotree({
    	    url : '${path }/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            width:200,
            panelHeight : 300,
            value : '${waterElecInfo.twn}',
            onClick: function(node){
        		$("#waterElecInfoEditZwQy").val(node.text);
        	}
        });

    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="padding: 3px;">
        <form id="waterElecInfoEditForm" method="post">
            <table class="grid">
            	<tr>
                    <td>所在镇（街）</td>
                    <td><input name="id"  type="hidden"  value="${waterElecInfo.id}">
                    <select id="waterElecInfoEditQy" name="dscd"  style="width: 260px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select>
                    <input name="twn" id="waterElecInfoEditZwQy" type="hidden"  value="${waterElecInfo.twn}"></td>
                </tr>
                <tr>
    <td>工程名称</td>
    <td><input name="name" data-options="required:true" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterElecInfo.name}"></td>
</tr>
<tr>
    <td>水资源三级分区</td>
    <td><input name="tldwr" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterElecInfo.tldwr}"></td>
</tr>
<tr>
    <td>水电站类型</td>
    <td><input name="ptype" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterElecInfo.ptype}"></td>
</tr>
<tr>
    <td>工程状态</td>
    <td><input name="prst" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterElecInfo.prst}"></td>
</tr>
<tr>
    <td>工程等级</td>
    <td><input name="prgrd" data-options="required:true" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterElecInfo.prgrd}"></td>
</tr>
<tr>
    <td>装机容量(kW)</td>
    <td><input name="ic" data-options="required:true" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterElecInfo.ic}"></td>
</tr>
<tr>
    <td>保证出力(kW)</td>
    <td><input name="fp" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterElecInfo.fp}"></td>
</tr>
<tr>
    <td>额定水头(m)</td>
    <td><input name="rh" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterElecInfo.rh}"></td>
</tr>
<tr>
    <td>机组台数(台)</td>
    <td><input name="ut" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterElecInfo.ut}"></td>
</tr>
<tr>
    <td>多年平均发电量(万kW•h)</td>
    <td><input name="aaeo" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterElecInfo.aaeo}"></td>
</tr>
<tr>
    <td>管理单位名称</td>
    <td><input name="adnm" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterElecInfo.adnm}"></td>
</tr>
<tr>
    <td>归口管理单位代码</td>
    <td><input name="cadcd" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterElecInfo.cadcd}"></td>
</tr>
<tr>
    <td>是否划界</td>
    <td><input name="ds" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterElecInfo.ds}"></td>
</tr>
<tr>
    <td>是否确权</td>
    <td><input name="dt" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterElecInfo.dt}"></td>
</tr>
            </table>
        </form>
    </div>
</div>
