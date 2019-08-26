<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
var ttt=6;
    var bridgeInfoDataGrid;
    $(function() {
        bridgeInfoDataGrid = $('#bridgeInfoDataGrid').datagrid({
        url : '${path}/bridgeInfo/dataGrid',
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
            title : '桥梁名称',
            field : 'BR_NAME',
            sortable : true
        },{
            width : '260',
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
            title : '所在河流',
            field : 'RV',
            sortable : true
        },{
            width : '80',
            title : '桥长(m)',
            field : 'BR_LEN',
            sortable : true
        },{
            width : '80',
            title : '桥宽(m)',
            field : 'BR_WID',
            sortable : true
        },{
            width : '80',
            title : '桥高(m)',
            field : 'BR_HIGHT',
            sortable : true
        },{
            width : '80',
            title : '类型',
            field : 'BR_TYPE',
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
                <shiro:hasPermission name="/bridgeInfo/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="bridgeInfo-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="bridgeInfoEditFun(\'{0}\');" >编辑</a>', row.ID);
                </shiro:hasPermission>
                <shiro:hasPermission name="/bridgeInfo/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="bridgeInfo-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="bridgeInfoDeleteFun(\'{0}\');" >删除</a>', row.ID);
                </shiro:hasPermission>
                return str;
            }
        } ] ],
        onLoadSuccess:function(data){
            $('.bridgeInfo-easyui-linkbutton-edit').linkbutton({text:'编辑'});
            $('.bridgeInfo-easyui-linkbutton-del').linkbutton({text:'删除'});
        },
        toolbar : '#bridgeInfoToolbar'
    });
    $('#bridgeInfoQy').combotree({
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
function bridgeInfoAddFun() {
    parent.$.modalDialog({
        title : '添加',
        width : 700,
        height : 600,
        href : '${path}/bridgeInfo/addPage',
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = bridgeInfoDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#bridgeInfoAddForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 编辑
 */
function bridgeInfoEditFun(id) {
    if (id == undefined) {
        var rows = bridgeInfoDataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        bridgeInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.modalDialog({
        title : '编辑',
        width : 700,
        height : 600,
        href :  '${path}/bridgeInfo/editPage?id=' + id,
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = bridgeInfoDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#bridgeInfoEditForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 删除
 */
 function bridgeInfoDeleteFun(id) {
     if (id == undefined) {//点击右键菜单才会触发这个
         var rows = bridgeInfoDataGrid.datagrid('getSelections');
         id = rows[0].id;
     } else {//点击操作里面的删除图标会触发这个
         bridgeInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
     }
     parent.$.messager.confirm('询问', '您是否要删除当前记录？', function(b) {
         if (b) {
             progressLoad();
             $.post('${path}/bridgeInfo/delete', {
                 id : id
             }, function(result) {
                 if (result.success) {
                     parent.$.messager.alert('提示', result.msg, 'info');
                     bridgeInfoDataGrid.datagrid('reload');
                 }
                 progressClose();
             }, 'JSON');
         }
     });
}


/**
 * 清除
 */
function bridgeInfoCleanFun() {
    $('#bridgeInfoSearchForm input').val('');
    bridgeInfoDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function bridgeInfoSearchFun() {
     bridgeInfoDataGrid.datagrid('load', $.serializeObject($('#bridgeInfoSearchForm')));
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 35px; overflow: hidden;background-color: #fff">
        <form id="bridgeInfoSearchForm">
            <table>
                <tr>
                	<th style="width:32px;">区域:</th>
	                <td><select id="bridgeInfoQy" name="dscd" style="width: 143px; height: 22px;"></select></td>
                    <th>桥梁名称:</th>
                    <td><input name="brName" class="easyui-textbox" /></td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="bridgeInfoSearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="bridgeInfoCleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
     </div>
 
    <div data-options="region:'center',border:false">
        <table id="bridgeInfoDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="bridgeInfoToolbar" style="display: none;">
    <shiro:hasPermission name="/bridgeInfo/add">
        <a onclick="bridgeInfoAddFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-page-add'">添加</a>
    </shiro:hasPermission>
</div>