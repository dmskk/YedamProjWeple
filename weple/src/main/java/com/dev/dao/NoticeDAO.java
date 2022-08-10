package com.dev.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dev.common.DAO;
import com.dev.vo.Board;

public class NoticeDAO extends DAO {
	
	// 필요한 기능
	
	// 공지사항 게시판 전체 select해오는 기능
	public List<Board> showAllNotice() {
		List<Board> boardList = new ArrayList<>();
		try {
			connect();
			String sql = "select board_type, title, board_content, writer, write_date, bno, cnt from boards where board_type = 1 order by write_date desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setBoardType(rs.getInt("board_type"));
				board.setTitle(rs.getString("title"));
				board.setBoardContent(rs.getString("board_content"));
				board.setWriter(rs.getString("writer"));
				board.setWriteDate(rs.getString("write_date"));
				board.setBno(rs.getInt("bno"));
				board.setCNT(rs.getInt("cnt"));
				
				boardList.add(board);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return boardList;
	}
	
	// 글 클릭했을때 각 컨텐츠 보여주는 기능
	public Board showOneNotice(int bno) {
		Board board = new Board();
		try {
			connect();
			String sql = "select title, board_content, writer, write_date, bno, cnt from boards where bno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				board.setTitle(rs.getString("title"));
				board.setBoardContent(rs.getString("board_content"));
				board.setWriter(rs.getString("writer"));
				board.setWriteDate(rs.getString("write_date"));
				board.setBno(rs.getInt("bno"));
				board.setCNT(rs.getInt("cnt"));
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return board;
	}
	
	// 글 클릭했을 때 조회수 업로드 하는 기능
	public void updateCNT(int bno, int cnt) {
		try {
			connect();
			String sql = "update boards set CNT = ? where bno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cnt+1);
			pstmt.setInt(2, bno);
			int r = pstmt.executeUpdate();
			if (r > 0) {
				System.out.println("cnt 1올라감");
			} else {
				System.out.println("cnt업로드 실패");
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
}
