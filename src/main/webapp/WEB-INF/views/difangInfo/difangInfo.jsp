<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var difangInfoDataGrid;
    $(function() {
        difangInfoDataGrid = $('#difangInfoDataGrid').datagrid({
        url : '${path}/difangInfo/dataGrid',
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
		    title : '堤防名称',
		    field : 'DKNM',
		    sortable : true
		},{
		    width : '120',
		    title : '河流岸别',
		    field : 'RVBK',
		    sortable : true
		},{
		    width : '120',
		    title : '堤防跨界情况',
		    field : 'DKCR',
		    sortable : true
		},{
		    width : '120',
		    title : '堤防类型',
		    field : 'DKTYPE',
		    sortable : true
		},{
		    width : '120',
		    title : '堤防型式',
		    field : 'DKTYPE1',
		    sortable : true
		},{
		    width : '120',
		    title : '工程状态',
		    field : 'PRST',
		    sortable : true
		},{
		    width : '120',
		    title : '规划防洪标准(年)',
		    field : 'PLFLST',
		    sortable : true
		},{
		    width : '120',
		    title : '堤防长度(m)',
		    field : 'DKLEN',
		    sortable : true
		},{
		    width : '120',
		    title : '达到规划标准长度',
		    field : 'ACPLLEN',
		    sortable : true
		},{
		    width : '120',
		    title : '归口管理部门代码',
		    field : 'CADCD',
		    sortable : true
		},{
		    width : '120',
		    title : '管理单位名称',
		    field : 'ADNM',
		    sortable : true
		},{
		    width : '120',
		    title : '是否划界',
		    field : 'DS',
		    sortable : true
		},{
		    width : '120',
		    title : '是否确界',
		    field : 'DT',
		    sortable : true
		},{
		    width : '120',
		    title : '镇、街',
		    field : 'TWN',
		    sortable : true
		},{
		    width : '120',
		    title : '堤防全名',
		    field : 'DKTNM',
		    sortable : true
		},{
		    width : '120',
		    title : '起x',
		    field : 'STLGTD',
		    sortable : true
		},{
		    width : '120',
		    title : '起y',
		    field : 'STLTTD',
		    sortable : true
		},{
		    width : '120',
		    title : '终x',
		    field : 'ENDLGTD',
		    sortable : true
		},{
		    width : '120',
		    title : '终y',
		    field : 'ENDLTTD',
		    sortable : true
		},{
            field : 'action',
            title : '操作',
            width : 200,
            formatter : function(value, row, index) {
                var str = '';
                <shiro:hasPermission name="/difangInfo/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="difangInfo-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="difangInfoEditFun(\'{0}\');" >编辑</a>', row.ID);
                </shiro:hasPermission>
                <shiro:hasPermission name="/difangInfo/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="difangInfo-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="difangInfoDeleteFun(\'{0}\');" >删除</a>', row.ID);
                </shiro:hasPermission>
                return str;
            }
        } ] ],
        onLoadSuccess:function(data){
            $('.difangInfo-easyui-linkbutton-edit').linkbutton({text:'编辑'});
            $('.difangInfo-easyui-linkbutton-del').linkbutton({text:'删除'});
        },
        toolbar : '#difangInfoToolbar'
    });
    $('#difangInfoQy').combotree({
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
function difangInfoAddFun() {
    parent.$.modalDialog({
        title : '添加',
        width : 700,
        height : 600,
        href : '${path}/difangInfo/addPage',
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = difangInfoDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#difangInfoAddForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 编辑
 */
function difangInfoEditFun(id) {
    if (id == undefined) {
        var rows = difangInfoDataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        difangInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.modalDialog({
        title : '编辑',
        width : 700,
        height : 600,
        href :  '${path}/difangInfo/editPage?id=' + id,
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = difangInfoDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#difangInfoEditForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 删除
 */
 function difangInfoDeleteFun(id) {
     if (id == undefined) {//点击右键菜单才会触发这个
         var rows = difangInfoDataGrid.datagrid('getSelections');
         id = rows[0].id;
     } else {//点击操作里面的删除图标会触发这个
         difangInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
     }
     parent.$.messager.confirm('询问', '您是否要删除当前记录？', function(b) {
         if (b) {
             progressLoad();
             $.post('${path}/difangInfo/delete', {
                 id : id
             }, function(result) {
                 if (result.success) {
                     parent.$.messager.alert('提示', result.msg, 'info');
                     difangInfoDataGrid.datagrid('reload');
                 }
                 progressClose();
             }, 'JSON');
         }
     });
}


/**
 * 清除
 */
function difangInfoCleanFun() {
    $('#difangInfoSearchForm input').val('');
    difangInfoDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function difangInfoSearchFun() {
     difangInfoDataGrid.datagrid('load', $.serializeObject($('#difangInfoSearchForm')));
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 35px; overflow: hidden;background-color: #fff">
        <form id="difangInfoSearchForm">
            <table>
                <tr>
                	<th style="width:32px;">区域:</th>
	                <td><select id="difangInfoQy" name="dscd" style="width: 143px; height: 22px;"></select></td>
                    <th>名称:</th>
                    <td><input name="dknm" class="easyui-textbox" /></td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="difangInfoSearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="difangInfoCleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
     </div>
 
    <div data-options="region:'center',border:false">
        <table id="difangInfoDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="difangInfoToolbar" style="display: none;">
    <shiro:hasPermission name="/difangInfo/add">
        <a onclick="difangInfoAddFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-page-add'">添加</a>
    </shiro:hasPermission>
</div>