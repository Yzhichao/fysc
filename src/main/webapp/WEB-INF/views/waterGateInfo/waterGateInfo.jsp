<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var waterGateInfoDataGrid;
    $(function() {
        waterGateInfoDataGrid = $('#waterGateInfoDataGrid').datagrid({
        url : '${path}/waterGateInfo/dataGrid',
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
    title : '工程名称',
    field : 'PRNM',
    sortable : true
},{
    width : '120',
    title : '水资源三级分区',
    field : 'TLDWR',
    sortable : true
},{
    width : '120',
    title : '是否为闸站工程',
    field : 'GS',
    sortable : true
},{
    width : '120',
    title : '是否为套闸工程',
    field : 'SS',
    sortable : true
},{
    width : '120',
    title : '工程状态',
    field : 'PRST',
    sortable : true
},{
    width : '120',
    title : '工程等级',
    field : 'PRGRD',
    sortable : true
},{
    width : '120',
    title : '闸孔数量(孔)',
    field : 'HOLE_NUM',
    sortable : true
},{
    width : '120',
    title : '闸孔总净宽(m)',
    field : 'HOLE_WID',
    sortable : true
},{
    width : '120',
    title : '副闸闸孔数量(孔)',
    field : 'AX_HOLE_NUM',
    sortable : true
},{
    width : '120',
    title : '闸孔总净宽(m)',
    field : 'AX_HOLE_WID',
    sortable : true
},{
    width : '120',
    title : '水闸类型',
    field : 'GATE_TYPE',
    sortable : true
},{
    width : '120',
    title : '分洪闸过闸流量(m³/s)',
    field : 'FDSQ',
    sortable : true
},{
    width : '120',
    title : '节制闸过闸流量',
    field : 'CGQ',
    sortable : true
},{
    width : '120',
    title : '排水闸过闸流量',
    field : 'DSQ',
    sortable : true
},{
    width : '120',
    title : '挡潮闸过闸流量',
    field : 'TBQ',
    sortable : true
},{
    width : '120',
    title : '橡胶坝坝高',
    field : 'RDH',
    sortable : true
},{
    width : '120',
    title : '橡胶坝坝长',
    field : 'RDL',
    sortable : true
},{
    width : '120',
    title : '归口管理部门代码',
    field : 'CADCD',
    sortable : true
},{
    width : '120',
    title : '管理单位编码',
    field : 'ADCD',
    sortable : true
},{
    width : '120',
    title : '是否划界',
    field : 'DS',
    sortable : true
},{
    width : '120',
    title : '是否确权',
    field : 'DT',
    sortable : true
},{
    width : '120',
    title : '管理单位名称',
    field : 'ADNM',
    sortable : true
},{
    width : '120',
    title : '镇（街）',
    field : 'TWN',
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
},
{
            field : 'action',
            title : '操作',
            width : 200,
            formatter : function(value, row, index) {
                var str = '';
                <shiro:hasPermission name="/waterGateInfo/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="waterGateInfo-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="waterGateInfoEditFun(\'{0}\');" >编辑</a>', row.ID);
                </shiro:hasPermission>
                <shiro:hasPermission name="/waterGateInfo/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="waterGateInfo-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="waterGateInfoDeleteFun(\'{0}\');" >删除</a>', row.ID);
                </shiro:hasPermission>
                return str;
            }
        } ] ],
        onLoadSuccess:function(data){
            $('.waterGateInfo-easyui-linkbutton-edit').linkbutton({text:'编辑'});
            $('.waterGateInfo-easyui-linkbutton-del').linkbutton({text:'删除'});
        },
        toolbar : '#waterGateInfoToolbar'
    });
    $('#waterGateInfoQy').combotree({
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
function waterGateInfoAddFun() {
    parent.$.modalDialog({
        title : '添加',
        width : 700,
        height : 600,
        href : '${path}/waterGateInfo/addPage',
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = waterGateInfoDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#waterGateInfoAddForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 编辑
 */
function waterGateInfoEditFun(id) {
    if (id == undefined) {
        var rows = waterGateInfoDataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        waterGateInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.modalDialog({
        title : '编辑',
        width : 700,
        height : 600,
        href :  '${path}/waterGateInfo/editPage?id=' + id,
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = waterGateInfoDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#waterGateInfoEditForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 删除
 */
 function waterGateInfoDeleteFun(id) {
     if (id == undefined) {//点击右键菜单才会触发这个
         var rows = waterGateInfoDataGrid.datagrid('getSelections');
         id = rows[0].id;
     } else {//点击操作里面的删除图标会触发这个
         waterGateInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
     }
     parent.$.messager.confirm('询问', '您是否要删除当前记录？', function(b) {
         if (b) {
             progressLoad();
             $.post('${path}/waterGateInfo/delete', {
                 id : id
             }, function(result) {
                 if (result.success) {
                     parent.$.messager.alert('提示', result.msg, 'info');
                     waterGateInfoDataGrid.datagrid('reload');
                 }
                 progressClose();
             }, 'JSON');
         }
     });
}


/**
 * 清除
 */
function waterGateInfoCleanFun() {
    $('#waterGateInfoSearchForm input').val('');
    waterGateInfoDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function waterGateInfoSearchFun() {
     waterGateInfoDataGrid.datagrid('load', $.serializeObject($('#waterGateInfoSearchForm')));
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 35px; overflow: hidden;background-color: #fff">
        <form id="waterGateInfoSearchForm">
            <table>
                <tr>
                	<th style="width:32px;">区域:</th>
	                <td><select id="waterGateInfoQy" name="dscd" style="width: 143px; height: 22px;"></select></td>
                    <th>水闸名称:</th>
                    <td><input name="prnm" class="easyui-textbox" /></td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="waterGateInfoSearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="waterGateInfoCleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
     </div>
 
    <div data-options="region:'center',border:false">
        <table id="waterGateInfoDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="waterGateInfoToolbar" style="display: none;">
    <shiro:hasPermission name="/waterGateInfo/add">
        <a onclick="waterGateInfoAddFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-page-add'">添加</a>
    </shiro:hasPermission>
</div>