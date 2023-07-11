
<!DOCTYPE html>
<html>
<head>
<%@ page pageEncoding="UTF-8" %>
<!-- 必須のmetaタグ -->
    <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- BootstrapのCSSファイル -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
        integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function detail(IDX){
		document.form1.IDX.value = IDX;
		document.form1.submit();
	}

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

	$(function(){
		// IDがbtnDeleteのタグがクリック(click)したときの以下の関数(function)を実行
		$("#btnsomeDelete").click(function() {
		// 確認 - true, 取り消し - false
			if(confirm("削除してもよろしいでしょうか?")){
				document.form2.action = "/MemoInfoOracle_10/memo_servlet/some.do";
				document.form2.submit();
			}
		});
	})

	  function AllChecked(){
		    var all = document.form2.all.checked;
		    for (var i=0; i<document.form2.one.length; i++){
		      document.form2.one[i].checked = all;
		    }
		  }

	 function　DisChecked(){
		    var checks = document.form2.one;
		    var checksCount = 0;
		    for (var i=0; i<checks.length; i++){
		      if(checks[i].checked == false){
		        document.form2.all.checked = false;
		      }else{
		        checksCount += 1;
		        if(checksCount == checks.length){
		          document.form2.all.checked = true;
		        }
		      }
		    }
		  }
</script>

</head>
<body>
		<form method="post" name="form2">
		<table class="table table-hover" id="list">
			<tr>
				<th><input type="checkbox" name="all" onClick="AllChecked()"></th>
				<th>番号</th>
				<th>会議の目的</th>
				<th>場所</th>
				<th>作成者</th>
				<th>日付</th>
				<th><input value="選択した議事録情報を削除" class="btn btn-dark" type="button" id="btnsomeDelete"></th>
			</tr >
			<c:forEach  var="row" items="${memoList}" >
			<tr id =>
				<td><input type="checkbox" name="one" value="${row.IDX}" onClick="DisChecked()"></td>
				<td><input type="hidden" name="IDX" value="${row.IDX }">${row.IDX }</td>
				<td><a href="#" onclick="detail('${row.IDX}')">${row.PURPOSE }<span class="d-inline-block text-truncate" style="max-width: 150px;"></span></a></td>
				<td>${row.LOCATION }</td>
				<td>${row.WRITER }</td>
				<td>${row.POST_DATE }</td>
				<td><input type="button" value="削除" id="btnDelete" class="btn btn-danger"></td>
			</tr>
			</c:forEach>
		</table>
		</form>
<form name="form1" method="post" action="/MemoInfoOracle_10/memo_servlet/detail.do">
	<input type="hidden" name="IDX">
</form>
</body>

</html>