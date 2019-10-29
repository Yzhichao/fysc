<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#yanbaInfoEditForm').form({
            url : '${path}/yanbaInfo/edit',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                if(isValid){
                	var tree = $('#yanbaInfoEditQy').combotree('tree');
                	if(tree.tree('getSelected')==null&&$('#yanbaInfoEditQy').combotree('getValue')!=""){
                		$('#yanbaInfoEditQy').combotree('setValue','${yanbaInfo.dscd}');
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
        
       $('#yanbaInfoEditQy').combotree({
    	    url : '${path }/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            width:200,
            panelHeight : 300,
            value : '${yanbaInfo.twn}',
            onClick: function(node){
        		$("#yanbaInfoEditZwQy").val(node.text);
        	}
        });
        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="yanbaInfoEditForm" method="post">
            <table class="grid">
            	<tr>
                    <td>行政区</td>
                    <td>
                    <input name="id"  type="hidden"  value="${yanbaInfo.id}">
                    <select id="yanbaInfoEditQy" name="dscd"  style="width: 260px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select>
                    <input name="twn" id="yanbaInfoEditZwQy" type="hidden" value="${yanbaInfo.twn}" ></td>
                </tr>
<%--                 
                <tr>
				    <td>行政区名称</td>
				    <td><input name="addvnm" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${yanbaInfo.addvnm}"></td>
				</tr>
				
				 --%>
				<tr>
				    <td>堰坝名称</td>
				    <td><input name="wrName" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${yanbaInfo.wrName}"></td>
				</tr>
				<tr>
				    <td>所在河道</td>
				    <td><input name="rv" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${yanbaInfo.rv}"></td>
				</tr>
				<tr>
				    <td>堰坝类型</td>
				    <td><input name="wrType" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${yanbaInfo.wrType}"></td>
				</tr>
				<tr>
				    <td>容积（m^3)</td>
				    <td><input name="cp" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${yanbaInfo.cp}"></td>
				</tr>
				<tr>
				    <td>坝高（m^3)</td>
				    <td><input name="damHight" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${yanbaInfo.damHight}"></td>
				</tr>
				<tr>
				    <td>备注</td>
				    <td><input name="comments" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${yanbaInfo.comments}"></td>
				</tr>
				<tr>
                    <td>经度(°)</td>
                    <td><input id="yanbaInfoEditJd" name="lgtd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" value="${yanbaInfo.lgtd}"><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="selMap('yanbaInfoEditJd','yanbaInfoEditWd');">查看地图</a></td>
                </tr>
                <tr>
                    <td>纬度(°)</td>
                    <td><input id="yanbaInfoEditWd" name="lttd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" value="${yanbaInfo.lttd}"></td>
                </tr>                
            </table>
        </form>
    </div>
</div>