<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var handongInfoDataGrid;
    $(function() {
        handongInfoDataGrid = $('#handongInfoDataGrid').datagrid({
        url : '${path}/handongInfo/dataGrid',
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
            title : '涵洞名称',
            field : 'HOLE_NAME',
            sortable : true
        },{
            width : '280',
            title : '位置',
            field : 'ADDVNM',
            sortable : true
        },{
            width : '160',
            title : '所在镇（街）',
            field : 'TWN',
            sortable : true
        },{
            width : '80',
            title : '类型',
            field : 'HOLE_TYPE',
            sortable : true
        },{
            width : '80',
            title : '洞身高(m)',
            field : 'HOLE_HIGHT',
            sortable : true
        },{
            width : '110',
            title : '洞身宽或直径(m)',
            field : 'HOLE_WID',
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
        }
        /* 
        ,{
            width : '160',
            title : '备注',
            field : 'bz',
            sortable : true
        }
         */
        ,{
            field : 'action',
            title : '操作',
            width : 200,
            formatter : function(value, row, index) {
                var str = '';
                <shiro:hasPermission name="/handongInfo/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="handongInfo-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="handongInfoEditFun(\'{0}\');" >编辑</a>', row.ID);
                </shiro:hasPermission>
                <shiro:hasPermission name="/handongInfo/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="handongInfo-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="handongInfoDeleteFun(\'{0}\');" >删除</a>', row.ID);
                </shiro:hasPermission>
                return str;
            }
        } ] ],
        onLoadSuccess:function(data){
            $('.handongInfo-easyui-linkbutton-edit').linkbutton({text:'编辑'});
            $('.handongInfo-easyui-linkbutton-del').linkbutton({text:'删除'});
        },
        toolbar : '#handongInfoToolbar'
    });
    $('#handongInfoQy').combotree({
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
function handongInfoAddFun() {
    parent.$.modalDialog({
        title : '添加',
        width : 700,
        height : 600,
        href : '${path}/handongInfo/addPage',
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = handongInfoDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#handongInfoAddForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 编辑
 */
function handongInfoEditFun(id) {
    if (id == undefined) {
        var rows = handongInfoDataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        handongInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.modalDialog({
        title : '编辑',
        width : 700,
        height : 600,
        href :  '${path}/handongInfo/editPage?id=' + id,
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = handongInfoDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#handongInfoEditForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 删除
 */
 function handongInfoDeleteFun(id) {
     if (id == undefined) {//点击右键菜单才会触发这个
         var rows = handongInfoDataGrid.datagrid('getSelections');
         id = rows[0].id;
     } else {//点击操作里面的删除图标会触发这个
         handongInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
     }
     parent.$.messager.confirm('询问', '您是否要删除当前记录？', function(b) {
         if (b) {
             progressLoad();
             $.post('${path}/handongInfo/delete', {
                 id : id
             }, function(result) {
                 if (result.success) {
                     parent.$.messager.alert('提示', result.msg, 'info');
                     handongInfoDataGrid.datagrid('reload');
                 }
                 progressClose();
             }, 'JSON');
         }
     });
}


/**
 * 清除
 */
function handongInfoCleanFun() {
    $('#handongInfoSearchForm input').val('');
    handongInfoDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function handongInfoSearchFun() {
     handongInfoDataGrid.datagrid('load', $.serializeObject($('#handongInfoSearchForm')));
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 35px; overflow: hidden;background-color: #fff">
        <form id="handongInfoSearchForm">
            <table>
                <tr>
                	<th style="width:32px;">区域:</th>
	                <td><select id="handongInfoQy" name="dscd" style="width: 143px; height: 22px;"></select></td>
                    <th>涵洞名称:</th>
                    <td><input name="holeName" class="easyui-textbox" /></td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="handongInfoSearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="handongInfoCleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
     </div>
 
    <div data-options="region:'center',border:false">
        <table id="handongInfoDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="handongInfoToolbar" style="display: none;">
    <shiro:hasPermission name="/handongInfo/add">
        <a onclick="handongInfoAddFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-page-add'">添加</a>
    </shiro:hasPermission>
</div>