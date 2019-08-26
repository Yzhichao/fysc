<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var monitorStationInfoDataGrid;
    $(function() {
        monitorStationInfoDataGrid = $('#monitorStationInfoDataGrid').datagrid({
        url : '${path}/monitorStationInfo/dataGrid',
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
            title : '测站名称',
            field : 'STNM',
            sortable : true
        },{
            width : '230',
            title : '所在镇（街）',
            field : 'TWN',
            sortable : true
        },{
            width : '120',
            title : '测站编码',
            field : 'STCD',
            sortable : true
        },{
            width : '120',
            title : '所在河流',
            field : 'RV',
            sortable : true
        },
        /* 
        {
            width : '80',
            title : '水系名称',
            field : 'sxmc',
            sortable : true
        },
         */
        {
            width : '80',
            title : '测站类型',
            field : 'ST_TYPE',
            sortable : true
        },{
            width : '80',
            title : '建站年月',
            field : 'ESDT',
            sortable : true
        },{
            width : '180',
            title : '隶属单位',
            field : 'ADDC',
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
            field : 'COMMRNTS',
            sortable : true
        }, {
            field : 'action',
            title : '操作',
            width : 200,
            formatter : function(value, row, index) {
                var str = '';
                <shiro:hasPermission name="/monitorStationInfo/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="monitorStationInfo-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="monitorStationInfoEditFun(\'{0}\');" >编辑</a>', row.ID);
                </shiro:hasPermission>
                <shiro:hasPermission name="/monitorStationInfo/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="monitorStationInfo-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="monitorStationInfoDeleteFun(\'{0}\');" >删除</a>', row.ID);
                </shiro:hasPermission>
                return str;
            }
        } ] ],
        onLoadSuccess:function(data){
            $('.monitorStationInfo-easyui-linkbutton-edit').linkbutton({text:'编辑'});
            $('.monitorStationInfo-easyui-linkbutton-del').linkbutton({text:'删除'});
        },
        toolbar : '#monitorStationInfoToolbar'
    });
    $('#monitorStationInfoQy').combotree({
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
function monitorStationInfoAddFun() {
    parent.$.modalDialog({
        title : '添加',
        width : 700,
        height : 600,
        href : '${path}/monitorStationInfo/addPage',
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = monitorStationInfoDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#monitorStationInfoAddForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 编辑
 */
function monitorStationInfoEditFun(id) {
    if (id == undefined) {
        var rows = monitorStationInfoDataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        monitorStationInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.modalDialog({
        title : '编辑',
        width : 700,
        height : 600,
        href :  '${path}/monitorStationInfo/editPage?id=' + id,
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = monitorStationInfoDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#monitorStationInfoEditForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 删除
 */
 function monitorStationInfoDeleteFun(id) {
     if (id == undefined) {//点击右键菜单才会触发这个
         var rows = monitorStationInfoDataGrid.datagrid('getSelections');
         id = rows[0].id;
     } else {//点击操作里面的删除图标会触发这个
         monitorStationInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
     }
     parent.$.messager.confirm('询问', '您是否要删除当前记录？', function(b) {
         if (b) {
             progressLoad();
             $.post('${path}/monitorStationInfo/delete', {
                 id : id
             }, function(result) {
                 if (result.success) {
                     parent.$.messager.alert('提示', result.msg, 'info');
                     monitorStationInfoDataGrid.datagrid('reload');
                 }
                 progressClose();
             }, 'JSON');
         }
     });
}


/**
 * 清除
 */
function monitorStationInfoCleanFun() {
    $('#monitorStationInfoSearchForm input').val('');
    monitorStationInfoDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function monitorStationInfoSearchFun() {
     monitorStationInfoDataGrid.datagrid('load', $.serializeObject($('#monitorStationInfoSearchForm')));
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 35px; overflow: hidden;background-color: #fff">
        <form id="monitorStationInfoSearchForm">
            <table>
                <tr>
                	<th style="width:32px;">区域:</th>
	                <td><select id="monitorStationInfoQy" name="dscd" style="width: 143px; height: 22px;"></select></td>
                    <th>测站名称:</th>
                    <td><input name="czmc" class="easyui-textbox" /></td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="monitorStationInfoSearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="monitorStationInfoCleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
     </div>
 
    <div data-options="region:'center',border:false">
        <table id="monitorStationInfoDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="monitorStationInfoToolbar" style="display: none;">
    <shiro:hasPermission name="/monitorStationInfo/add">
        <a onclick="monitorStationInfoAddFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-page-add'">添加</a>
    </shiro:hasPermission>
</div>