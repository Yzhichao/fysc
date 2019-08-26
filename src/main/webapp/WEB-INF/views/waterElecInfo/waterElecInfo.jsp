<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var waterElecInfoDataGrid;
    $(function() {
        waterElecInfoDataGrid = $('#waterElecInfoDataGrid').datagrid({
        url : '${path}/waterElecInfo/dataGrid',
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
            title : '电站名称',
            field : 'NAME',
            sortable : true
        },{
            width : '160',
            title : '所在镇（街）',
            field : 'TWN',
            sortable : true
        },{
            width : '120',
            title : '类型',
            field : 'PTYPE',
            sortable : true
        },{
            width : '80',
            title : '工程等级',
            field : 'PRGRD',
            sortable : true
        },{
            width : '80',
            title : '装机容量(kW)',
            field : 'IC',
            sortable : true
        },{
            width : '80',
            title : '机组台数(台)',
            field : 'UT',
            sortable : true
        },{
            width : '200',
            title : '管理单位名称',
            field : 'ADNM',
            sortable : true
        },
        /* 
        {
            width : '160',
            title : '备注',
            field : 'bz',
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
        }, 
         */
        {
            field : 'action',
            title : '操作',
            width : 200,
            formatter : function(value, row, index) {
                var str = '';
                <shiro:hasPermission name="/waterElecInfo/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="waterElecInfo-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="waterElecInfoEditFun(\'{0}\');" >编辑</a>', row.ID);
                </shiro:hasPermission>
                <shiro:hasPermission name="/waterElecInfo/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="waterElecInfo-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="waterElecInfoDeleteFun(\'{0}\');" >删除</a>', row.ID);
                </shiro:hasPermission>
                return str;
            }
        } ] ],
        onLoadSuccess:function(data){
            $('.waterElecInfo-easyui-linkbutton-edit').linkbutton({text:'编辑'});
            $('.waterElecInfo-easyui-linkbutton-del').linkbutton({text:'删除'});
        },
        toolbar : '#waterElecInfoToolbar'
    });
    $('#waterElecInfoQy').combotree({
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
function waterElecInfoAddFun() {
    parent.$.modalDialog({
        title : '添加',
        width : 700,
        height : 600,
        href : '${path}/waterElecInfo/addPage',
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = waterElecInfoDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#waterElecInfoAddForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 编辑
 */
function waterElecInfoEditFun(id) {
    if (id == undefined) {
        var rows = waterElecInfoDataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        waterElecInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.modalDialog({
        title : '编辑',
        width : 700,
        height : 600,
        href :  '${path}/waterElecInfo/editPage?id=' + id,
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = waterElecInfoDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#waterElecInfoEditForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 删除
 */
 function waterElecInfoDeleteFun(id) {
     if (id == undefined) {//点击右键菜单才会触发这个
         var rows = waterElecInfoDataGrid.datagrid('getSelections');
         id = rows[0].id;
     } else {//点击操作里面的删除图标会触发这个
         waterElecInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
     }
     parent.$.messager.confirm('询问', '您是否要删除当前记录？', function(b) {
         if (b) {
             progressLoad();
             $.post('${path}/waterElecInfo/delete', {
                 id : id
             }, function(result) {
                 if (result.success) {
                     parent.$.messager.alert('提示', result.msg, 'info');
                     waterElecInfoDataGrid.datagrid('reload');
                 }
                 progressClose();
             }, 'JSON');
         }
     });
}


/**
 * 清除
 */
function waterElecInfoCleanFun() {
    $('#waterElecInfoSearchForm input').val('');
    waterElecInfoDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function waterElecInfoSearchFun() {
     waterElecInfoDataGrid.datagrid('load', $.serializeObject($('#waterElecInfoSearchForm')));
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 35px; overflow: hidden;background-color: #fff">
        <form id="waterElecInfoSearchForm">
            <table>
                <tr>
                	<th style="width:32px;">区域:</th>
	                <td><select id="waterElecInfoQy" name="dscd" style="width: 143px; height: 22px;"></select></td>
                    <th>电站名称:</th>
                    <td><input name="name" class="easyui-textbox" /></td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="waterElecInfoSearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="waterElecInfoCleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
     </div>
 
    <div data-options="region:'center',border:false">
        <table id="waterElecInfoDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="waterElecInfoToolbar" style="display: none;">
    <shiro:hasPermission name="/waterElecInfo/add">
        <a onclick="waterElecInfoAddFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-page-add'">添加</a>
    </shiro:hasPermission>
</div>