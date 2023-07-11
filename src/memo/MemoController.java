package memo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/memo_servlet/*")
public class MemoController extends HttpServlet{
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
					throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)
					throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		System.out.println("doPost()メソッド入場");


		String url = request.getRequestURI();		//リクエストアドレス
		System.out.println("URL: " + url);
		String context = request.getContextPath();	//プロジェクト名
		System.out.println("Context: " + context);

		String idx = request.getParameter("IDX");
		String writer = request.getParameter("writer");
		String purpose = request.getParameter("purpose");
		String location = request.getParameter("location");
		String attendee = request.getParameter("attendee");
		String memo = request.getParameter("memo");
		String conclusion = request.getParameter("conclusion");
		String post_date = request.getParameter("post_date");

		String search = request.getParameter("search");
		String filter = request.getParameter("filter");



		try {
			MemoDAO memoDao = new MemoDAO();
			Map<String, Object> map = new HashMap<>();

			List<Map<String, Object>> maps=new ArrayList<Map<String,Object>>();
					//			urlにlist.doという文字列がなければ-1をリターンするindexOf()メソッド


//			urlにlist.doという文字列がなければ-1をリターンするindexOf()メソッド

//			会員情報全件取得
//			インデックスが31を返すので、-1ではない(list.doという文字列はurlの31番目にある)
			if(url.indexOf("list.do") != -1) {
				System.out.println("list.do処理開始");
//				DAOの全検索メソッドを使い、議事録情報をサーブレットに持ってくる
				maps = memoDao.list();


//				リストをリクエストスコープに格納してjspに送る準備をする

				request.setAttribute("memoList", maps);

//				ページ移動
				String page = "/memo/memo.jsp";
				goToPage(request, response, page);
				System.out.println("list.do処理終了");


			}else if (url.indexOf("join.do") != -1) {
				System.out.println("join.do処理開始");
//				エラーチェック(データ入力に異常があればfalse、異常がなければtrueを返してくる)
//				boolean bRet = dataValidation(request,response,writer,purpose,location,attendee,memo,conclusion,post_date);
//				if(bRet == false) return;

//				mapに画面から取得したパラメータをセットする
				map.put("writer", writer);
				map.put("purpose", purpose);
				map.put("location", location);
				map.put("attendee", attendee);
				map.put("memo", memo);
				map.put("conclusion", conclusion);
				map.put("post_date", post_date);

//				レコードの追加
				memoDao.insert(map);

//				リクエストを送らずにページ移動
				response.sendRedirect(context + "/memo_servlet/list.do");
				System.out.println("join.do処理終了");
			}else if (url.indexOf("detail.do") != -1) {
				System.out.println("detail.do処理開始");
				System.out.println("詳細画面で表示するユーザーのID: " + idx);

//				画面から受け取ったIDをもとに詳細画面を表示するユーザーの詳細情報をDBからもってくる
				map = memoDao.detail(idx);

				request.setAttribute("map", map);
				String page = "/memo/view.jsp";
				goToPage(request, response, page);
				System.out.println("detail.do処理終了");

			}else if (url.indexOf("update.do")!= -1) {
				System.out.println("update.do処理開始");
//				エラーチェック(データ入力に異常があればfalse、異常がなければtrueを返してくる)
//				boolean bRet = dataValidation(request,response,writer,purpose,location,attendee,memo,conclusion,post_date);
//				if(bRet == false) return;

				System.out.println(writer);

//				mapに画面から取得したパラメータをセットする
				map.put("writer", writer);
				map.put("purpose", purpose);
				map.put("location", location);
				map.put("attendee", attendee);
				map.put("memo", memo);
				map.put("conclusion", conclusion);
				map.put("post_date", post_date);
				map.put("idx", idx);

				System.out.println(map.get("writer"));
		        System.out.println(map.get("purpose"));
		        System.out.println(map.get("location"));
		        System.out.println(map.get("attendee"));
		        System.out.println(map.get("memo"));
		        System.out.println(map.get("conclusion"));
		        System.out.println(map.get("idx"));

				memoDao.update(map);

				response.sendRedirect(context + "/memo_servlet/list.do");
				System.out.println("update.do処理終了");

			}else if (url.indexOf("delete.do")!= -1) {
				System.out.println("delete.do処理開始");

				System.out.println("削除するユーザーのID: " + idx);
				memoDao.delete(idx);

				response.sendRedirect(context + "/memo_servlet/list.do");
				System.out.println("delete.do処理終了");
			}else if (url.indexOf("search.do")!= -1) {
				System.out.println("search.do処理開始");
				System.out.println(filter);
				if(search.equals("writerfilter")) {
					System.out.println("search.do1処理開始");
					maps = memoDao.writerfilter(filter);
				}else if(search.equals("memofilter")) {
					System.out.println("search.do2処理開始");
					maps = memoDao.memofilter(filter);
				}else if(search.equals("searchfilter")) {
					System.out.println("search.do3処理開始");
					maps = memoDao.filter(filter);
				}

				request.setAttribute("memoList", maps);

				String page = "/memo/memo.jsp";
				goToPage(request, response, page);
				System.out.println("search.do処理終了");
			}
		}catch(Exception e) {
			e.printStackTrace();
//			画面に表示するエラー
			request.setAttribute("message", "内部エラーが発生しました。");
			goToPage(request, response, "/common/errInternal.jsp");
			return;
		}
	}

//	ページ移動メソッド
	private void goToPage(HttpServletRequest request,
			HttpServletResponse response, String page)
					throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher(page);
		rd.forward(request, response);
	}


}

