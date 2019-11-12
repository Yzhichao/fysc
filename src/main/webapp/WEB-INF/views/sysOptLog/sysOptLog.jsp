<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var sysOptLogDataGrid;
    $(function() {
        sysOptLogDataGrid = $('#sysOptLogDataGrid').datagrid({
        url : '${path}/sysOptLog/dataGrid',
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
            width : '80',
            title : '登陆名',
            field : 'login_name',
            sortable : true
        },{
            width : '80',
            title : '角色名',
            field : 'role_name',
            sortable : true
        },{
            width : '160',
            title : '操作的表名',
            field : 'opt_table',
            sortable : true
        },{
            width : '160',
            title : '操作数据的id',
            field : 'opt_id',
            sortable : true
        },{
            width : '80',
            title : '操作类型',
            field : 'opt_type',
            sortable : true,
            formatter: function (data) {
                var str = '';
                switch (data) {
                    case 1: str = '新增'; break;
                    case 2: str = '修改'; break;
                    case 3: str = '删除'; break;
                    default: str = ''; break;
                }
                return str;
            }
        },{
            width : '160',
            title : '客户端ip',
            field : 'client_ip',
            sortable : true
        },{
            width : '160',
            title : '创建时间',
            field : 'create_time',
            sortable : true
        } ] ],
        onLoadSuccess:function(data){
            $('.sysOptLog-easyui-linkbutton-edit').linkbutton({text:'编辑'});
            $('.sysOptLog-easyui-linkbutton-del').linkbutton({text:'删除'});
        },
        toolbar : '#sysOptLogToolbar'
    });
});

/**
 * 清除
 */
function sysOptLogCleanFun() {
    $('#sysOptLogSearchForm input').val('');
    sysOptLogDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function sysOptLogSearchFun() {
     sysOptLogDataGrid.datagrid('load', $.serializeObject($('#sysOptLogSearchForm')));
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 35px; overflow: hidden;background-color: #fff">
        <form id="sysOptLogSearchForm">
            <table>
                <tr>
                	<th style="width:60px;">操作类型:</th>
	                <td><select id="optType" name="optType" style="width: 143px; height: 22px;">
                        <option value=""></option>
                        <option value="1">新增</option>
                        <option value="2">修改</option>
                        <option value="3">删除</option>
                    </select></td>
                    <th>操作的表名:</th>
                    <td><input name="optTable" class="easyui-textbox" /></td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="sysOptLogSearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="sysOptLogCleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
     </div>

    <div data-options="region:'center',border:false">
        <table id="sysOptLogDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
