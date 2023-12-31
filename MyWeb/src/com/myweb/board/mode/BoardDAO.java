package com.myweb.board.mode;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.myweb.util.Criteria;
import com.myweb.util.JdbcUtil;

public class BoardDAO {
	
	//디자인 패턴 : Singleton 패턴
	
	//1. 스스로 객체를 멤버 변수로 선언, 객체 생성을 1개로 제한
	private static BoardDAO instance = new BoardDAO();
	
	//2. 외부에서 객체를 생성 할 수 없게 private 처리	
	private DataSource ds;
	
	private BoardDAO() {
		//3. 커넥션 풀에서 DB 연결 객체 정보를 불러움
		try {
			InitialContext ctx = new InitialContext(); //Context.xml값에 저장된 내용을 불러와서 사용하기 위해 생성한 객체
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
		} catch (Exception e) {
			System.out.println("커넥션 풀링 에러 발생");
		}
	}

	//4. 외부에서 객체를 요구할 때 getter 메서드를 통해서 반환
	public static BoardDAO getInstance() {
		return instance;
	}

	public DataSource getDs() {
		return ds;
	}
	
	//5. 중복되는 코드를 멤버 변수로 선언
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// ------------ DAO 동작 메서드 구현 ------------
	
	//글 등록
	public void regist(String writer, String title, String content) {
		String sql = "insert into board(writer, title, content) "
				+ "values(?, ?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}
	
	//게시글 목록 조회
	/*
	 * public List<BoardVO> getList() { List<BoardVO> list = new ArrayList<>();
	 * 
	 * String sql = "select * from board order by num desc";
	 * 
	 * try { conn = ds.getConnection(); pstmt = conn.prepareStatement(sql); rs =
	 * pstmt.executeQuery();
	 * 
	 * //BoardVO에 레코드 정보를 저장하고 List에 저장 //rs에는 query의 결과가 있음 while(rs.next()) {
	 * BoardVO vo = new BoardVO(); vo.setNum(rs.getInt("num"));
	 * vo.setWriter(rs.getString("writer")); vo.setTitle(rs.getString("title"));
	 * vo.setContent(rs.getString("content"));
	 * vo.setRegdate(rs.getTimestamp("regdate")); vo.setHit(rs.getInt("hit"));
	 * 
	 * list.add(vo); }
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } finally { JdbcUtil.close(conn,
	 * pstmt, rs); }
	 * 
	 * return list; }
	 */
	
	//페이징 처리 게시글 목록 조회
	public List<BoardVO> getList(Criteria cri) {
		List<BoardVO> list = new ArrayList<>();
		
		String sql = "select * from board order by num desc limit ?, ?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cri.getPageStart()); //시작번호
			pstmt.setInt(2, cri.getCount()); //페이지 당 게시글 개수
			rs = pstmt.executeQuery();
			
			//BoardVO에 레코드 정보를 저장하고 List에 저장
			//rs에는 query의 결과가 있음
			while(rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setNum(rs.getInt("num"));
				vo.setWriter(rs.getString("writer"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setRegdate(rs.getTimestamp("regdate"));
				vo.setHit(rs.getInt("hit"));
				
				list.add(vo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return list;
	}
	
	//총 게시글 수를 반환하는 메서드
	public int getTotal() {
		int result = 0;
		
		String sql = "select count(*) total from board";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("total");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return result;
	}
	
	
	//게시글 내용 가져오기
	public BoardVO getContent(String num) {
		BoardVO vo = null;
		
		String sql = "select * from board where num=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int num1 = rs.getInt("num");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				int hit = rs.getInt("hit");
				
				vo = new BoardVO(num1, writer, title, content, regdate, hit);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return vo;
	}
	
	//게시글 수정
	public void update(String num, String title, String content) {
		String sql = "update board set title=?, content=? where num=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}
	
	//게시글 삭제
	public void delete(String num) {
		String sql = "delete from board where num=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}
	
	
	//조회수 업데이트
	public void upHit(String num) {
		String sql = "update board set hit=hit+1 where num=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
	}
	
	//이미지 파일 업로드
	public void imgUp(File image) {
		String sql = "insert into images(image) vlues(?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setObject(1, image);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}
	

}
