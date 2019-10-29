<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#waterGateInfoEditForm').form({
            url : '${path}/waterGateInfo/edit',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                if(isValid){
                	var tree = $('#waterGateInfoEditQy').combotree('tree');
                	if(tree.tree('getSelected')==null&&$('#waterGateInfoEditQy').combotree('getValue')!=""){
                		$('#waterGateInfoEditQy').combotree('setValue','${waterGateInfo.dscd}');
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
        
        $('#waterGateInfoEditQy').combotree({
            url : '${path }/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            width:200,
            panelHeight : 300,
            value : '${waterGateInfo.twn}',
            onClick: function(node){
        		$("#waterGateInfoEditZwQy").val(node.text);
        	}
        });
        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="padding: 3px;">
        <form id="waterGateInfoEditForm" method="post">
            <table class="grid">
                <tr>
                    <td>所在镇（街）</td>
                    <td><input name="id"  type="hidden"  value="${waterGateInfo.id}">
                    <select id="waterGateInfoEditQy" name="dscd"  style="width: 260px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select>
                    <input name="twn" id="waterGateInfoEditZwQy" type="hidden" value="${waterGateInfo.twn}" ></td>
                </tr>


<tr>
    <td>工程名称</td>
    <td><input name="prnm" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterGateInfo.prnm}"></td>
</tr>
<tr>
    <td>水资源三级分区</td>
    <td><input name="tldwr" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterGateInfo.tldwr}"></td>
</tr>
<tr>
    <td>是否为闸站工程</td>
    <td><input name="gs" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterGateInfo.gs}"></td>
</tr>
<tr>
    <td>是否为套闸工程</td>
    <td><input name="ss" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterGateInfo.ss}"></td>
</tr>
<tr>
    <td>工程状态</td>
    <td><input name="prst" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterGateInfo.prst}"></td>
</tr>
<tr>
    <td>工程等级</td>
    <td><input name="prgrd" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterGateInfo.prgrd}"></td>
</tr>
<tr>
    <td>闸孔数量(孔)</td>
    <td><input name="holeNum" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterGateInfo.holeNum}"></td>
</tr>
<tr>
    <td>闸孔总净宽(m)</td>
    <td><input name="holeWid" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterGateInfo.holeWid}"></td>
</tr>
<tr>
    <td>副闸闸孔数量(孔)</td>
    <td><input name="axHoleNum" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterGateInfo.axHoleNum}"></td>
</tr>
<tr>
    <td>闸孔总净宽(m)</td>
    <td><input name="axHoleWid" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterGateInfo.axHoleWid}"></td>
</tr>
<tr>
    <td>水闸类型</td>
    <td><input name="gateType" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterGateInfo.gateType}"></td>
</tr>
<tr>
    <td>分洪闸过闸流量(m³/s)</td>
    <td><input name="fdsq" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterGateInfo.fdsq}"></td>
</tr>
<tr>
    <td>节制闸过闸流量</td>
    <td><input name="cgq" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterGateInfo.cgq}"></td>
</tr>
<tr>
    <td>排水闸过闸流量</td>
    <td><input name="dsq" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterGateInfo.dsq}"></td>
</tr>
<tr>
    <td>挡潮闸过闸流量</td>
    <td><input name="tbq" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterGateInfo.tbq}"></td>
</tr>
<tr>
    <td>橡胶坝坝高</td>
    <td><input name="rdh" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterGateInfo.rdh}"></td>
</tr>
<tr>
    <td>橡胶坝坝长</td>
    <td><input name="rdl" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterGateInfo.rdl}"></td>
</tr>
<tr>
    <td>归口管理部门代码</td>
    <td><input name="cadcd" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterGateInfo.cadcd}"></td>
</tr>
<tr>
    <td>管理单位编码</td>
    <td><input name="adcd" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterGateInfo.adcd}"></td>
</tr>
<tr>
    <td>是否划界</td>
    <td><input name="ds" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterGateInfo.ds}"></td>
</tr>
<tr>
    <td>是否确权</td>
    <td><input name="dt" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterGateInfo.dt}"></td>
</tr>
<tr>
    <td>管理单位名称</td>
    <td><input name="adnm" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${waterGateInfo.adnm}"></td>
</tr>
                <tr>
                    <td>经度(°)</td>
                    <td><input id="waterGateInfoEditJd" name="lgtd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" value="${waterGateInfo.lgtd}"><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="selMap('waterGateInfoEditJd','waterGateInfoEditWd');">查看地图</a></td>
                </tr>
                <tr>
                    <td>纬度(°)</td>
                    <td><input id="waterGateInfoEditWd" name="lttd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" value="${waterGateInfo.lttd}"></td>
                </tr>
               
            </table>
        </form>
    </div>
</div>