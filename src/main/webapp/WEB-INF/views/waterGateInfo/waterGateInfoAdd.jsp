<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#waterGateInfoAddForm').form({
            url : '${path}/waterGateInfo/add',
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
        $('#waterGateInfoAddQy').combotree({
            url : '${path }/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            width:200,
            panelHeight : 300,
            onClick: function(node){
        		$("#waterGateInfoAddZwQy").val(node.text);
        	}
        });
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false" >
    <div data-options="region:'center',border:false" style="padding: 3px;" >
        <form id="waterGateInfoAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>所在镇（街）</td>
                    <td>
                    	<select id="waterGateInfoAddQy" name="dscd"  style="width: 260px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select>
                    	<input name="twn" id="waterGateInfoAddZwQy" type="hidden">
                    </td>
                </tr>
<tr>
    <td>工程名称</td>
    <td><input name="prnm" data-options="required:true" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>水资源三级分区</td>
    <td><input name="tldwr" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>是否为闸站工程</td>
    <td><input name="gs" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>是否为套闸工程</td>
    <td><input name="ss" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>工程状态</td>
    <td><input name="prst" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>工程等级</td>
    <td><input name="prgrd" style="height: 29px;width:260px;" data-options="required:true" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>闸孔数量(孔)</td>
    <td><input name="holeNum" data-options="required:true" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>闸孔总净宽(m)</td>
    <td><input name="holeWid" data-options="required:true" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>副闸闸孔数量(孔)</td>
    <td><input name="axHoleNum" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>闸孔总净宽(m)</td>
    <td><input name="axHoleWid" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>水闸类型</td>
    <td><input name="gateType" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>分洪闸过闸流量(m³/s)</td>
    <td><input name="fdsq" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>节制闸过闸流量</td>
    <td><input name="cgq" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>排水闸过闸流量</td>
    <td><input name="dsq" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>挡潮闸过闸流量</td>
    <td><input name="tbq" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>橡胶坝坝高</td>
    <td><input name="rdh" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>橡胶坝坝长</td>
    <td><input name="rdl" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>归口管理部门代码</td>
    <td><input name="cadcd" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>管理单位编码</td>
    <td><input name="adcd" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>是否划界</td>
    <td><input name="ds" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>是否确权</td>
    <td><input name="dt" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>管理单位名称</td>
    <td><input name="adnm" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>

                <tr>
                    <td>经度(°)</td>
                    <td><input id="waterGateInfoAddJd" name="lgtd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5,required:true" type="text" ><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="selMap('waterGateInfoAddJd','waterGateInfoAddWd');">查看地图</a></td>
                </tr>
                <tr>
                    <td>纬度(°)</td>
                    <td><input id="waterGateInfoAddWd" name="lttd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5,required:true" type="text" ></td>
                </tr>
            </table>
        </form>
    </div>
</div>
