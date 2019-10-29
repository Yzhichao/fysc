<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#difangInfoEditForm').form({
            url : '${path}/difangInfo/edit',
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
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    parent.$.messager.alert('错误', result.msg, 'error');
                }
            }
        });

       $('#difangInfoEditQy').combotree({
    	    url : '${path }/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            width:200,
            panelHeight : 300,
            value : '${difangInfo.dscd}'
        });

    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="padding: 3px;">
        <form id="difangInfoEditForm" method="post">
            <table class="grid">
            	<tr>
                    <td>区域</td>
                    <td>
                    	<input name="id"  type="hidden"  value="${difangInfo.id}">
                    	<select id="difangInfoEditQy" name="dscd"  style="width: 260px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select>
                    </td>
                </tr>
<tr>
    <td>堤防名称</td>
    <td><input name="dknm" data-options="required:true" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${difangInfo.dknm}"></td>
</tr><tr>
    <td>河流岸别</td>
    <td><input name="rvbk" data-options="required:true" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${difangInfo.rvbk}"></td>
</tr><tr>
    <td>堤防跨界情况</td>
    <td><input name="dkcr" data-options="required:true" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${difangInfo.dkcr}"></td>
</tr><tr>
    <td>堤防类型</td>
    <td><input name="dktype" data-options="required:true" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${difangInfo.dktype}"></td>
</tr><tr>
    <td>堤防型式</td>
    <td><input name="dktype1" data-options="required:true" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${difangInfo.dktype1}"></td>
</tr><tr>
    <td>工程状态</td>
    <td><input name="prst" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${difangInfo.prst}"></td>
</tr><tr>
    <td>规划防洪标准(年)</td>
    <td><input name="plflst" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${difangInfo.plflst}"></td>
</tr><tr>
    <td>堤防长度(m)</td>
    <td><input name="dklen" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${difangInfo.dklen}"></td>
</tr><tr>
    <td>达到规划标准长度</td>
    <td><input name="acpllen" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${difangInfo.acpllen}"></td>
</tr><tr>
    <td>归口管理部门代码</td>
    <td><input name="cadcd" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${difangInfo.cadcd}"></td>
</tr><tr>
    <td>管理单位名称</td>
    <td><input name="adnm" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${difangInfo.adnm}"></td>
</tr><tr>
    <td>是否划界</td>
    <td><input name="ds" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${difangInfo.ds}"></td>
</tr><tr>
    <td>是否确界</td>
    <td><input name="dt" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${difangInfo.dt}"></td>
</tr><tr>
    <td>堤防全名</td>
    <td><input name="dktnm" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${difangInfo.dktnm}"></td>
</tr><tr>
    <td>起x</td>
    <td><input name="stlgtd" id="stlgtd" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${difangInfo.stlgtd}" data-options="min:0,precision:5,required:true">
    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="selMap('stlgtd','stlttd');">查看地图</a>
    </td>
</tr><tr>
    <td>起y</td>
    <td><input name="stlttd" id="stlttd" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${difangInfo.stlttd}" data-options="min:0,precision:5,required:true"></td>
</tr><tr>
    <td>终x</td>
    <td><input name="endlgtd" id="endlgtd" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${difangInfo.endlgtd}" data-options="min:0,precision:5,required:true">
    <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="selMap('endlgtd','endlttd');">查看地图</a>
    </td>
</tr><tr>
    <td>终y</td>
    <td><input name="endlttd" id="endlttd" style="height: 29px;width:260px;" class="easyui-textbox" type="text" value="${difangInfo.endlttd}" data-options="min:0,precision:5,required:true"></td>
</tr>
            </table>
        </form>
    </div>
</div>
