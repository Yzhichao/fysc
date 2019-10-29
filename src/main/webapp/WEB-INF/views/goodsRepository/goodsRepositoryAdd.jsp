<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#goodsRepositoryAddForm').form({
            url : '${path}/goodsRepository/add',
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
         $('#goodsRepositoryAddQy').combotree({
        	url : '${path }/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            width:200,
            panelHeight : 300,
            onClick: function(node){
        		$("#goodsRepositoryAddZwQy").val(node.text);
        	}
        });
    });


</script>
<div class="easyui-layout" data-options="fit:true,border:false" >
    <div data-options="region:'center',border:false" style="overflow: hidden;padding: 3px;" >
        <form id="goodsRepositoryAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>所在镇（街）</td>
                    <td>
                    	<select id="goodsRepositoryAddQy" name="dscd"  style="width: 260px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select>
                    	<input name="twn" id="goodsRepositoryAddZwQy" type="hidden">
                    </td>
                </tr>
				<tr>
				    <td>名称</td>
				    <td><input name="name" data-options="required:true" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
				</tr>
				<tr>
				    <td>负责人</td>
				    <td><input name="head" data-options="required:true" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
				</tr>
				<tr>
				    <td>联系电话</td>
				    <td><input name="tell" data-options="required:true" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
				</tr>
				<tr>
				    <td>仓库级别</td>
				    <td><input name="wrGrd" data-options="required:true" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
				</tr>
				<tr>
				    <td>位置</td>
				    <td><input name="add" data-options="required:true" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
				</tr>
				<tr>
				    <td>备注</td>
				    <td><input name="comments" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
				</tr>
                <tr>
                    <td>经度(°)</td>
                    <td><input id="goodsRepositoryAddJd" name="lgtd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5,required:true" type="text" ><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="selMap('goodsRepositoryAddJd','goodsRepositoryAddWd');">查看地图</a></td>
                </tr>
                <tr>
                    <td>纬度(°)</td>
                    <td><input id="goodsRepositoryAddWd" name="lttd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5,required:true" type="text" ></td>
                </tr>
            </table>
        </form>
    </div>
</div>
