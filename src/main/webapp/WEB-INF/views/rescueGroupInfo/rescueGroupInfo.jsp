<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var rescueGroupInfoDataGrid;
    $(function() {
        rescueGroupInfoDataGrid = $('#rescueGroupInfoDataGrid').datagrid({
        url : '${path}/rescueGroupInfo/dataGrid',
        striped : true,
        rownumbers : true,
        pagination : true,
        singleSelect : true,
        idField : 'ID',
        sortName : 'ID',
        sortOrder : 'asc',
        pageSize : 20,
        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500],
        columns : [ [ {
            width : '60',
            title : '编号',
            field : 'ID',
            ssortable : true,
            hidden : true
        },{
    width : '120',
    title : '名称',
    field : 'NAME',
    sortable : true
},{
    width : '120',
    title : '经度(°)',
    field : 'LGTD',
    sortable : true
},{
    width : '120',
    title : '纬度(°)',
    field : 'LTTD',
    sortable : true
},{
    width : '120',
    title : '人数',
    field : 'PP',
    sortable : true
},{
    width : '120',
    title : '所属部门',
    field : 'AD',
    sortable : true
},{
    width : '120',
    title : '负责人',
    field : 'HEAD',
    sortable : true
},{
    width : '120',
    title : '联系电话',
    field : 'TELL',
    sortable : true
},{
    width : '120',
    title : '为民间',
    field : 'FOLK',
    sortable : true
},{
    width : '120',
    title : '备注',
    field : 'COMMENTS',
    sortable : true
},{
    width : '120',
    title : '镇名',
    field : 'TWN',
    sortable : true
},{
    width : '120',
    title : '队伍级别',
    field : 'TR_GRD',
    sortable : true
},{
            field : 'action',
            title : '操作',
            width : 200,
            formatter : function(value, row, index) {
                var str = '';
                <shiro:hasPermission name="/rescueGroupInfo/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="rescueGroupInfo-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="rescueGroupInfoEditFun(\'{0}\');" >编辑</a>', row.ID);
                </shiro:hasPermission>
                <shiro:hasPermission name="/rescueGroupInfo/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="rescueGroupInfo-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="rescueGroupInfoDeleteFun(\'{0}\');" >删除</a>', row.ID);
                </shiro:hasPermission>
                return str;
            }
        } ] ],
        onLoadSuccess:function(data){
            $('.rescueGroupInfo-easyui-linkbutton-edit').linkbutton({text:'编辑'});
            $('.rescueGroupInfo-easyui-linkbutton-del').linkbutton({text:'删除'});
        },
        toolbar : '#rescueGroupInfoToolbar'
    });
    $('#rescueGroupInfoQy').combotree({
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
function rescueGroupInfoAddFun() {
    parent.$.modalDialog({
        title : '添加',
        width : 700,
        height : 600,
        href : '${path}/rescueGroupInfo/addPage',
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = rescueGroupInfoDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#rescueGroupInfoAddForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 编辑
 */
function rescueGroupInfoEditFun(id) {
    if (id == undefined) {
        var rows = rescueGroupInfoDataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        rescueGroupInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.modalDialog({
        title : '编辑',
        width : 700,
        height : 600,
        href :  '${path}/rescueGroupInfo/editPage?id=' + id,
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = rescueGroupInfoDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#rescueGroupInfoEditForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 删除
 */
 function rescueGroupInfoDeleteFun(id) {
     if (id == undefined) {//点击右键菜单才会触发这个
         var rows = rescueGroupInfoDataGrid.datagrid('getSelections');
         id = rows[0].id;
     } else {//点击操作里面的删除图标会触发这个
         rescueGroupInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
     }
     parent.$.messager.confirm('询问', '您是否要删除当前记录？', function(b) {
         if (b) {
             progressLoad();
             $.post('${path}/rescueGroupInfo/delete', {
                 id : id
             }, function(result) {
                 if (result.success) {
                     parent.$.messager.alert('提示', result.msg, 'info');
                     rescueGroupInfoDataGrid.datagrid('reload');
                 }
                 progressClose();
             }, 'JSON');
         }
     });
}


/**
 * 清除
 */
function rescueGroupInfoCleanFun() {
    $('#rescueGroupInfoSearchForm input').val('');
    rescueGroupInfoDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function rescueGroupInfoSearchFun() {
     rescueGroupInfoDataGrid.datagrid('load', $.serializeObject($('#rescueGroupInfoSearchForm')));
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 35px; overflow: hidden;background-color: #fff">
        <form id="rescueGroupInfoSearchForm">
            <table>
                <tr>
                	<th style="width:32px;">区域:</th>
	                <td><select id="rescueGroupInfoQy" name="dscd" style="width: 143px; height: 22px;"></select></td>
                    <th>名称:</th>
                    <td><input name="name" class="easyui-textbox" /></td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="rescueGroupInfoSearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="rescueGroupInfoCleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
     </div>
 
    <div data-options="region:'center',border:false">
        <table id="rescueGroupInfoDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="rescueGroupInfoToolbar" style="display: none;">
    <shiro:hasPermission name="/rescueGroupInfo/add">
        <a onclick="rescueGroupInfoAddFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-page-add'">添加</a>
    </shiro:hasPermission>
</div>