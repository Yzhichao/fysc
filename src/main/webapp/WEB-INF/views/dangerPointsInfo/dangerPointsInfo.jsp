<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var dangerPointsInfoDataGrid;
    $(function() {
        dangerPointsInfoDataGrid = $('#dangerPointsInfoDataGrid').datagrid({
        url : '${path}/dangerPointsInfo/dataGrid',
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
    title : '村',
    field : 'vl',
    sortable : true
},{
    width : '120',
    title : '隐患点（片)位置',
    field : 'add',
    sortable : true
},{
    width : '120',
    title : '镇',
    field : 'TWN',
    sortable : true
},{
    width : '120',
    title : '灾害类型',
    field : 'DSTYPE',
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
    title : '灾害体规模',
    field : 'DSSC',
    sortable : true
},{
    width : '120',
    title : '稳定性',
    field : 'ST',
    sortable : true
},{
    width : '120',
    title : '受威胁人数',
    field : 'THPP',
    sortable : true
},{
    width : '120',
    title : '潜在经济损失（万元）',
    field : 'LSEC',
    sortable : true
},{
    width : '120',
    title : '监测人',
    field : 'MNDOF',
    sortable : true
},{
    width : '120',
    title : '联系电话',
    field : 'TELL',
    sortable : true
},{
    width : '120',
    title : '防治对策',
    field : 'PRMS',
    sortable : true
},{
    width : '120',
    title : '备注',
    field : 'COMMENTS',
    sortable : true
},{
    width : '120',
    title : '行政村',
    field : 'ADVIL',
    sortable : true
},{
    width : '120',
    title : '村组',
    field : 'GR',
    sortable : true
},{
    width : '120',
    title : '重要设施及企业',
    field : 'IMFC',
    sortable : true
},{
    width : '120',
    title : '责任主体',
    field : 'SUBTL',
    sortable : true
},{
    width : '120',
    title : '实施单位',
    field : 'EXSC',
    sortable : true
},{
    width : '120',
    title : '整治目标',
    field : 'RNTR',
    sortable : true
},{
    width : '120',
    title : '是否完成',
    field : 'CM',
    sortable : true
},{
    width : '120',
    title : '监管单位',
    field : 'RGSC',
    sortable : true
}
/* 
,{
    width : '120',
    title : '',
    field : 'RNTR1',
    sortable : true
}
*/
,{
    width : '120',
    title : '整治措施',
    field : 'RNMS',
    sortable : true
},{
    width : '120',
    title : '完成期限',
    field : 'DDL',
    sortable : true
},{
    width : '120',
    title : '进展情况',
    field : 'PRG',
    sortable : true
},{
            field : 'action',
            title : '操作',
            width : 200,
            formatter : function(value, row, index) {
                var str = '';
                <shiro:hasPermission name="/dangerPointsInfo/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="dangerPointsInfo-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="dangerPointsInfoEditFun(\'{0}\');" >编辑</a>', row.ID);
                </shiro:hasPermission>
                <shiro:hasPermission name="/dangerPointsInfo/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="dangerPointsInfo-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="dangerPointsInfoDeleteFun(\'{0}\');" >删除</a>', row.ID);
                </shiro:hasPermission>
                return str;
            }
        } ] ],
        onLoadSuccess:function(data){
            $('.dangerPointsInfo-easyui-linkbutton-edit').linkbutton({text:'编辑'});
            $('.dangerPointsInfo-easyui-linkbutton-del').linkbutton({text:'删除'});
        },
        toolbar : '#dangerPointsInfoToolbar'
    });
    $('#dangerPointsInfoQy').combotree({
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
function dangerPointsInfoAddFun() {
    parent.$.modalDialog({
        title : '添加',
        width : 700,
        height : 600,
        href : '${path}/dangerPointsInfo/addPage',
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = dangerPointsInfoDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#dangerPointsInfoAddForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 编辑
 */
function dangerPointsInfoEditFun(id) {
    if (id == undefined) {
        var rows = dangerPointsInfoDataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        dangerPointsInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.modalDialog({
        title : '编辑',
        width : 700,
        height : 600,
        href :  '${path}/dangerPointsInfo/editPage?id=' + id,
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = dangerPointsInfoDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#dangerPointsInfoEditForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 删除
 */
 function dangerPointsInfoDeleteFun(id) {
     if (id == undefined) {//点击右键菜单才会触发这个
         var rows = dangerPointsInfoDataGrid.datagrid('getSelections');
         id = rows[0].id;
     } else {//点击操作里面的删除图标会触发这个
         dangerPointsInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
     }
     parent.$.messager.confirm('询问', '您是否要删除当前记录？', function(b) {
         if (b) {
             progressLoad();
             $.post('${path}/dangerPointsInfo/delete', {
                 id : id
             }, function(result) {
                 if (result.success) {
                     parent.$.messager.alert('提示', result.msg, 'info');
                     dangerPointsInfoDataGrid.datagrid('reload');
                 }
                 progressClose();
             }, 'JSON');
         }
     });
}


/**
 * 清除
 */
function dangerPointsInfoCleanFun() {
    $('#dangerPointsInfoSearchForm input').val('');
    dangerPointsInfoDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function dangerPointsInfoSearchFun() {
     dangerPointsInfoDataGrid.datagrid('load', $.serializeObject($('#dangerPointsInfoSearchForm')));
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 35px; overflow: hidden;background-color: #fff">
        <form id="dangerPointsInfoSearchForm">
            <table>
                <tr>
                	<th style="width:32px;">区域:</th>
	                <td><select id="dangerPointsInfoQy" name="dscd" style="width: 143px; height: 22px;"></select></td>
                    <th>隐患点名称:</th>
                    <td><input name="vl" class="easyui-textbox" /></td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="dangerPointsInfoSearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="dangerPointsInfoCleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
     </div>
 
    <div data-options="region:'center',border:false">
        <table id="dangerPointsInfoDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="dangerPointsInfoToolbar" style="display: none;">
    <shiro:hasPermission name="/dangerPointsInfo/add">
        <a onclick="dangerPointsInfoAddFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-page-add'">添加</a>
    </shiro:hasPermission>
</div>