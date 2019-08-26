<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var dangerAreaInfoDataGrid;
    $(function() {
        dangerAreaInfoDataGrid = $('#dangerAreaInfoDataGrid').datagrid({
        url : '${path}/dangerAreaInfo/dataGrid',
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
            title : '危险区名称',
            field : 'DZ_NAME',
            sortable : true
        },{
            width : '160',
            title : '位置',
            field : 'ADD',
            sortable : true
        },{
            width : '160',
            title : '所在镇（街）',
            field : 'TWN',
            sortable : true
        },{
            width : '80',
            title : '易受灾类型',
            field : 'AF_TYPE',
            sortable : true
        },{
            width : '80',
            title : '房屋数量',
            field : 'HS_NUM',
            sortable : true
        },{
            width : '80',
            title : '受威胁人数',
            field : 'THPP',
            sortable : true
        },{
            width : '160',
            title : '重要设施、厂矿企业',
            field : 'IMFC',
            sortable : true
        },{
            width : '180',
            title : '预警方式（铜锣、手摇报警器）',
            field : 'WR_WAY',
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
                <shiro:hasPermission name="/dangerAreaInfo/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="dangerAreaInfo-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="dangerAreaInfoEditFun(\'{0}\');" >编辑</a>', row.ID);
                </shiro:hasPermission>
                <shiro:hasPermission name="/dangerAreaInfo/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="dangerAreaInfo-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="dangerAreaInfoDeleteFun(\'{0}\');" >删除</a>', row.ID);
                </shiro:hasPermission>
                return str;
            }
        } ] ],
        onLoadSuccess:function(data){
            $('.dangerAreaInfo-easyui-linkbutton-edit').linkbutton({text:'编辑'});
            $('.dangerAreaInfo-easyui-linkbutton-del').linkbutton({text:'删除'});
        },
        toolbar : '#dangerAreaInfoToolbar'
    });
    $('#dangerAreaInfoQy').combotree({
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
function dangerAreaInfoAddFun() {
    parent.$.modalDialog({
        title : '添加',
        width : 700,
        height : 600,
        href : '${path}/dangerAreaInfo/addPage',
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = dangerAreaInfoDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#dangerAreaInfoAddForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 编辑
 */
function dangerAreaInfoEditFun(id) {
    if (id == undefined) {
        var rows = dangerAreaInfoDataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        dangerAreaInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.modalDialog({
        title : '编辑',
        width : 700,
        height : 600,
        href :  '${path}/dangerAreaInfo/editPage?id=' + id,
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = dangerAreaInfoDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#dangerAreaInfoEditForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 删除
 */
 function dangerAreaInfoDeleteFun(id) {
     if (id == undefined) {//点击右键菜单才会触发这个
         var rows = dangerAreaInfoDataGrid.datagrid('getSelections');
         id = rows[0].id;
     } else {//点击操作里面的删除图标会触发这个
         dangerAreaInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
     }
     parent.$.messager.confirm('询问', '您是否要删除当前记录？', function(b) {
         if (b) {
             progressLoad();
             $.post('${path}/dangerAreaInfo/delete', {
                 id : id
             }, function(result) {
                 if (result.success) {
                     parent.$.messager.alert('提示', result.msg, 'info');
                     dangerAreaInfoDataGrid.datagrid('reload');
                 }
                 progressClose();
             }, 'JSON');
         }
     });
}


/**
 * 清除
 */
function dangerAreaInfoCleanFun() {
    $('#dangerAreaInfoSearchForm input').val('');
    dangerAreaInfoDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function dangerAreaInfoSearchFun() {
     dangerAreaInfoDataGrid.datagrid('load', $.serializeObject($('#dangerAreaInfoSearchForm')));
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 35px; overflow: hidden;background-color: #fff">
        <form id="dangerAreaInfoSearchForm">
            <table>
                <tr>
                	<th style="width:32px;">区域:</th>
	                <td><select id="dangerAreaInfoQy" name="dscd" style="width: 143px; height: 22px;"></select></td>
                    <th>危险区名称:</th>
                    <td><input name="dzName" class="easyui-textbox" /></td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="dangerAreaInfoSearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="dangerAreaInfoCleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
     </div>
 
    <div data-options="region:'center',border:false">
        <table id="dangerAreaInfoDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="dangerAreaInfoToolbar" style="display: none;">
    <shiro:hasPermission name="/dangerAreaInfo/add">
        <a onclick="dangerAreaInfoAddFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-page-add'">添加</a>
    </shiro:hasPermission>
</div>