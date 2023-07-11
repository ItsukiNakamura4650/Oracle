<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<%@ page pageEncoding="UTF-8" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>



</head>
<body>
<div class="container mt-5" >
<h2 class="text-center"><a href="/MemoInfoOracle_10/memo_servlet/list.do">議事録情報一覧</a></h2>
<form>
<div class="col-sm-2">

	<input type="text" id="purpose" placeholder="会議の目的" class="form-control">
	<input type="text" id="location" placeholder="場所" class="form-control">
	<input type="text" id="writer" placeholder="作成者" class="form-control">
	<input type="text" id="attendee" placeholder="出席者" class="form-control">

</div>
<div class="col-sm-4 mb-4">

	<input type="text"  id ="memo" placeholder="議事録情報" class="form-control">
	<input type="text" id="conclusion" placeholder="決定事項" class="form-control">
	<input  type="button" id="execute" value="登録" class="btn btn-primary">
</div>
</form>
<script>
  // ボタン押下時の処理
  $('#execute').on('click',function(){
	  console.log("処理開始");
    $.ajax({
      url: "/MemoInfoOracle_10/memo_servlet/join.do",
      type: "POST",
      async: true,
      data: {purpose : $("#purpose").val(),
    	    location : $("#location").val(),
    	    writer : $("#writer").val(),
    	    attendee : $("#attendee").val(),
    	    memo : $("#memo").val(),
    	    conclusion : $("#conclusion").val(),
    	    }
    }).done(function (result) {
      // 通信成功時のコールバック

    }).fail(function () {
      // 通信失敗時のコールバック
      alert("読み込み失敗");
    }).always(function (result) {
      // 常に実行する処理
    });
  });


</script>
<form action="/MemoInfoOracle_1/memo_servlet/search.do" method="post">
<div class="col-sm-2">

	<select name="search" class="form-control">
		<option value="writerfilter">作成者</option>
		<option value="memofilter">議事録情報</option>
		<option value="searchfilter">作成者＋議事録情報</option>
	</select>
</div>
<div class="col-sm-4 mb-4">
	<input type="text" name="filter" class="form-control">
	<input type="submit" id="serch" value="検索" class="btn btn-success">
</div>
</form>
<script type="text/javascript">
// ボタン押下時の処理
$('#serch').on('click',function(){
	  console.log("処理開始");
  $.ajax({
    url: "/MemoInfoOracle_10/memo_servlet/serch.do",
    type: "POST",
    async: true,
    data: {purpose : $("#purpose").val(),
  	    location : $("#location").val(),
  	    writer : $("#writer").val(),
  	    attendee : $("#attendee").val(),
  	    memo : $("#memo").val(),
  	    conclusion : $("#conclusion").val(),
  	    }

</script>

<div><%@ include file="list.jsp" %></div>
</div>



</body>
</html>