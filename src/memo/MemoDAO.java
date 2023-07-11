package memo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import sqlmap.MybatisManager;

public class MemoDAO {






	public  List<Map<String, Object>> list(){
		SqlSession sqlSession  =MybatisManager.getInstance().openSession();
		List<Map<String, Object>> item=sqlSession.selectList("memo.select");
		return item;
}

//	一件登録
	public void insert(Map<String, Object> map) {
		SqlSession sqlSession  =MybatisManager.getInstance().openSession();
		sqlSession.insert("memo.insert", map);
	}

	public List<Map<String, Object>> writerfilter(String filter){
//		selectList()メソッドの第1引数にはnamespace.idを、第二引数にはmapperに渡す変数を指定する
		System.out.println(filter);
		SqlSession sqlSession  =MybatisManager.getInstance().openSession();
		List<Map<String, Object>> item = sqlSession.selectList("memo.writerfilter","%" + filter + "%");
		return item;
	}

	public List<Map<String, Object>> memofilter(String filter){
//		selectList()メソッドの第1引数にはnamespace.idを、第二引数にはmapperに渡す変数を指定する
		SqlSession sqlSession  =MybatisManager.getInstance().openSession();
		List<Map<String, Object>> item = sqlSession.selectList("memo.memofilter", "%" + filter + "%");
		return item;
	}

	public List<Map<String, Object>> filter(String filter){
//		selectList()メソッドの第1引数にはnamespace.idを、第二引数にはmapperに渡す変数を指定する
		SqlSession sqlSession  =MybatisManager.getInstance().openSession();
		List<Map<String, Object>> item = sqlSession.selectList("memo.filter", "%" + filter + "%");
		return item;
	}

//	詳細取得
	public Map<String, Object> detail(String idx) {
		SqlSession sqlSession  =MybatisManager.getInstance().openSession();
		Map<String, Object> item = sqlSession.selectOne("memo.detail",idx);
		return item;
	}
//
//	1件更新
	public void update(Map<String, Object> map) {
		SqlSession sqlSession  =MybatisManager.getInstance().openSession();
		sqlSession.update("memo.update", map);
		sqlSession.commit();
	}

//	一件削除
	public void delete(String idx) {
		SqlSession sqlSession  =MybatisManager.getInstance().openSession();
		sqlSession.delete("memo.delete", idx);
		sqlSession.commit();
	}



}

