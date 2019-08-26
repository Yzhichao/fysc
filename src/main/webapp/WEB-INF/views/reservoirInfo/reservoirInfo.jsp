<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var reservoirInfoDataGrid;
    $(function() {
        reservoirInfoDataGrid = $('#reservoirInfoDataGrid').datagrid({
        url : '${path}/reservoirInfo/dataGrid',
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
            width : '160',
            title : '水库名称',
            field : 'RSNAME',
            sortable : true
        },{
            width : '120',
            title : '所在镇（街）',
            field : 'TWN',
            sortable : true
        },{
            width : '120',
            title : '管理单位名称',
            field : 'MDNM',
            sortable : true
        },{
            width : '120',
            title : '主坝类型',
            field : 'MDAMTYPE',
            sortable : true
        },{
            width : '120',
            title : '工程规模',
            field : 'PRSC',
            sortable : true
        },{
            width : '80',
            title : '水库功能',
            field : 'RSFN',
            sortable : true
        },{
            width : '80',
            title : '设计洪水位(m)',
            field : 'DSFLZ',
            sortable : true
        },{
            width : '80',
            title : '总库容(万m3)',
            field : 'TTCP',
            sortable : true
        },{
            width : '160',
            title : '最大坝高/m',
            field : 'MD_MX_HIG',
            sortable : true
        },{
            width : '80',
            title : '经度',
            field : 'LGTD',
            sortable : true
        },{
            width : '80',
            title : '纬度',
            field : 'LTTD',
            sortable : true
        },{
            width : '180',
            title : '所在流域',
            field : 'BSNM',
            sortable : true
        }, {
            field : 'action',
            title : '操作',
            width : 200,
            formatter : function(value, row, index) {
                var str = '';
                <shiro:hasPermission name="/reservoirInfo/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="reservoirInfo-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="reservoirInfoEditFun(\'{0}\');" >编辑</a>', row.ID);
                </shiro:hasPermission>
                <shiro:hasPermission name="/reservoirInfo/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="reservoirInfo-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="reservoirInfoDeleteFun(\'{0}\');" >删除</a>', row.ID);
                </shiro:hasPermission>
                return str;
            }
        } ] ],
        onLoadSuccess:function(data){
            $('.reservoirInfo-easyui-linkbutton-edit').linkbutton({text:'编辑'});
            $('.reservoirInfo-easyui-linkbutton-del').linkbutton({text:'删除'});
        },
        toolbar : '#reservoirInfoToolbar'
    });
        $('#reservoirInfoQy').combotree({
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
function reservoirInfoAddFun() {
    parent.$.modalDialog({
        title : '添加',
        width : 700,
        height : 600,
        href : '${path}/reservoirInfo/addPage',
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = reservoirInfoDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#reservoirInfoAddForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 编辑
 */
function reservoirInfoEditFun(id) {
    if (id == undefined) {
        var rows = reservoirInfoDataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        reservoirInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.modalDialog({
        title : '编辑',
        width : 700,
        height : 600,
        href :  '${path}/reservoirInfo/editPage?id=' + id,
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = reservoirInfoDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#reservoirInfoEditForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 删除
 */
 function reservoirInfoDeleteFun(id) {
     if (id == undefined) {//点击右键菜单才会触发这个
         var rows = reservoirInfoDataGrid.datagrid('getSelections');
         id = rows[0].id;
     } else {//点击操作里面的删除图标会触发这个
         reservoirInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
     }
     parent.$.messager.confirm('询问', '您是否要删除当前记录？', function(b) {
         if (b) {
             progressLoad();
             $.post('${path}/reservoirInfo/delete', {
                 id : id
             }, function(result) {
                 if (result.success) {
                     parent.$.messager.alert('提示', result.msg, 'info');
                     reservoirInfoDataGrid.datagrid('reload');
                 }
                 progressClose();
             }, 'JSON');
         }
     });
}


/**
 * 清除
 */
function reservoirInfoCleanFun() {
    $('#reservoirInfoSearchForm input').val('');
    reservoirInfoDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function reservoirInfoSearchFun() {
     reservoirInfoDataGrid.datagrid('load', $.serializeObject($('#reservoirInfoSearchForm')));
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 35px; overflow: hidden;background-color: #fff">
        <form id="reservoirInfoSearchForm">
            <table>
                <tr>
                	<th style="width:32px;">区域:</th>
	                <td><select id="reservoirInfoQy" name="dscd" style="width: 143px; height: 22px;"></select></td>
                    <th>水库名称:</th>
                    <td><input name="rsname" class="easyui-textbox" /></td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="reservoirInfoSearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="reservoirInfoCleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
     </div>
 
    <div data-options="region:'center',border:false">
        <table id="reservoirInfoDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="reservoirInfoToolbar" style="display: none;">
    <shiro:hasPermission name="/reservoirInfo/add">
        <a onclick="reservoirInfoAddFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-page-add'">添加</a>
    </shiro:hasPermission>
</div>