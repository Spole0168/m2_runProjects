<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path ;
%>
<script>
$(function(){
	
});
function submit(){
	$('#myform').form('submit', {
        url : '<%=basePath%>/commonController/updateDatadictData.do',
        onSubmit : function() {
            
            if ($(this).form("validate")) {
                return true;
            } else {
                return false;
            }
        },
        success : function(data) {
        	var temp = $.parseJSON(data); 
        	if (temp.success) {
        		$.messager.alert('修改成功',temp.msg,'Info');
        	}
        	else{
        		$.messager.alert('修改失败',temp.msg,'Info');
        	}
        	$('#window').window('close');
        	$('#dg').datagrid('load');
        }
    });
}
function cancel() {
    $('#myform').form('clear');
    $('#window').window('close');
}	
</script>
<div>
    <form id="myform" method="post">
    <input type="hidden" value="${entity.id}" name="id" id="id"/>
        <table align="center">
            <tr>
                <td>
                <label>选择类别:</label>
                </td>
                <td>
                <input class="easyui-combobox" id = "catalog" name="catalog" 
		        data-options="required:true,
		            valueField:'code',
                    textField:'codename',
                    editable:false,
                    readonly:true,
		            url:'<%=basePath%>/commonController/listDatadictCata.do?catalog=root',
		            onLoadSuccess:function(){
		              $('#catalog').combobox('setValue','${entity.catalog}');
		            }
		        " />
                </td>
            </tr>
            <tr>
                <td>
                <label>代码:</label>
                </td>
                <td>
                <input class="easyui-validatebox" type="text" id="code" name="code" value="${entity.code}"
                    style="width: 290px;" data-options="required:true">
                </td>
            </tr>
            <tr>
                <td>
                <label>中文名称:</label>
                </td>
                <td>
                <input class="easyui-validatebox" type="text" id="codename" name="codename" value="${entity.codename}"
                    style="width: 290px;" data-options="required:true">
                </td>
            </tr>
        </table>
</form>
</div>
<div style="text-align:center;padding:5px">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submit()">提交</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="cancel()">取消</a>
</div>
