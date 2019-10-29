<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#rescueGroupInfoEditForm').form({
            url : '${path}/rescueGroupInfo/edit',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                if(isValid){
                	var tree = $('#rescueGroupInfoEditQy').combotree('tree');
                	if(tree.tree('getSelected')==null&&$('#rescueGroupInfoEditQy').combotree('getValue')!=""){
                		$('#rescueGroupInfoEditQy').combotree('setValue','${rescueGroupInfo.dscd}');
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
        
       $('#rescueGroupInfoEditQy').combotree({
    	    url : '${path }/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            width:200,
            panelHeight : 300,
            value : '${rescueGroupInfo.twn}',
            onClick: function(node){
        		$("#rescueGroupInfoEditZwQy").val(node.text);
        	}
        });
        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="rescueGroupInfoEditForm" method="post">
            <table class="grid">
            	<tr>
                    <td>所在镇（街）</td>
                    <td>
                    <input name="id"  type="hidden"  value="${rescueGroupInfo.id}">
                    <select id="rescueGroupInfoEditQy" name="dscd"  style="width: 260px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select>
                    <input name="twn" id="rescueGroupInfoEditZwQy" type="hidden" value="${rescueGroupInfo.twn}" ></td>
                </tr>


<tr>
    <td>名称</td>
    <td><input name="name" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${rescueGroupInfo.name}"></td>
</tr>
<tr>
    <td>人数</td>
    <td><input name="pp" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${rescueGroupInfo.pp}"></td>
</tr>
<tr>
    <td>所属部门</td>
    <td><input name="ad" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${rescueGroupInfo.ad}"></td>
</tr>
<tr>
    <td>负责人</td>
    <td><input name="head" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${rescueGroupInfo.head}"></td>
</tr>
<tr>
    <td>联系电话</td>
    <td><input name="tell" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${rescueGroupInfo.tell}"></td>
</tr>
<tr>
    <td>为民间</td>
    <td><input name="folk" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${rescueGroupInfo.folk}"></td>
</tr>
<tr>
    <td>备注</td>
    <td><input name="comments" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${rescueGroupInfo.comments}"></td>
</tr>
<tr>
    <td>队伍级别</td>
    <td><input name="trGrd" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${rescueGroupInfo.trGrd}"></td>
</tr>
               <tr>
                    <td>经度(°)</td>
                    <td><input id="rescueGroupInfoEditJd" name="lgtd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" value="${rescueGroupInfo.lgtd}"><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="selMap('rescueGroupInfoEditJd','rescueGroupInfoEditWd');">查看地图</a></td>
                </tr>
                <tr>
                    <td>纬度(°)</td>
                    <td><input id="rescueGroupInfoEditWd" name="lttd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" value="${rescueGroupInfo.lttd}"></td>
                </tr>
            </table>
        </form>
    </div>
</div>