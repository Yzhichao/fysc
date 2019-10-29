<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var reservoirInfoDataGrid;
    $(function() {
        reservoirInfoDataGrid = $('#reservoirInfoDataGrid').datagrid({
        url : '${path}/reservoirInfo/dataGrid',
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
    title : '所在镇（街道）',
    field : 'TWN',
    sortable : true
},{
    width : '120',
    title : '填表日期',
    field : 'FLDT',
    sortable : true
},{
    width : '120',
    title : '水库名称',
    field : 'RSNAME',
    sortable : true
},{
    width : '120',
    title : '曾用水库名称',
    field : 'RSORGNAME',
    sortable : true
},{
    width : '120',
    title : '工程状态',
    field : 'PRST',
    sortable : true
},{
    width : '120',
    title : '工程规模',
    field : 'PRSC',
    sortable : true
},{
    width : '120',
    title : '工程等别',
    field : 'PRGRD',
    sortable : true
},{
    width : '120',
    title : '水库类别',
    field : 'RSCT',
    sortable : true
},{
    width : '120',
    title : '水库类型',
    field : 'RSTYPE',
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
    title : '高程基准面',
    field : 'ELDTM',
    sortable : true
},{
    width : '120',
    title : '所在流域',
    field : 'BSNM',
    sortable : true
},{
    width : '120',
    title : '所在水系',
    field : 'HNNM',
    sortable : true
},{
    width : '120',
    title : '所在河流',
    field : 'RVNM',
    sortable : true
},{
    width : '120',
    title : '主体工程开工时间',
    field : 'MNPRCMDT',
    sortable : true
},{
    width : '120',
    title : '下闸蓄水时间',
    field : 'BGSTDT',
    sortable : true
},{
    width : '120',
    title : '竣工验收时间',
    field : 'CMDT',
    sortable : true
},{
    width : '120',
    title : '最近一次加固改造-主体工程开工时间',
    field : 'LTTRMPDT',
    sortable : true
},{
    width : '120',
    title : '最近一次加固改造-下闸蓄水时间',
    field : 'LTTRSTDT',
    sortable : true
},{
    width : '120',
    title : '最近一次加固改造-竣工验收时间',
    field : 'LTTRCMDT',
    sortable : true
},{
    width : '120',
    title : '当前工程安全类别',
    field : 'SFCT',
    sortable : true
},{
    width : '120',
    title : '坝址以上控制流域面积/k㎡',
    field : 'WTRAR',
    sortable : true
},{
    width : '120',
    title : '坝址以上多年平均径流量/万m³',
    field : 'MNANW',
    sortable : true
},{
    width : '120',
    title : '设计洪水标准/%',
    field : 'DSFLST',
    sortable : true
},{
    width : '120',
    title : '设计洪水流量/m³/s',
    field : 'DSQ',
    sortable : true
},{
    width : '120',
    title : '设计1日洪水洪量/亿m³',
    field : 'DSW1',
    sortable : true
},{
    width : '120',
    title : '设计3日洪水洪量/亿m³',
    field : 'DSW3',
    sortable : true
},{
    width : '120',
    title : '设计7日洪水洪量/亿m³',
    field : 'DSW7',
    sortable : true
},{
    width : '120',
    title : '校核洪水标准/%',
    field : 'CHFLST',
    sortable : true
},{
    width : '120',
    title : '校核洪水流量/m³/s',
    field : 'CHFLQ',
    sortable : true
},{
    width : '120',
    title : '校核1日洪水洪量/亿m³',
    field : 'CHW1',
    sortable : true
},{
    width : '120',
    title : '校核3日洪水洪量/亿m³',
    field : 'CHW3',
    sortable : true
},{
    width : '120',
    title : '校核7日洪水洪量/亿m³',
    field : 'CHW7',
    sortable : true
},{
    width : '120',
    title : '调节性能',
    field : 'OPPR',
    sortable : true
},{
    width : '120',
    title : '库容系数/%',
    field : 'CPCF',
    sortable : true
},{
    width : '120',
    title : '校核洪水位/m',
    field : 'CHFLZ',
    sortable : true
},{
    width : '120',
    title : '设计洪水位/m',
    field : 'DSFLZ',
    sortable : true
},{
    width : '120',
    title : '正常蓄水位/m',
    field : 'NORMZ',
    sortable : true
},{
    width : '120',
    title : '防洪高水位/m',
    field : 'FLDZ',
    sortable : true
},{
    width : '120',
    title : '汛期限制水位-前汛期/m',
    field : 'PRFSLTDZ',
    sortable : true
},{
    width : '120',
    title : '汛期限制水位-主汛期/m',
    field : 'MAINFSLTDZ',
    sortable : true
},{
    width : '120',
    title : '汛期限制水位-后汛期/m',
    field : 'ENDFSLTDZ',
    sortable : true
},{
    width : '120',
    title : '死水位/m',
    field : 'DDZ',
    sortable : true
},{
    width : '120',
    title : '总库容/万m³',
    field : 'TTCP',
    sortable : true
},{
    width : '120',
    title : '防洪库容/万m³',
    field : 'FLDCP',
    sortable : true
},{
    width : '120',
    title : '调节库容/万m³',
    field : 'ADJCP',
    sortable : true
},{
    width : '120',
    title : '死库容/万m³',
    field : 'DDCP',
    sortable : true
},{
    width : '120',
    title : '淤积库容/万m³',
    field : 'SDCP',
    sortable : true
},{
    width : '120',
    title : '回水长度/m',
    field : 'BCWTLEN',
    sortable : true
},{
    width : '120',
    title : '设计洪水位时最大下泄流量/m³/s',
    field : 'DSZMXTQ',
    sortable : true
},{
    width : '120',
    title : '校核洪水位时最大下泄流量/m³/s',
    field : 'CHZMXTQ',
    sortable : true
},{
    width : '120',
    title : '下游河道安全泄量/m³/s',
    field : 'DOWNSTRSFTQ',
    sortable : true
},{
    width : '120',
    title : '地震基本烈度/度',
    field : 'ERTINT',
    sortable : true
},{
    width : '120',
    title : '地震动峰值加速度/g',
    field : 'SPGA',
    sortable : true
},{
    width : '120',
    title : '抗震设计烈度/度',
    field : 'DSSSINT',
    sortable : true
},{
    width : '120',
    title : '地震反应谱特征周期/s',
    field : 'CPSRS',
    sortable : true
},{
    width : '120',
    title : '主坝数量',
    field : 'MDAMQN',
    sortable : true
},{
    width : '120',
    title : '副坝数量',
    field : 'AXDAMQN',
    sortable : true
},{
    width : '120',
    title : '主坝-坝型',
    field : 'MDAMTYPE',
    sortable : true
},{
    width : '120',
    title : '主坝-坝顶高程/m',
    field : 'MD_EL',
    sortable : true
},{
    width : '120',
    title : '主坝-最大坝高/m',
    field : 'MD_MX_HIG',
    sortable : true
},{
    width : '120',
    title : '主坝-坝顶长度/m',
    field : 'MDCRLEN',
    sortable : true
},{
    width : '120',
    title : '泄洪建筑物类型',
    field : 'FLDSSTTYPE',
    sortable : true
},{
    width : '120',
    title : '正常溢洪道数量',
    field : 'NRSPQN',
    sortable : true
},{
    width : '120',
    title : '非常溢洪道数量',
    field : 'ABNSPQN',
    sortable : true
},{
    width : '120',
    title : '泄洪洞数量',
    field : 'SPTNQN',
    sortable : true
},{
    width : '120',
    title : '放空洞数量',
    field : 'MPTNQN',
    sortable : true
},{
    width : '120',
    title : '排沙洞数量',
    field : 'SDDLTNQN',
    sortable : true
},{
    width : '120',
    title : '引水建筑物数量',
    field : 'WTDVSTQN',
    sortable : true
},{
    width : '120',
    title : '输水建筑物数量',
    field : 'WTCNSTQN',
    sortable : true
},{
    width : '120',
    title : '电站数量',
    field : 'PWSTQN',
    sortable : true
},{
    width : '120',
    title : '通航建筑物数量',
    field : 'NVSTQN',
    sortable : true
},{
    width : '120',
    title : '过鱼建筑物数量',
    field : 'FSPSSTQN',
    sortable : true
},{
    width : '120',
    title : '防洪保护-总人口/人',
    field : 'FLCNPRPP',
    sortable : true
},{
    width : '120',
    title : '防洪保护-耕地/万亩',
    field : 'FLCNPRARL',
    sortable : true
},{
    width : '120',
    title : '防洪保护-城市',
    field : 'FLCNCT',
    sortable : true
},{
    width : '120',
    title : '防洪保护-集镇',
    field : 'FLCNCTY',
    sortable : true
},{
    width : '120',
    title : '防洪保护-铁路',
    field : 'FLCNTWN',
    sortable : true
},{
    width : '120',
    title : '防洪保护-公路',
    field : 'FLCNRD',
    sortable : true
},{
    width : '120',
    title : '防洪保护-重要管线通信设施',
    field : 'FLCNICF',
    sortable : true
},{
    width : '120',
    title : '防洪保护-重要厂矿企业',
    field : 'FLCNIEN',
    sortable : true
},{
    width : '120',
    title : '防洪保护-军事设施',
    field : 'FLCNMF',
    sortable : true
},{
    width : '120',
    title : '防洪保护-其他重要设施',
    field : 'FLCNOIF',
    sortable : true
},{
    width : '120',
    title : '设计灌溉面积(近期)/万亩',
    field : 'REDSIRAR',
    sortable : true
},{
    width : '120',
    title : '设计灌溉面积(远期)/万亩',
    field : 'FRDSIRAR',
    sortable : true
},{
    width : '120',
    title : '近三年平均年灌溉引水量/万m³/年',
    field : 'RTYAAWTDVIR',
    sortable : true
},{
    width : '120',
    title : '目前有效灌溉面积/万亩',
    field : 'CUEIRAR',
    sortable : true
},{
    width : '120',
    title : '近三年平均年灌溉收入/万元/年',
    field : 'RTYAIIR',
    sortable : true
},{
    width : '120',
    title : '年供水量（近期）/万m³/年',
    field : 'REANWTSP',
    sortable : true
},{
    width : '120',
    title : '年供水量（远期）/万m³/年',
    field : 'FRANWTSP',
    sortable : true
},{
    width : '120',
    title : '近三年平均年供水量/万m³',
    field : 'RTYANWTSPQN',
    sortable : true
},{
    width : '120',
    title : '近三年平均年供水收入/万元/年',
    field : 'RTYANWTSPIN',
    sortable : true
},{
    width : '120',
    title : '近三年平均年发电量/kWh',
    field : 'RTYAENOT',
    sortable : true
},{
    width : '120',
    title : '近三年平均年发电量收入/万元/年',
    field : 'RTYAENOTIN',
    sortable : true
},{
    width : '120',
    title : '近三年平均年运输量/万t',
    field : 'RTYATR',
    sortable : true
},{
    width : '120',
    title : '近三年平均年运输收入/万元/年',
    field : 'RTYATRIN',
    sortable : true
},{
    width : '120',
    title : '近三年水库其他年经营性收入/万元/年',
    field : 'RTYRSOTIN',
    sortable : true
},{
    width : '120',
    title : '管理单位性质',
    field : 'ADDPNT',
    sortable : true
},{
    width : '120',
    title : '近三年平均年运行维护经费/万元/年',
    field : 'RTYAMETEX',
    sortable : true
},{
    width : '120',
    title : '财政补贴/万元/年',
    field : 'FS',
    sortable : true
},{
    width : '120',
    title : '自筹/万元/年',
    field : 'SR',
    sortable : true
},{
    width : '120',
    title : '管理单位在职职工人数/人',
    field : 'ADDPP',
    sortable : true
},{
    width : '120',
    title : '大专以上学历/人',
    field : 'ABCLP',
    sortable : true
},{
    width : '120',
    title : '工程师以上/人',
    field : 'ABENGP',
    sortable : true
},{
    width : '120',
    title : '纳入财政保障的职工人数/人',
    field : 'ICFSP',
    sortable : true
},{
    width : '120',
    title : '备用电源是否配置',
    field : 'SPS',
    sortable : true
},{
    width : '120',
    title : '管理范围是否划定',
    field : 'DSSCC',
    sortable : true
},{
    width : '120',
    title : '管理范围是否确权',
    field : 'DTSCC',
    sortable : true
},{
    width : '120',
    title : '保护范围是否划定',
    field : 'DSPRSC',
    sortable : true
},{
    width : '120',
    title : '管养分离是否实行',
    field : 'SPMNMN',
    sortable : true
},{
    width : '120',
    title : '历史最高水位/m',
    field : 'HHRZ',
    sortable : true
},{
    width : '120',
    title : '历史最高水位发生日期',
    field : 'HHRZDT',
    sortable : true
},{
    width : '120',
    title : '历史最低水位/m',
    field : 'HLRZ',
    sortable : true
},{
    width : '120',
    title : '历史最低水位发生日期',
    field : 'HLRZDT',
    sortable : true
},{
    width : '120',
    title : '历史最大入库流量/m³/s',
    field : 'HMXINQ',
    sortable : true
},{
    width : '120',
    title : '历史最大入库流量发生日期',
    field : 'HMXINQDT',
    sortable : true
},{
    width : '120',
    title : '历史最大下泄流量/m³/s',
    field : 'HMXOTQ',
    sortable : true
},{
    width : '120',
    title : '历史最大下泄流量发生日期',
    field : 'HMXOTQDT',
    sortable : true
},{
    width : '120',
    title : '水情测报方式',
    field : 'MSWTMT',
    sortable : true
},{
    width : '120',
    title : '工程监测方式',
    field : 'MSPRMT',
    sortable : true
},{
    width : '120',
    title : '仪器埋设安装数量/支或个',
    field : 'ININQN',
    sortable : true
},{
    width : '120',
    title : '仪器完好率/%',
    field : 'SNINRT',
    sortable : true
},{
    width : '120',
    title : '整编分析周期/月',
    field : 'RRANCY',
    sortable : true
},{
    width : '120',
    title : '最近一次整编时间',
    field : 'LRRTM',
    sortable : true
},{
    width : '120',
    title : '主坝最大沉降量/mm',
    field : 'MDAMXST',
    sortable : true
},{
    width : '120',
    title : '主坝最大渗漏量/L/S',
    field : 'MDAMXLK',
    sortable : true
},{
    width : '120',
    title : '主坝水平位移量/mm',
    field : 'MDAMHD',
    sortable : true
},{
    width : '120',
    title : '副坝最大渗漏量/L/S',
    field : 'AXDAMMXLK',
    sortable : true
},{
    width : '120',
    title : '鉴定次数',
    field : 'IDTM',
    sortable : true
},{
    width : '120',
    title : '最近一次安全鉴定时间',
    field : 'LIDDT',
    sortable : true
},{
    width : '120',
    title : '最近一次安全鉴定审定单位',
    field : 'LIDADDP',
    sortable : true
},{
    width : '120',
    title : '最近一次安全鉴定结论',
    field : 'LIDCN',
    sortable : true
},{
    width : '120',
    title : '水库管理单位申报意见',
    field : 'MDOP',
    sortable : true
},{
    width : '120',
    title : '管理单位负责人（/法人代表）',
    field : 'MDHD',
    sortable : true
},{
    width : '120',
    title : '水库管理单位印章',
    field : 'MDSL',
    sortable : true
},{
    width : '120',
    title : '水库管理单位申报日期',
    field : 'RSMDDCDT',
    sortable : true
},{
    width : '120',
    title : '主管部门审核意见',
    field : 'ADADOP',
    sortable : true
},{
    width : '120',
    title : '主管部门负责人（签章）',
    field : 'ADHD',
    sortable : true
},{
    width : '120',
    title : '主管部门单位印章',
    field : 'ADSL',
    sortable : true
},{
    width : '120',
    title : '主管部门审核日期',
    field : 'ADADDT',
    sortable : true
},{
    width : '120',
    title : '负责注册登记的水行政主管部门审批意见',
    field : 'RGADADOP',
    sortable : true
},{
    width : '120',
    title : '负责注册登记部门主管负责人（签章）',
    field : 'RGADHD',
    sortable : true
},{
    width : '120',
    title : '负责注册登记单位印章',
    field : 'RGADSL',
    sortable : true
},{
    width : '120',
    title : '负责注册登记部门审批日期',
    field : 'RGADADDT',
    sortable : true
},{
    width : '120',
    title : '注册登记号',
    field : 'RGNUM',
    sortable : true
},{
    width : '120',
    title : '注册登记类型',
    field : 'RGTYPE',
    sortable : true
},{
    width : '120',
    title : '注册登记状态',
    field : 'RGST',
    sortable : true
},{
    width : '120',
    title : '发证日期',
    field : 'CRDT',
    sortable : true
},{
    width : '120',
    title : '管理单位名称',
    field : 'MDNM',
    sortable : true
},{
    width : '120',
    title : '管理单位邮政编码',
    field : 'MDPC',
    sortable : true
},{
    width : '120',
    title : '管理单位负责人（/法人代表）',
    field : 'MDHD1',
    sortable : true
},{
    width : '120',
    title : '管理单位联系人',
    field : 'MDCN',
    sortable : true
},{
    width : '120',
    title : '管理单位通信地址',
    field : 'MDCAD',
    sortable : true
},{
    width : '120',
    title : '管理单位固定电话',
    field : 'MDTELL',
    sortable : true
},{
    width : '120',
    title : '管理单位移动电话',
    field : 'MDMB',
    sortable : true
},{
    width : '120',
    title : '管理单位传真',
    field : 'MDFAX',
    sortable : true
},{
    width : '120',
    title : '管理单位Email',
    field : 'MDEMAIL',
    sortable : true
},{
    width : '120',
    title : '主管部门名称',
    field : 'ADNM',
    sortable : true
},{
    width : '120',
    title : '主管部门邮政编码',
    field : 'ADPC',
    sortable : true
},{
    width : '120',
    title : '主管部门联系人',
    field : 'ADCN',
    sortable : true
},{
    width : '120',
    title : '主管部门通信地址',
    field : 'ADCAD',
    sortable : true
},{
    width : '120',
    title : '主管部门固定电话',
    field : 'ADTELL',
    sortable : true
},{
    width : '120',
    title : '主管部门移动电话',
    field : 'ADMB',
    sortable : true
},{
    width : '120',
    title : '主管部门传真',
    field : 'ADFAX',
    sortable : true
},{
    width : '120',
    title : '主管部门Email',
    field : 'ADEMAIL',
    sortable : true
},{
    width : '120',
    title : '水库注册登记机构名称',
    field : 'RSRGINNM',
    sortable : true
},{
    width : '120',
    title : '水库注册登记机构邮政编码',
    field : 'RSRGINPC',
    sortable : true
},{
    width : '120',
    title : '水库注册登记机构联系人',
    field : 'RSRGINCN',
    sortable : true
},{
    width : '120',
    title : '水库注册登记机构通信地址',
    field : 'RSRGINCAD',
    sortable : true
},{
    width : '120',
    title : '水库注册登记机构固定电话',
    field : 'RSRGINTELL',
    sortable : true
},{
    width : '120',
    title : '水库注册登记机构移动电话',
    field : 'RSRGINMB',
    sortable : true
},{
    width : '120',
    title : '水库注册登记机构传真',
    field : 'RSRGINFAX',
    sortable : true
},{
    width : '120',
    title : '水库注册登记机构Email',
    field : 'RSRGINEMAIL',
    sortable : true
},{
    width : '120',
    title : '水库功能',
    field : 'RSFN',
    sortable : true
},{
    width : '120',
    title : '水情监测项目',
    field : 'MSWTPR',
    sortable : true
},{
    width : '120',
    title : '工程监测项目',
    field : 'MSPRPR',
    sortable : true
},{
            field : 'action',
            title : '操作',
            width : 200,
            formatter : function(value, row, index) {
                var str = '';
                <shiro:hasPermission name="/reservoirInfo/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="reservoirInfo-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="reservoirInfoEditFun(\'{0}\');" >编辑</a>', row.ID);
                </shiro:hasPermission>
                <shiro:hasPermission name="/reservoirInfo/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="reservoirInfo-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="reservoirInfoDeleteFun(\'{0}\');" >删除</a>', row.ID);
                </shiro:hasPermission>
                return str;
            }
        } ] ],
        onLoadSuccess:function(data){
            $('.reservoirInfo-easyui-linkbutton-edit').linkbutton({text:'编辑'});
            $('.reservoirInfo-easyui-linkbutton-del').linkbutton({text:'删除'});
        },
        toolbar : '#reservoirInfoToolbar'
    });
        $('#reservoirInfoQy').combotree({
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
function reservoirInfoAddFun() {
    parent.$.modalDialog({
        title : '添加',
        width : 700,
        height : 600,
        href : '${path}/reservoirInfo/addPage',
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = reservoirInfoDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#reservoirInfoAddForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 编辑
 */
function reservoirInfoEditFun(id) {
    if (id == undefined) {
        var rows = reservoirInfoDataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        reservoirInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.modalDialog({
        title : '编辑',
        width : 700,
        height : 600,
        href :  '${path}/reservoirInfo/editPage?id=' + id,
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = reservoirInfoDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#reservoirInfoEditForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 删除
 */
 function reservoirInfoDeleteFun(id) {
     if (id == undefined) {//点击右键菜单才会触发这个
         var rows = reservoirInfoDataGrid.datagrid('getSelections');
         id = rows[0].id;
     } else {//点击操作里面的删除图标会触发这个
         reservoirInfoDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
     }
     parent.$.messager.confirm('询问', '您是否要删除当前记录？', function(b) {
         if (b) {
             progressLoad();
             $.post('${path}/reservoirInfo/delete', {
                 id : id
             }, function(result) {
                 if (result.success) {
                     parent.$.messager.alert('提示', result.msg, 'info');
                     reservoirInfoDataGrid.datagrid('reload');
                 }
                 progressClose();
             }, 'JSON');
         }
     });
}


/**
 * 清除
 */
function reservoirInfoCleanFun() {
    $('#reservoirInfoSearchForm input').val('');
    reservoirInfoDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function reservoirInfoSearchFun() {
     reservoirInfoDataGrid.datagrid('load', $.serializeObject($('#reservoirInfoSearchForm')));
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 35px; overflow: hidden;background-color: #fff">
        <form id="reservoirInfoSearchForm">
            <table>
                <tr>
                	<th style="width:32px;">区域:</th>
	                <td><select id="reservoirInfoQy" name="dscd" style="width: 143px; height: 22px;"></select></td>
                    <th>水库名称:</th>
                    <td><input name="rsname" class="easyui-textbox" /></td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="reservoirInfoSearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="reservoirInfoCleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
     </div>
 
    <div data-options="region:'center',border:false">
        <table id="reservoirInfoDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="reservoirInfoToolbar" style="display: none;">
    <shiro:hasPermission name="/reservoirInfo/add">
        <a onclick="reservoirInfoAddFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-page-add'">添加</a>
    </shiro:hasPermission>
</div>