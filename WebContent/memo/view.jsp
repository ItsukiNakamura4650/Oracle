<!DOCTYPE html>
<html>
<head>
<!-- 必須のmetaタグ -->
<%@ page pageEncoding="UTF-8" %>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- BootstrapのCSSファイル -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
        integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script >
	$(function(){
		// IDがbtnUpdateのタグがクリック(click)したときの以下の関数(function)を実行
		$("#btnUpdate").click(function() {
		// 確認 - true, 取り消し - false
			if(confirm("更新してもよろしいでしょうか?")){
				document.form2.action = "/MemoInfoOracle_10/memo_servlet/update.do";
				document.form2.submit();
			}
		});
	})

	$(function(){
		// IDがbtnDeleteのタグがクリック(click)したときの以下の関数(function)を実行
		$("#btnDelete").click(function() {
		// 確認 - true, 取り消し - false
			if(confirm("削除してもよろしいでしょうか?")){
				document.form2.action = "/MemoInfoOracle_10/memo_servlet/delete.do";
				document.form2.submit();
			}
		});
	})


</script>
</head>
<body>
<div class="container mt-5" >
<h2 class="text-center">議事録情報詳細</h2>
<form name="form2" method="post"  action="/MemoInfoOracle_1/memo_servlet/list.do">
<table class="table table-hover">
	<tr>
		<td>番号</td>
		<td><input type="number" name="IDX" value="${map.IDX }"
			class="form-control" readonly><small>${errIdx }</small>
		</td>
	</tr>
	<tr>
		<td>会議の目的</td>
		<td><input type="text" name="purpose" value="${map.PURPOSE }" class="form-control"></td>
	</tr>
	<tr>
		<td>場所</td>
		<td><input type="text" name="location" value="${map.LOCATION }" class="form-control"></td>
	</tr>
	<tr>
		<td>作成者</td>
		<td><input type="text" name="writer" value="${map.WRITER }" class="form-control"></td>
	</tr>
	<tr>
		<td>出席者</td>
		<td><input type="text" name="attendee" value="${map.ATTENDEE }" class="form-control"></td>
	</tr>
	<tr>
		<td>議事録情報</td>
		<td><input type="text" name="memo" value="${map.MEMO }" class="form-control"></td>
	</tr>
	<tr>
		<td>決定事項</td>
		<td><input class="form-control" type="text" name="conclusion" value="${map.CONCLUSION }"></td>
	</tr>

	<tr align="center">

		<td colspan="2">

			<input type="button" value="戻る" onclick="history.back()"  class="btn btn-link" >
			<input type="button" value="修正" id="btnUpdate" class="btn btn-warning">
			<input type="button" value="削除" id="btnDelete" class="btn btn-danger">
		</td>
	</tr>
</table>
</form>


<div>
</div>
</div>
</body>
</html>