<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>

<%@ page pageEncoding="UTF-8" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function() {
	  $.ajax({
	    url: 'memo.xml',
	    type: 'POST',
	    dataType: 'XML',
	    cache: false,
	    success: function(data) {

	      // xmlデータからほしいデータをfindで探し処理
	      $(data).find("fruits item").each(function(index, item){

	        // id
	        var id = $(item).find('id').text();

	        // name
	        var name = $(item).find('name').text();

	        // color
	        var color = $(item).find('color').text();

	        // テーブルに追加
	        $('#result tbody').append('<tr><td>'+id+'</td><td>'+name+'</td><td>'+color+'</td></tr>');

	      });
	    },
	    error: function(err) {
	      console.log(err);
	    }
	  });
	});
</script>
</head>
<body>
<div class="container mt-5" >
<h2 class="text-center"><a href="/MemoInfoOracle_1/memo_servlet/list.do">議事録情報一覧</a></h2>
<div class="col-sm-2">

	<input type="text" name="purpose" placeholder="会議の目的" class="form-control">
	<input type="text" name="location" placeholder="場所" class="form-control">
	<input type="text" name="writer" placeholder="作成者" class="form-control">
	<input type="text" name="attendee" placeholder="出席者" class="form-control">


</div>
<div class="col-sm-4 mb-4">

	<input type="text"  placeholder="議事録情報" class="form-control">
	<input type="text"  placeholder="決定事項" class="form-control">
	<input  type="button" value="登録" class="btn btn-primary">
</div>
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
	<input type="submit" value="検索" class="btn btn-success">
</div>
</form>


<div><%@ include file="list.jsp" %></div>
</div>



</body>
</html>