<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var avoideDisasterPointDataGrid;
    $(function() {
        avoideDisasterPointDataGrid = $('#avoideDisasterPointDataGrid').datagrid({
        url : '${path}/avoideDisasterPoint/dataGrid',
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
            width : '260',
            title : '名称',
            field : 'NAME',
            sortable : true
        },{
            width : '160',
            title : '所在镇（街）',
            field : 'TWN',
            sortable : true
        },{
            width : '260',
            title : '位置',
            field : 'ADD',
            sortable : true
        },{
            width : '80',
            title : '占地面积(m2)',
            field : 'AREA',
            sortable : true
        },{
            width : '80',
            title : '容纳人数',
            field : 'ATCP',
            sortable : true
        },{
            width : '80',
            title : '场所等级',
            field : 'SH_GRD',
            sortable : true
        },{
            width : '100',
            title : '经度',
            field : 'LGTD',
            sortable : true
        },{
            width : '100',
            title : '纬度',
            field : 'LTTD',
            sortable : true
        },{
            width : '160',
            title : '备注',
            field : 'COMMENTS',
            sortable : true
        }, {
            field : 'action',
            title : '操作',
            width : 200,
            formatter : function(value, row, index) {
                var str = '';
                <shiro:hasPermission name="/avoideDisasterPoint/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="avoideDisasterPoint-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="avoideDisasterPointEditFun(\'{0}\');" >编辑</a>', row.ID);
                </shiro:hasPermission>
                <shiro:hasPermission name="/avoideDisasterPoint/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="avoideDisasterPoint-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="avoideDisasterPointDeleteFun(\'{0}\');" >删除</a>', row.ID);
                </shiro:hasPermission>
                return str;
            }
        } ] ],
        onLoadSuccess:function(data){
            $('.avoideDisasterPoint-easyui-linkbutton-edit').linkbutton({text:'编辑'});
            $('.avoideDisasterPoint-easyui-linkbutton-del').linkbutton({text:'删除'});
        },
        toolbar : '#avoideDisasterPointToolbar'
    });
    $('#avoideDisasterPointQy').combotree({
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
function avoideDisasterPointAddFun() {
    parent.$.modalDialog({
        title : '添加',
        width : 700,
        height : 600,
        href : '${path}/avoideDisasterPoint/addPage',
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = avoideDisasterPointDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#avoideDisasterPointAddForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 编辑
 */
function avoideDisasterPointEditFun(id) {
    if (id == undefined) {
        var rows = avoideDisasterPointDataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        avoideDisasterPointDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.modalDialog({
        title : '编辑',
        width : 700,
        height : 600,
        href :  '${path}/avoideDisasterPoint/editPage?id=' + id,
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = avoideDisasterPointDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#avoideDisasterPointEditForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 删除
 */
 function avoideDisasterPointDeleteFun(id) {
     if (id == undefined) {//点击右键菜单才会触发这个
         var rows = avoideDisasterPointDataGrid.datagrid('getSelections');
         id = rows[0].id;
     } else {//点击操作里面的删除图标会触发这个
         avoideDisasterPointDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
     }
     parent.$.messager.confirm('询问', '您是否要删除当前记录？', function(b) {
         if (b) {
             progressLoad();
             $.post('${path}/avoideDisasterPoint/delete', {
                 id : id
             }, function(result) {
                 if (result.success) {
                     parent.$.messager.alert('提示', result.msg, 'info');
                     avoideDisasterPointDataGrid.datagrid('reload');
                 }
                 progressClose();
             }, 'JSON');
         }
     });
}


/**
 * 清除
 */
function avoideDisasterPointCleanFun() {
    $('#avoideDisasterPointSearchForm input').val('');
    avoideDisasterPointDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function avoideDisasterPointSearchFun() {
     avoideDisasterPointDataGrid.datagrid('load', $.serializeObject($('#avoideDisasterPointSearchForm')));
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 35px; overflow: hidden;background-color: #fff">
        <form id="avoideDisasterPointSearchForm">
            <table>
                <tr>
                	<th style="width:32px;">区域:</th>
	                <td><select id="avoideDisasterPointQy" name="dscd" style="width: 143px; height: 22px;"></select></td>
                    <th>名称:</th>
                    <td><input name="name" class="easyui-textbox" /></td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="avoideDisasterPointSearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="avoideDisasterPointCleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
     </div>
 
    <div data-options="region:'center',border:false">
        <table id="avoideDisasterPointDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="avoideDisasterPointToolbar" style="display: none;">
    <shiro:hasPermission name="/avoideDisasterPoint/add">
        <a onclick="avoideDisasterPointAddFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-page-add'">添加</a>
    </shiro:hasPermission>
</div>