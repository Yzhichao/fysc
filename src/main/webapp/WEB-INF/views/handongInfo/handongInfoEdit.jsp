<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#handongInfoEditForm').form({
            url : '${path}/handongInfo/edit',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                if(isValid){
                	var tree = $('#handongInfoEditQy').combotree('tree');
                	if(tree.tree('getSelected')==null&&$('#handongInfoEditQy').combotree('getValue')!=""){
                		$('#handongInfoEditQy').combotree('setValue','${handongInfo.dscd}');
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
        
       $('#handongInfoEditQy').combotree({
    	    url : '${path }/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            width:200,
            panelHeight : 300,
            value : '${handongInfo.addvnm}',
            onClick: function(node){
        		$("#handongInfoEditZwQy").val(node.text);
        	}
        });
        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="handongInfoEditForm" method="post">
            <table class="grid">
            	<tr>
                    <td>所在镇（街）</td>
                    <td>
                    <input name="id"  type="hidden"  value="${handongInfo.id}">
                    <select id="handongInfoEditQy" name="dscd"  style="width: 260px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select>
                    <input name="twn" id="handongInfoEditZwQy" type="hidden" value="${handongInfo.twn}" ></td>
                </tr>
				<tr>
				    <td>村</td>
				    <td><input name="vl" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${handongInfo.vl}"></td>
				</tr>
<%-- 				<tr>
				    <td>行政区代码</td>
				    <td><input name="addvcd" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${handongInfo.addvcd}"></td>
				</tr> --%>
				<tr>
				    <td>行政区名称</td>
				    <td><input name="addvnm" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${handongInfo.addvnm}"></td>
				</tr>
				<tr>
				    <td>涵洞名称</td>
				    <td><input name="holeName" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${handongInfo.holeName}"></td>
				</tr>
				<tr>
				    <td>涵洞类型</td>
				    <td><input name="holeType" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${handongInfo.holeType}"></td>
				</tr>
				<tr>
				    <td>洞身高（m）</td>
				    <td><input name="holeHight" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${handongInfo.holeHight}"></td>
				</tr>
				<tr>
				    <td>洞身宽或直径（m）</td>
				    <td><input name="holeWid" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${handongInfo.holeWid}"></td>
				</tr>
                <tr>
                    <td>经度（°）</td>
                    <td><input id="handongInfoEditJd" name="lgtd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" value="${handongInfo.lgtd}"><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="selMap('handongInfoEditJd','handongInfoEditWd');">查看地图</a></td>
                </tr>
                <tr>
                    <td>纬度（°）</td>
                    <td><input id="handongInfoEditWd" name="lttd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" value="${handongInfo.lttd}"></td>
                </tr>
            </table>
        </form>
    </div>
</div>