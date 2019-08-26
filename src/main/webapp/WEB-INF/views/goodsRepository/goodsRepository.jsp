<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var goodsRepositoryDataGrid;
    $(function() {
        goodsRepositoryDataGrid = $('#goodsRepositoryDataGrid').datagrid({
        url : '${path}/goodsRepository/dataGrid',
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
            width : '230',
            title : '名称',
            field : 'NAME',
            sortable : true
        },{
            width : '160',
            title : '所在镇（街）',
            field : 'TWN',
            sortable : true
        },{
            width : '80',
            title : '联系人',
            field : 'HEAD',
            sortable : true
        },{
            width : '160',
            title : '联系方式',
            field : 'TELL',
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
            width : '250',
            title : '备注',
            field : 'COMMENTS',
            sortable : true
        }, {
            field : 'action',
            title : '操作',
            width : 200,
            formatter : function(value, row, index) {
                var str = '';
                <shiro:hasPermission name="/goodsRepository/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="goodsRepository-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="goodsRepositoryEditFun(\'{0}\');" >编辑</a>', row.ID);
                </shiro:hasPermission>
                <shiro:hasPermission name="/goodsRepository/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="goodsRepository-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="goodsRepositoryDeleteFun(\'{0}\');" >删除</a>', row.ID);
                </shiro:hasPermission>
                return str;
            }
        } ] ],
        onLoadSuccess:function(data){
            $('.goodsRepository-easyui-linkbutton-edit').linkbutton({text:'编辑'});
            $('.goodsRepository-easyui-linkbutton-del').linkbutton({text:'删除'});
        },
        toolbar : '#goodsRepositoryToolbar'
    });
    $('#goodsRepositoryQy').combotree({
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
function goodsRepositoryAddFun() {
    parent.$.modalDialog({
        title : '添加',
        width : 700,
        height : 600,
        href : '${path}/goodsRepository/addPage',
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = goodsRepositoryDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#goodsRepositoryAddForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 编辑
 */
function goodsRepositoryEditFun(id) {
    if (id == undefined) {
        var rows = goodsRepositoryDataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        goodsRepositoryDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.modalDialog({
        title : '编辑',
        width : 700,
        height : 600,
        href :  '${path}/goodsRepository/editPage?id=' + id,
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = goodsRepositoryDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#goodsRepositoryEditForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 删除
 */
 function goodsRepositoryDeleteFun(id) {
     if (id == undefined) {//点击右键菜单才会触发这个
         var rows = goodsRepositoryDataGrid.datagrid('getSelections');
         id = rows[0].id;
     } else {//点击操作里面的删除图标会触发这个
         goodsRepositoryDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
     }
     parent.$.messager.confirm('询问', '您是否要删除当前记录？', function(b) {
         if (b) {
             progressLoad();
             $.post('${path}/goodsRepository/delete', {
                 id : id
             }, function(result) {
                 if (result.success) {
                     parent.$.messager.alert('提示', result.msg, 'info');
                     goodsRepositoryDataGrid.datagrid('reload');
                 }
                 progressClose();
             }, 'JSON');
         }
     });
}


/**
 * 清除
 */
function goodsRepositoryCleanFun() {
    $('#goodsRepositorySearchForm input').val('');
    goodsRepositoryDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function goodsRepositorySearchFun() {
     goodsRepositoryDataGrid.datagrid('load', $.serializeObject($('#goodsRepositorySearchForm')));
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 35px; overflow: hidden;background-color: #fff">
        <form id="goodsRepositorySearchForm">
            <table>
                <tr>
                	<th style="width:32px;">区域:</th>
	                <td><select id="goodsRepositoryQy" name="dscd" style="width: 143px; height: 22px;"></select></td>
                    <th>名称:</th>
                    <td><input name="name" class="easyui-textbox" /></td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="goodsRepositorySearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="goodsRepositoryCleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
     </div>
 
    <div data-options="region:'center',border:false">
        <table id="goodsRepositoryDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="goodsRepositoryToolbar" style="display: none;">
    <shiro:hasPermission name="/goodsRepository/add">
        <a onclick="goodsRepositoryAddFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-page-add'">添加</a>
    </shiro:hasPermission>
</div>