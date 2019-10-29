<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#goodsRepositoryEditForm').form({
            url : '${path}/goodsRepository/edit',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                if(isValid){
                	var tree = $('#goodsRepositoryEditQy').combotree('tree');
                	if(tree.tree('getSelected')==null&&$('#goodsRepositoryEditQy').combotree('getValue')!=""){
                		$('#goodsRepositoryEditQy').combotree('setValue','${goodsRepository.dscd}');
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
        
       $('#goodsRepositoryEditQy').combotree({
    	    url : '${path }/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            width:200,
            panelHeight : 300,
            value : '${goodsRepository.twn}',
            onClick: function(node){
        		$("#goodsRepositoryEditZwQy").val(node.text);
        	}
        });
        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="goodsRepositoryEditForm" method="post">
            <table class="grid">
            	<tr>
                    <td>所在镇（街）</td>
                    <td>
                    <input name="id"  type="hidden"  value="${goodsRepository.id}">
                    <select id="goodsRepositoryEditQy" name="dscd"  style="width: 260px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select>
                    <input name="twn" id="goodsRepositoryEditZwQy" type="hidden" value="${goodsRepository.twn}" ></td>
                </tr>
				<tr>
				    <td>名称</td>
				    <td><input name="name" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${goodsRepository.name}"></td>
				</tr><tr>
				    <td>负责人</td>
				    <td><input name="head" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${goodsRepository.head}"></td>
				</tr><tr>
				    <td>联系电话</td>
				    <td><input name="tell" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${goodsRepository.tell}"></td>
				</tr><tr>
				    <td>仓库级别</td>
				    <td><input name="wrGrd" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${goodsRepository.wrGrd}"></td>
				</tr><tr>
				    <td>位置</td>
				    <td><input name="add" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${goodsRepository.add}"></td>
				</tr><tr>
				    <td>备注</td>
				    <td><input name="comments" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${goodsRepository.comments}"></td>
				</tr>
                <tr>
                    <td>经度(°)</td>
                    <td><input id="goodsRepositoryEditJd" name="lgtd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" value="${goodsRepository.lgtd}"><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="selMap('goodsRepositoryEditJd','goodsRepositoryEditWd');">查看地图</a></td>
                </tr>
                <tr>
                    <td>纬度(°)</td>
                    <td><input id="goodsRepositoryEditWd" name="lttd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" value="${goodsRepository.lttd}"></td>
                </tr>
            </table>
        </form>
    </div>
</div>