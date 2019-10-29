<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#dangerAreaInfoEditForm').form({
            url : '${path}/dangerAreaInfo/edit',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                if(isValid){
                	var tree = $('#dangerAreaInfoEditQy').combotree('tree');
                	if(tree.tree('getSelected')==null&&$('#dangerAreaInfoEditQy').combotree('getValue')!=""){
                		$('#dangerAreaInfoEditQy').combotree('setValue','${dangerAreaInfo.dscd}');
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
        
       $('#dangerAreaInfoEditQy').combotree({
    	    url : '${path }/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            width:200,
            panelHeight : 300,
            value : '${dangerAreaInfo.twn}',
            onClick: function(node){
        		$("#dangerAreaInfoEditZwQy").val(node.text);
        	}
        });
        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="padding: 3px;">
        <form id="dangerAreaInfoEditForm" method="post">
            <table class="grid">
            	<tr>
                    <td>所在镇（街）</td>
                    <td>
                    <input name="id"  type="hidden"  value="${dangerAreaInfo.id}">
                    <select id="dangerAreaInfoEditQy" name="dscd"  style="width: 260px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select>
                    <input name="twn" id="dangerAreaInfoEditZwQy" type="hidden" value="${dangerAreaInfo.twn}" ></td>
                </tr>
                <tr>
				    <td>位置</td>
				    <td><input name="add" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerAreaInfo.add}"></td>
				</tr><tr>
				    <td>危险区名</td>
				    <td><input name="dzName" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerAreaInfo.dzName}"></td>
				</tr><tr>
				    <td>易受灾类型</td>
				    <td><input name="afType" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerAreaInfo.afType}"></td>
				</tr><tr>
				    <td>房屋数量</td>
				    <td><input name="hsNum" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerAreaInfo.hsNum}"></td>
				</tr><tr>
				    <td>受威胁人数</td>
				    <td><input name="thpp" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerAreaInfo.thpp}"></td>
				</tr><tr>
				    <td>重要设施、厂矿企业</td>
				    <td><input name="imfc" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerAreaInfo.imfc}"></td>
				</tr><tr>
				    <td>预警方式（铜锣、手摇报警器）</td>
				    <td><input name="wrWay" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerAreaInfo.wrWay}"></td>
				</tr><tr>
				    <td>备注</td>
				    <td><input name="comments" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerAreaInfo.comments}"></td>
				</tr><tr>
				    <td>最近一次受灾情况</td>
				    <td><input name="ltaf" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerAreaInfo.ltaf}"></td>
				</tr>
                <tr>
                    <td>经度(°)</td>
                    <td><input id="dangerAreaInfoEditJd" name="lgtd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" value="${dangerAreaInfo.lgtd}"><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="selMap('dangerAreaInfoEditJd','dangerAreaInfoEditWd');">查看地图</a></td>
                </tr>
                <tr>
                    <td>纬度(°)</td>
                    <td><input id="dangerAreaInfoEditWd" name="lttd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" value="${dangerAreaInfo.lttd}"></td>
                </tr>
            </table>
        </form>
    </div>
</div>