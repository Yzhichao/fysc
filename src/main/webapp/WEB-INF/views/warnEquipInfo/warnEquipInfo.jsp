<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var warnEquipInfoDataGrid;
    $(function() {
        warnEquipInfoDataGrid = $('#warnEquipInfoDataGrid').datagrid({
        url : '${path}/warnEquipInfo/dataGrid',
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
            ssortable : true,
            hidden : true
        },{
            width : '230',
            title : '名称',
            field : 'mc',
            sortable : true
        },{
            width : '160',
            title : '所在镇（街）',
            field : 'szz',
            sortable : true
        },{
            width : '120',
            title : '设施类型',
            field : 'sslx',
            sortable : true
        },{
            width : '80',
            title : '经度',
            field : 'jd',
            sortable : true
        },{
            width : '80',
            title : '纬度',
            field : 'wd',
            sortable : true
        },{
            width : '160',
            title : '备注',
            field : 'bz',
            sortable : true
        }, {
            field : 'action',
            title : '操作',
            width : 200,
            formatter : function(value, row, index) {
                var str = '';
                <shiro:hasPermission name="/warnEquipInfo/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="warnEquipInfo-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="warnEquipInfoEditFun(\'{0}\');" >编辑</a>', row.id);
                </shiro:hasPermission>
                <shiro:hasPermission name="/warnEquipInfo/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="warnEquipInfo-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="warnEquipInfoDeleteFun(\'{0}\');" >删除</a>', row.id);
                </shiro:hasPermission>
                return str;
            }
        } ] ],
        onLoadSuccess:function(data){
            $('.warnEquipInfo-easyui-linkbutton-edit').linkbutton({text:'编辑'});
            $('.warnEquipInfo-easyui-linkbutton-del').linkbutton({text:'删除'});
        },
        toolbar : '#warnEquipInfoToolbar'
    });
    $('#warnEquipInfoQy').combotree({
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
function warnEquipInfoAddFun() {
    parent.$.modalDialog({
        title : '添加',
        width : 700,
        height : 600,
        href : '${path}/warnEquipInfo/addPage',
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = warnEquipInfoDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#warnEquipInfoAddForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 编辑
 */
function warnEquipInfoEditFun(id) {
    if (id == undefined) {
        var rows = warnEquipInfoDataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        warnEquipInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.modalDialog({
        title : '编辑',
        width : 700,
        height : 600,
        href :  '${path}/warnEquipInfo/editPage?id=' + id,
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = warnEquipInfoDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#warnEquipInfoEditForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 删除
 */
 function warnEquipInfoDeleteFun(id) {
     if (id == undefined) {//点击右键菜单才会触发这个
         var rows = warnEquipInfoDataGrid.datagrid('getSelections');
         id = rows[0].id;
     } else {//点击操作里面的删除图标会触发这个
         warnEquipInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
     }
     parent.$.messager.confirm('询问', '您是否要删除当前记录？', function(b) {
         if (b) {
             progressLoad();
             $.post('${path}/warnEquipInfo/delete', {
                 id : id
             }, function(result) {
                 if (result.success) {
                     parent.$.messager.alert('提示', result.msg, 'info');
                     warnEquipInfoDataGrid.datagrid('reload');
                 }
                 progressClose();
             }, 'JSON');
         }
     });
}


/**
 * 清除
 */
function warnEquipInfoCleanFun() {
    $('#warnEquipInfoSearchForm input').val('');
    warnEquipInfoDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function warnEquipInfoSearchFun() {
     warnEquipInfoDataGrid.datagrid('load', $.serializeObject($('#warnEquipInfoSearchForm')));
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 35px; overflow: hidden;background-color: #fff">
        <form id="warnEquipInfoSearchForm">
            <table>
                <tr>
                	<th style="width:32px;">区域:</th>
	                <td><select id="warnEquipInfoQy" name="dscd" style="width: 143px; height: 22px;"></select></td>
                    <th>名称:</th>
                    <td><input name="mc" class="easyui-textbox" /></td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="warnEquipInfoSearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="warnEquipInfoCleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
     </div>
 
    <div data-options="region:'center',border:false">
        <table id="warnEquipInfoDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="warnEquipInfoToolbar" style="display: none;">
    <shiro:hasPermission name="/warnEquipInfo/add">
        <a onclick="warnEquipInfoAddFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-page-add'">添加</a>
    </shiro:hasPermission>
</div>