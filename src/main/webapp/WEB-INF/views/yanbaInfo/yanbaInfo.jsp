<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var yanbaInfoDataGrid;
    $(function() {
        yanbaInfoDataGrid = $('#yanbaInfoDataGrid').datagrid({
        url : '${path}/yanbaInfo/dataGrid',
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
        },
{
    width : '120',
    title : '镇',
    field : 'TWN',
    sortable : true
},{
    width : '120',
    title : '堰坝名称',
    field : 'WR_NAME',
    sortable : true
},{
    width : '120',
    title : '所在河道',
    field : 'RV',
    sortable : true
},{
    width : '120',
    title : '堰坝类型',
    field : 'WR_TYPE',
    sortable : true
},{
    width : '120',
    title : '容积容积（m^3)',
    field : 'CP',
    sortable : true
},{
    width : '120',
    title : '坝高（m）',
    field : 'DAM_HIGHT',
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
    title : '备注',
    field : 'COMMENTS',
    sortable : true
},
{
            field : 'action',
            title : '操作',
            width : 200,
            formatter : function(value, row, index) {
                var str = '';
                <shiro:hasPermission name="/yanbaInfo/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="yanbaInfo-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="yanbaInfoEditFun(\'{0}\');" >编辑</a>', row.ID);
                </shiro:hasPermission>
                <shiro:hasPermission name="/yanbaInfo/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="yanbaInfo-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="yanbaInfoDeleteFun(\'{0}\');" >删除</a>', row.ID);
                </shiro:hasPermission>
                return str;
            }
        } ] ],
        onLoadSuccess:function(data){
            $('.yanbaInfo-easyui-linkbutton-edit').linkbutton({text:'编辑'});
            $('.yanbaInfo-easyui-linkbutton-del').linkbutton({text:'删除'});
        },
        toolbar : '#yanbaInfoToolbar'
    });
    $('#yanbaInfoQy').combotree({
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
function yanbaInfoAddFun() {
    parent.$.modalDialog({
        title : '添加',
        width : 700,
        height : 600,
        href : '${path}/yanbaInfo/addPage',
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = yanbaInfoDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#yanbaInfoAddForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 编辑
 */
function yanbaInfoEditFun(id) {
    if (id == undefined) {
        var rows = yanbaInfoDataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        yanbaInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.modalDialog({
        title : '编辑',
        width : 700,
        height : 600,
        href :  '${path}/yanbaInfo/editPage?id=' + id,
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = yanbaInfoDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#yanbaInfoEditForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 删除
 */
 function yanbaInfoDeleteFun(id) {
     if (id == undefined) {//点击右键菜单才会触发这个
         var rows = yanbaInfoDataGrid.datagrid('getSelections');
         id = rows[0].id;
     } else {//点击操作里面的删除图标会触发这个
         yanbaInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
     }
     parent.$.messager.confirm('询问', '您是否要删除当前记录？', function(b) {
         if (b) {
             progressLoad();
             $.post('${path}/yanbaInfo/delete', {
                 id : id
             }, function(result) {
                 if (result.success) {
                     parent.$.messager.alert('提示', result.msg, 'info');
                     yanbaInfoDataGrid.datagrid('reload');
                 }
                 progressClose();
             }, 'JSON');
         }
     });
}


/**
 * 清除
 */
function yanbaInfoCleanFun() {
    $('#yanbaInfoSearchForm input').val('');
    yanbaInfoDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function yanbaInfoSearchFun() {
     yanbaInfoDataGrid.datagrid('load', $.serializeObject($('#yanbaInfoSearchForm')));
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 35px; overflow: hidden;background-color: #fff">
        <form id="yanbaInfoSearchForm">
            <table>
                <tr>
                	<th style="width:32px;">区域:</th>
	                <td><select id="yanbaInfoQy" name="dscd" style="width: 143px; height: 22px;"></select></td>
                    <th>堰坝名称:</th>
                    <td><input name="wrName" class="easyui-textbox" /></td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="yanbaInfoSearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="yanbaInfoCleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
     </div>
 
    <div data-options="region:'center',border:false">
        <table id="yanbaInfoDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="yanbaInfoToolbar" style="display: none;">
    <shiro:hasPermission name="/yanbaInfo/add">
        <a onclick="yanbaInfoAddFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-page-add'">添加</a>
    </shiro:hasPermission>
</div>