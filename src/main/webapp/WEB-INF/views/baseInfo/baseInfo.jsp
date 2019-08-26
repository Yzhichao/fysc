<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var baseInfoDataGrid;
    $(function() {
        baseInfoDataGrid = $('#baseInfoDataGrid').datagrid({
        url : '${path}/baseInfo/dataGrid',
        striped : true,
        rownumbers : true,
        pagination : true,
        singleSelect : true,
        idField : 'id',
        sortName : 'id',
        sortOrder : 'asc',
        pageSize : 20,
        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500],
        columns : [ [ {
            width : '60',
            title : '编号',
            field : 'id',
            sortable : true,
            hidden : true
        },{
            width : '250',
            title : '镇（街）',
            field : 'zhen',
            sortable : true
        },{
            width : '80',
            title : '极高危险区户',
            field : 'jgwxq_hu',
            sortable : true
        },{
            width : '80',
            title : '极高危险区人',
            field : 'jgwxq_ren',
            sortable : true
        },{
            width : '80',
            title : '高危险区户',
            field : 'gwxq_hu',
            sortable : true
        },{
            width : '80',
            title : '高危险区人',
            field : 'gwxq_ren',
            sortable : true
        },{
            width : '80',
            title : '危险区户',
            field : 'wxq_hu',
            sortable : true
        },{
            width : '80',
            title : '危险区人',
            field : 'wxq_ren',
            sortable : true
        },{
            width : '120',
            title : '无线预警广播',
            field : 'wxyjgb',
            sortable : true
        },{
            width : '120',
            title : '雨量报警站',
            field : 'ylbjz',
            sortable : true
        },{
            width : '120',
            title : '水位报警站',
            field : 'swbjz',
            sortable : true
        },{
            field : 'action',
            title : '操作',
            width : 200,
            formatter : function(value, row, index) {
                var str = '';
                <shiro:hasPermission name="/baseInfo/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="baseInfo-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="baseInfoEditFun(\'{0}\');" >编辑</a>', row.id);
                </shiro:hasPermission>
                <shiro:hasPermission name="/baseInfo/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="baseInfo-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="baseInfoDeleteFun(\'{0}\');" >删除</a>', row.id);
                </shiro:hasPermission>
                return str;
            }
        } ] ],
        onLoadSuccess:function(data){
            $('.baseInfo-easyui-linkbutton-edit').linkbutton({text:'编辑'});
            $('.baseInfo-easyui-linkbutton-del').linkbutton({text:'删除'});
        },
        toolbar : '#baseInfoToolbar'
    });
        $('#qy').combotree({
            url : '${path}/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            panelHeight : 300
        });
});

/**
 * 添加框
 * @param url
 */
function baseInfoAddFun() {
    parent.$.modalDialog({
        title : '添加',
        width : 700,
        height : 600,
        href : '${path}/baseInfo/addPage',
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = baseInfoDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#baseInfoAddForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 编辑
 */
function baseInfoEditFun(id) {
    if (id == undefined) {
        var rows = baseInfoDataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        baseInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.modalDialog({
        title : '编辑',
        width : 700,
        height : 600,
        href :  '${path}/baseInfo/editPage?id=' + id,
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = baseInfoDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#baseInfoEditForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 删除
 */
 function baseInfoDeleteFun(id) {
     if (id == undefined) {//点击右键菜单才会触发这个
         var rows = baseInfoDataGrid.datagrid('getSelections');
         id = rows[0].id;
     } else {//点击操作里面的删除图标会触发这个
         baseInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
     }
     parent.$.messager.confirm('询问', '您是否要删除当前记录？', function(b) {
         if (b) {
             progressLoad();
             $.post('${path}/baseInfo/delete', {
                 id : id
             }, function(result) {
                 if (result.success) {
                     parent.$.messager.alert('提示', result.msg, 'info');
                     baseInfoDataGrid.datagrid('reload');
                 }
                 progressClose();
             }, 'JSON');
         }
     });
}


/**
 * 清除
 */
function baseInfoCleanFun() {
    $('#baseInfoSearchForm input').val('');
    baseInfoDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function baseInfoSearchFun() {
     baseInfoDataGrid.datagrid('load', $.serializeObject($('#baseInfoSearchForm')));
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 35px; overflow: hidden;background-color: #fff">
        <form id="baseInfoSearchForm">
            <table>
                <tr>
                	<th style="width:32px;">区域:</th>
	                <td><select id="qy" name="dscd" style="width: 143px; height: 22px;"></select></td>
                    <th>镇（街）:</th>
                    <td><input name="zhen" class="easyui-textbox" /></td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="baseInfoSearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="baseInfoCleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
     </div>
 
    <div data-options="region:'center',border:false">
        <table id="baseInfoDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="baseInfoToolbar" style="display: none;">
    <shiro:hasPermission name="/baseInfo/add">
        <a onclick="baseInfoAddFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-page-add'">添加</a>
    </shiro:hasPermission>
</div>