<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#dangerPointsInfoEditForm').form({
            url : '${path}/dangerPointsInfo/edit',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                if(isValid){
                	var tree = $('#dangerPointsInfoEditQy').combotree('tree');
                	if(tree.tree('getSelected')==null&&$('#dangerPointsInfoEditQy').combotree('getValue')!=""){
                		$('#dangerPointsInfoEditQy').combotree('setValue','${dangerPointsInfo.dscd}');
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

       $('#dangerPointsInfoEditQy').combotree({
    	    url : '${path }/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            width:200,
            panelHeight : 300,
            value : '${dangerPointsInfo.twn}',
            onClick: function(node){
        		$("#dangerPointsInfoEditZwQy").val(node.text);
        	}
        });

    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="padding: 3px;">
        <form id="dangerPointsInfoEditForm" method="post">
            <table class="grid">
            	<tr>
                    <td>所在镇（街）</td>
                    <td>
                    <input name="id"  type="hidden"  value="${dangerPointsInfo.id}">
                    <select id="dangerPointsInfoEditQy" name="dscd"  style="width: 260px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select>
                    <input name="twn" id="dangerPointsInfoEditZwQy" type="hidden" value="${dangerPointsInfo.twn}" ></td>
                </tr>


<tr>
    <td>村</td>
    <td><input name="vl" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerPointsInfo.vl}"></td>
</tr><tr>
    <td>隐患点（片)位置</td>
    <td><input name="add" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerPointsInfo.add}"></td>
</tr><tr>
    <td>灾害类型</td>
    <td><input name="dstype" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerPointsInfo.dstype}"></td>
</tr><tr>
    <td>灾害体规模</td>
    <td><input name="dssc" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerPointsInfo.dssc}"></td>
</tr><tr>
    <td>稳定性</td>
    <td><input name="st" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerPointsInfo.st}"></td>
</tr><tr>
    <td>受威胁人数</td>
    <td><input name="thpp" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerPointsInfo.thpp}"></td>
</tr><tr>
    <td>潜在经济损失（万元）</td>
    <td><input name="lsec" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerPointsInfo.lsec}"></td>
</tr><tr>
    <td>监测人</td>
    <td><input name="mndof" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerPointsInfo.mndof}"></td>
</tr><tr>
    <td>联系电话</td>
    <td><input name="tell" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerPointsInfo.tell}"></td>
</tr><tr>
    <td>防治对策</td>
    <td><input name="prms" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerPointsInfo.prms}"></td>
</tr><tr>
    <td>备注</td>
    <td><input name="comments" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerPointsInfo.comments}"></td>
</tr><tr>
    <td>行政村</td>
    <td><input name="advil" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerPointsInfo.advil}"></td>
</tr><tr>
    <td>村组</td>
    <td><input name="gr" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerPointsInfo.gr}"></td>
</tr><tr>
    <td>重要设施及企业</td>
    <td><input name="imfc" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerPointsInfo.imfc}"></td>
</tr><tr>
    <td>责任主体</td>
    <td><input name="subtl" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerPointsInfo.subtl}"></td>
</tr><tr>
    <td>实施单位</td>
    <td><input name="exsc" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerPointsInfo.exsc}"></td>
</tr><tr>
    <td>整治目标</td>
    <td><input name="rntr" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerPointsInfo.rntr}"></td>
</tr><tr>
    <td>是否完成</td>
    <td><input name="cm" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerPointsInfo.cm}"></td>
</tr><tr>
    <td>监管单位</td>
    <td><input name="rgsc" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerPointsInfo.rgsc}"></td>
</tr><tr>
    <td></td>
    <td><input name="rntr1" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerPointsInfo.rntr1}"></td>
</tr><tr>
    <td>整治措施</td>
    <td><input name="rnms" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerPointsInfo.rnms}"></td>
</tr><tr>
    <td>完成期限</td>
    <td><input name="ddl" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerPointsInfo.ddl}"></td>
</tr><tr>
    <td>进展情况</td>
    <td><input name="prg" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${dangerPointsInfo.prg}"></td>
</tr>
                <tr>
                    <td>经度(°)</td>
                    <td><input id="dangerPointsInfoEditJd" name="lgtd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5,required:true" type="text" value="${dangerPointsInfo.lgtd}"><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="selMap('dangerPointsInfoEditJd','dangerPointsInfoEditWd');">查看地图</a></td>
                </tr>
                <tr>
                    <td>纬度(°)</td>
                    <td><input id="dangerPointsInfoEditWd" name="lttd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5,required:true" type="text" value="${dangerPointsInfo.lttd}"></td>
                </tr>

            </table>
        </form>
    </div>
</div>
