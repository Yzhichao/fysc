<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#yanbaInfoAddForm').form({
            url : '${path}/yanbaInfo/add',
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
         $('#yanbaInfoAddQy').combotree({
        	url : '${path }/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            width:200,
            panelHeight : 300,
            onClick: function(node){
        		$("#yanbaInfoAddZwQy").val(node.text);
        	}
        });
    });
    
   
</script>
<div class="easyui-layout" data-options="fit:true,border:false" >
    <div data-options="region:'center',border:false" style="overflow: hidden;padding: 3px;" >
        <form id="yanbaInfoAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>行政区</td>
                    <td>
                    	<select id="yanbaInfoAddQy" name="dscd"  style="width: 260px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select>
                    	<input name="twn" id="yanbaInfoAddZwQy" type="hidden">
                    </td>
                </tr>
<!--                 <tr>
				    <td>行政区名称</td>
				    <td><input name="addvnm" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
				</tr>   -->              
<tr>
    <td>堰坝名称</td>
    <td><input name="wrName" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>所在河道</td>
    <td><input name="rv" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>堰坝类型</td>
    <td><input name="wrType" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>容积（m^3)</td>
    <td><input name="cp" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>坝高（m）</td>
    <td><input name="damHight" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>备注</td>
    <td><input name="comments" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>

                <tr>
                    <td>经度(°)</td>
                    <td><input id="yanbaInfoAddJd" name="lgtd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" ><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="selMap('yanbaInfoAddJd','yanbaInfoAddWd');">查看地图</a></td>
                </tr>
                <tr>
                    <td>纬度(°)</td>
                    <td><input id="yanbaInfoAddWd" name="lttd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" ></td>
                </tr>
            </table>
        </form>
    </div>
</div>