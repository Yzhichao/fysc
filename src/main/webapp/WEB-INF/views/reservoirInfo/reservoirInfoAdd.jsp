<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
        $('#reservoirInfoAddForm').form({
            url : '${path}/reservoirInfo/add',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                return isValid;
            },
            success : function(result) {
                progressClose();
                result = $.parseJSON(result);
                if (result.success) {
                    //之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    parent.$.messager.alert('错误', result.msg, 'error');
                }
            }
        });
        $('#reservoirInfoAddQy').combotree({
            url : '${path }/user/tree',
            parentField : 'pid',
            valueField: 'id',
            lines : true,
            width:200,
            panelHeight : 300,
            onClick: function(node){
        		$("#reservoirInfoAddZwQy").val(node.text);
        	}
        });
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false" >
    <div data-options="region:'center',border:false" style="padding: 3px;" >
        <form id="reservoirInfoAddForm" method="post">
            <table class="grid">
                 <tr>
                    <td>所在镇（街）</td>
                    <td>
                    	<select id="reservoirInfoAddQy" name="dscd"  style="width: 260px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select>
                    	<input name="twn" id="reservoirInfoAddZwQy" type="hidden">
                    </td>
                </tr>
<tr>
    <td>填表日期</td>
    <td><input name="fldt" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>水库名称</td>
    <td><input name="rsname" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>曾用水库名称</td>
    <td><input name="rsorgname" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>工程状态</td>
    <td><input name="prst" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>工程规模</td>
    <td><input name="prsc" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>工程等别</td>
    <td><input name="prgrd" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>水库类别</td>
    <td><input name="rsct" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>水库类型</td>
    <td><input name="rstype" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>高程基准面</td>
    <td><input name="eldtm" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>所在流域</td>
    <td><input name="bsnm" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>所在水系</td>
    <td><input name="hnnm" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>所在河流</td>
    <td><input name="rvnm" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>主体工程开工时间</td>
    <td><input name="mnprcmdt" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>下闸蓄水时间</td>
    <td><input name="bgstdt" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>竣工验收时间</td>
    <td><input name="cmdt" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>最近一次加固改造-主体工程开工时间</td>
    <td><input name="lttrmpdt" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>最近一次加固改造-下闸蓄水时间</td>
    <td><input name="lttrstdt" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>最近一次加固改造-竣工验收时间</td>
    <td><input name="lttrcmdt" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>当前工程安全类别</td>
    <td><input name="sfct" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>坝址以上控制流域面积/k㎡</td>
    <td><input name="wtrar" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>坝址以上多年平均径流量/万m³</td>
    <td><input name="mnanw" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>设计洪水标准/%</td>
    <td><input name="dsflst" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>设计洪水流量/m³/s</td>
    <td><input name="dsq" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>设计1日洪水洪量/亿m³</td>
    <td><input name="dsw1" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>设计3日洪水洪量/亿m³</td>
    <td><input name="dsw3" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>设计7日洪水洪量/亿m³</td>
    <td><input name="dsw7" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>校核洪水标准/%</td>
    <td><input name="chflst" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>校核洪水流量/m³/s</td>
    <td><input name="chflq" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>校核1日洪水洪量/亿m³</td>
    <td><input name="chw1" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>校核3日洪水洪量/亿m³</td>
    <td><input name="chw3" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>校核7日洪水洪量/亿m³</td>
    <td><input name="chw7" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>调节性能</td>
    <td><input name="oppr" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>库容系数/%</td>
    <td><input name="cpcf" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>校核洪水位/m</td>
    <td><input name="chflz" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>设计洪水位/m</td>
    <td><input name="dsflz" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>正常蓄水位/m</td>
    <td><input name="normz" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>防洪高水位/m</td>
    <td><input name="fldz" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>汛期限制水位-前汛期/m</td>
    <td><input name="prfsltdz" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>汛期限制水位-主汛期/m</td>
    <td><input name="mainfsltdz" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>汛期限制水位-后汛期/m</td>
    <td><input name="endfsltdz" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>死水位/m</td>
    <td><input name="ddz" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>总库容/万m³</td>
    <td><input name="ttcp" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>防洪库容/万m³</td>
    <td><input name="fldcp" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>调节库容/万m³</td>
    <td><input name="adjcp" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>死库容/万m³</td>
    <td><input name="ddcp" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>淤积库容/万m³</td>
    <td><input name="sdcp" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>回水长度/m</td>
    <td><input name="bcwtlen" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>设计洪水位时最大下泄流量/m³/s</td>
    <td><input name="dszmxtq" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>校核洪水位时最大下泄流量/m³/s</td>
    <td><input name="chzmxtq" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>下游河道安全泄量/m³/s</td>
    <td><input name="downstrsftq" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>地震基本烈度/度</td>
    <td><input name="ertint" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>地震动峰值加速度/g</td>
    <td><input name="spga" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>抗震设计烈度/度</td>
    <td><input name="dsssint" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>地震反应谱特征周期/s</td>
    <td><input name="cpsrs" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>主坝数量</td>
    <td><input name="mdamqn" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>副坝数量</td>
    <td><input name="axdamqn" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>主坝-坝型</td>
    <td><input name="mdamtype" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>主坝-坝顶高程/m</td>
    <td><input name="mdEl" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>主坝-最大坝高/m</td>
    <td><input name="mdMxHig" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>主坝-坝顶长度/m</td>
    <td><input name="mdcrlen" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>泄洪建筑物类型</td>
    <td><input name="fldssttype" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>正常溢洪道数量</td>
    <td><input name="nrspqn" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>非常溢洪道数量</td>
    <td><input name="abnspqn" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>泄洪洞数量</td>
    <td><input name="sptnqn" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>放空洞数量</td>
    <td><input name="mptnqn" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>排沙洞数量</td>
    <td><input name="sddltnqn" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>引水建筑物数量</td>
    <td><input name="wtdvstqn" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>输水建筑物数量</td>
    <td><input name="wtcnstqn" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>电站数量</td>
    <td><input name="pwstqn" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>通航建筑物数量</td>
    <td><input name="nvstqn" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>过鱼建筑物数量</td>
    <td><input name="fspsstqn" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>防洪保护-总人口/人</td>
    <td><input name="flcnprpp" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>防洪保护-耕地/万亩</td>
    <td><input name="flcnprarl" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>防洪保护-城市</td>
    <td><input name="flcnct" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>防洪保护-集镇</td>
    <td><input name="flcncty" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>防洪保护-铁路</td>
    <td><input name="flcntwn" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>防洪保护-公路</td>
    <td><input name="flcnrd" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>防洪保护-重要管线通信设施</td>
    <td><input name="flcnicf" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>防洪保护-重要厂矿企业</td>
    <td><input name="flcnien" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>防洪保护-军事设施</td>
    <td><input name="flcnmf" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>防洪保护-其他重要设施</td>
    <td><input name="flcnoif" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>设计灌溉面积(近期)/万亩</td>
    <td><input name="redsirar" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>设计灌溉面积(远期)/万亩</td>
    <td><input name="frdsirar" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>近三年平均年灌溉引水量/万m³/年</td>
    <td><input name="rtyaawtdvir" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>目前有效灌溉面积/万亩</td>
    <td><input name="cueirar" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>近三年平均年灌溉收入/万元/年</td>
    <td><input name="rtyaiir" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>年供水量（近期）/万m³/年</td>
    <td><input name="reanwtsp" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>年供水量（远期）/万m³/年</td>
    <td><input name="franwtsp" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>近三年平均年供水量/万m³</td>
    <td><input name="rtyanwtspqn" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>近三年平均年供水收入/万元/年</td>
    <td><input name="rtyanwtspin" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>近三年平均年发电量/kWh</td>
    <td><input name="rtyaenot" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>近三年平均年发电量收入/万元/年</td>
    <td><input name="rtyaenotin" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>近三年平均年运输量/万t</td>
    <td><input name="rtyatr" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>近三年平均年运输收入/万元/年</td>
    <td><input name="rtyatrin" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>近三年水库其他年经营性收入/万元/年</td>
    <td><input name="rtyrsotin" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>管理单位性质</td>
    <td><input name="addpnt" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>近三年平均年运行维护经费/万元/年</td>
    <td><input name="rtyametex" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>财政补贴/万元/年</td>
    <td><input name="fs" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>自筹/万元/年</td>
    <td><input name="sr" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>管理单位在职职工人数/人</td>
    <td><input name="addpp" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>大专以上学历/人</td>
    <td><input name="abclp" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>工程师以上/人</td>
    <td><input name="abengp" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>纳入财政保障的职工人数/人</td>
    <td><input name="icfsp" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>备用电源是否配置</td>
    <td><input name="sps" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>管理范围是否划定</td>
    <td><input name="dsscc" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>管理范围是否确权</td>
    <td><input name="dtscc" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>保护范围是否划定</td>
    <td><input name="dsprsc" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>管养分离是否实行</td>
    <td><input name="spmnmn" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>历史最高水位/m</td>
    <td><input name="hhrz" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>历史最高水位发生日期</td>
    <td><input name="hhrzdt" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>历史最低水位/m</td>
    <td><input name="hlrz" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>历史最低水位发生日期</td>
    <td><input name="hlrzdt" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>历史最大入库流量/m³/s</td>
    <td><input name="hmxinq" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>历史最大入库流量发生日期</td>
    <td><input name="hmxinqdt" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>历史最大下泄流量/m³/s</td>
    <td><input name="hmxotq" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>历史最大下泄流量发生日期</td>
    <td><input name="hmxotqdt" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>水情测报方式</td>
    <td><input name="mswtmt" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>工程监测方式</td>
    <td><input name="msprmt" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>仪器埋设安装数量/支或个</td>
    <td><input name="ininqn" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>仪器完好率/%</td>
    <td><input name="sninrt" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>整编分析周期/月</td>
    <td><input name="rrancy" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>最近一次整编时间</td>
    <td><input name="lrrtm" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>主坝最大沉降量/mm</td>
    <td><input name="mdamxst" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>主坝最大渗漏量/L/S</td>
    <td><input name="mdamxlk" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>主坝水平位移量/mm</td>
    <td><input name="mdamhd" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>副坝最大渗漏量/L/S</td>
    <td><input name="axdammxlk" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>鉴定次数</td>
    <td><input name="idtm" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>最近一次安全鉴定时间</td>
    <td><input name="liddt" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>最近一次安全鉴定审定单位</td>
    <td><input name="lidaddp" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>最近一次安全鉴定结论</td>
    <td><input name="lidcn" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>水库管理单位申报意见</td>
    <td><input name="mdop" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>管理单位负责人（/法人代表）</td>
    <td><input name="mdhd" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>水库管理单位印章</td>
    <td><input name="mdsl" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>水库管理单位申报日期</td>
    <td><input name="rsmddcdt" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>主管部门审核意见</td>
    <td><input name="adadop" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>主管部门负责人（签章）</td>
    <td><input name="adhd" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>主管部门单位印章</td>
    <td><input name="adsl" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>主管部门审核日期</td>
    <td><input name="adaddt" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>负责注册登记的水行政主管部门审批意见</td>
    <td><input name="rgadadop" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>负责注册登记部门主管负责人（签章）</td>
    <td><input name="rgadhd" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>负责注册登记单位印章</td>
    <td><input name="rgadsl" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>负责注册登记部门审批日期</td>
    <td><input name="rgadaddt" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>注册登记号</td>
    <td><input name="rgnum" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>注册登记类型</td>
    <td><input name="rgtype" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>注册登记状态</td>
    <td><input name="rgst" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>发证日期</td>
    <td><input name="crdt" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>管理单位名称</td>
    <td><input name="mdnm" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>管理单位邮政编码</td>
    <td><input name="mdpc" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>管理单位负责人（/法人代表）</td>
    <td><input name="mdhd1" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>管理单位联系人</td>
    <td><input name="mdcn" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>管理单位通信地址</td>
    <td><input name="mdcad" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>管理单位固定电话</td>
    <td><input name="mdtell" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>管理单位移动电话</td>
    <td><input name="mdmb" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>管理单位传真</td>
    <td><input name="mdfax" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>管理单位Email</td>
    <td><input name="mdemail" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>主管部门名称</td>
    <td><input name="adnm" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>主管部门邮政编码</td>
    <td><input name="adpc" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>主管部门联系人</td>
    <td><input name="adcn" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>主管部门通信地址</td>
    <td><input name="adcad" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>主管部门固定电话</td>
    <td><input name="adtell" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>主管部门移动电话</td>
    <td><input name="admb" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>主管部门传真</td>
    <td><input name="adfax" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>主管部门Email</td>
    <td><input name="ademail" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>水库注册登记机构名称</td>
    <td><input name="rsrginnm" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>水库注册登记机构邮政编码</td>
    <td><input name="rsrginpc" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>水库注册登记机构联系人</td>
    <td><input name="rsrgincn" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>水库注册登记机构通信地址</td>
    <td><input name="rsrgincad" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>水库注册登记机构固定电话</td>
    <td><input name="rsrgintell" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>水库注册登记机构移动电话</td>
    <td><input name="rsrginmb" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>水库注册登记机构传真</td>
    <td><input name="rsrginfax" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>水库注册登记机构Email</td>
    <td><input name="rsrginemail" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>水库功能</td>
    <td><input name="rsfn" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>水情监测项目</td>
    <td><input name="mswtpr" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
<tr>
    <td>工程监测项目</td>
    <td><input name="msprpr" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
</tr>
                <tr>
                    <td>经度(°)</td>
                    <td><input id="reservoirInfoAddJd" name="lgtd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" ><a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="selMap('reservoirInfoAddJd','reservoirInfoAddWd');">查看地图</a></td>
                </tr>
                <tr>
                    <td>纬度(°)</td>
                    <td><input id="reservoirInfoAddWd" name="lttd" style="height: 29px;width:260px;" class="easyui-numberbox" data-options="min:0,precision:5" type="text" ></td>
                </tr>
                <tr>
				    <td>概况</td>
				    <td><input name="gs" style="height: 29px;width:260px;" class="easyui-textbox" type="text"></td>
				</tr>
            </table>
        </form>
    </div>
</div>