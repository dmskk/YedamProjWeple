package com.dev.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.converters.SqlDateConverter;

import com.dev.common.DAO;
import com.dev.vo.Board;
import com.dev.vo.Criteria;
import com.dev.vo.ProdReview;
import com.dev.vo.ReviewInfo;

public class BoardDAO extends DAO {

	public void addReivew(ReviewInfo rvo) {
		String sql = "INSERT into boards(bno, writer, board_content, prod_id, write_date, board_type, cnt) values(board_num_seq.nextval,?,?,?,sysdate, 3, ?)";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rvo.getWriter());
			pstmt.setString(2, rvo.getBoardContent());
			pstmt.setInt(3, rvo.getProdId());
			pstmt.setInt(4, rvo.getRating());

			int r = pstmt.executeUpdate();
			System.out.println(r + "건 입력");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}

	}

	// 상세페이지 아래 prod_id가 같은 제품의 모든 리뷰
	public List<ReviewInfo> getList(int prodId) {
		List<ReviewInfo> list = new ArrayList<>();
		String sql = "SELECT * FROM v_bo_plus_nm WHERE board_type=3 and prod_id=" + prodId
				+ " order by write_date desc";

		try {
			connect();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewInfo rvo = new ReviewInfo();
				rvo.setBno(rs.getInt("bno"));
				rvo.setProdId(rs.getInt("prod_id"));
				rvo.setProdName(rs.getString("prod_name"));
				rvo.setWriter(rs.getString("writer"));
				rvo.setBoardContent(rs.getString("board_content"));
				rvo.setWriteDate(rs.getString("write_date"));
				rvo.setCnt(rs.getInt("cnt"));

				list.add(rvo);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

	/*public void updateReview(Board vo) {
		String sql = "UPDATE boards SET title=?, board_content =? WHERE bno=?";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getBoardContent());
			pstmt.setInt(3, vo.getBno());

			int r = pstmt.executeUpdate();
			System.out.println(r + "건 수정");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}*/

	// 내가 쓴 리뷰만 골라서 보는 리스트
	public List<ReviewInfo> myReivewList(String writer) {

		List<ReviewInfo> list = new ArrayList<>();

		String sql = "SELECT * FROM v_bo_plus_nm WHERE board_type=3 and writer= '" + writer + "' order by write_date desc";

		try {
			connect();
			pstmt = conn.prepareStatement(sql);
			// pstmt.setString(1, rvo.getWriter());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				ReviewInfo rvo = new ReviewInfo();
				
				rvo.setBno(rs.getInt("bno"));
				rvo.setProdId(rs.getInt("prod_id"));
				rvo.setProdName(rs.getString("prod_name"));
				rvo.setBoardContent(rs.getString("board_content"));
				rvo.setWriteDate(rs.getString("write_date"));
				rvo.setWriter(rs.getString("writer"));

				list.add(rvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

	public boolean deleteReview(ReviewInfo rvo) {
		String sql = "DELETE boards WHERE bno =?";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rvo.getBno());

			int r = pstmt.executeUpdate();
			if (r > 0) {
				System.out.println(r + "건 삭제");
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return false;
	}

	/*public List<Board> myContent() {

		List<Board> list = new ArrayList<>();
		Board vo = new Board();

		String sql = "SELECT * FROM boards WHERE board_type=3 AND bno=?";

		try {
			connect();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getBno());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				vo.setBno(rs.getInt("bno"));
				vo.setTitle(rs.getString("title"));
				vo.setBoardContent(rs.getString("board_content"));

				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	*/
	
	public void countStar(ReviewInfo rvo) {

		String sql = "UPDATE boards SET cnt=? WHERE bno=?";
		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rvo.getRating());
			pstmt.setInt(2, rvo.getBno());

			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}

	// 상품 평점 별채우기 (prod_id를 어디서 받아올 수 있을까요?)
	public double contentCount(int prodId) {

		double star = 0.0;

		String sql = "select sum(cnt)/ count(*) " + "from boards " + "where prod_id= " + prodId + " group by prod_id";

		connect();
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				star = rs.getDouble(1);
				System.out.print("star : " + String.format("%.2f",star));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return star;
		
	}

	public List<ReviewInfo> reviewInfo() {

		List<ReviewInfo> list = new ArrayList<>();
		
		ReviewInfo rvo = new ReviewInfo();

		String sql = "SELECT * from v_bo_plus_nm WHERE writer=? and prod_id=?";

		try {	
			connect();			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rvo.getWriter());
			pstmt.setInt(2, rvo.getProdId());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				rvo.setProdId(rs.getInt("prodId"));
				rvo.setProdName(rs.getString("prod_name"));
				rvo.setBoardContent(rs.getString("board_content"));
				rvo.setWriter(rs.getString("writer"));
				rvo.setWriteDate(rs.getString("write_date"));

				list.add(rvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<ReviewInfo> getListPaging(Criteria cri, int prodId) {

		List<ReviewInfo> AllListPage = new ArrayList<>();

		connect();

		try {
			
			String sql = "select  board_type, prod_id, prod_name, writer, write_date, board_content, bno, cnt "
					+ "from(select rownum rn, board_type, prod_id, prod_name, writer, write_date, board_content, bno, cnt "
					+ "from(select  board_type, prod_id, prod_name, writer, write_date, board_content, bno, cnt from v_bo_plus_nm where board_type=3 order by write_date desc ) "
					+ "where rownum <=?) " + "where rn>=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cri.getAmount() * cri.getPageNum()); // 10 * 1;
			pstmt.setInt(2, cri.getAmount() * (cri.getPageNum() - 1)); // 10

			rs = pstmt.executeQuery();
			System.out.println(cri.getAmount() * cri.getPageNum());
			System.out.println(cri.getAmount() * (cri.getPageNum() - 1));
			while (rs.next()) {
				ReviewInfo rvo = new ReviewInfo();
				
				rvo.setBno(rs.getInt("bno"));
				rvo.setProdId(rs.getInt("prod_id"));
				rvo.setWriter(rs.getString("writer"));
				rvo.setWriteDate(rs.getString("write_date"));
				rvo.setBoardContent(rs.getString("board_content"));
				

				AllListPage.add(rvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return AllListPage;
	}

	public List<ReviewInfo> getMyListPaging(Criteria cri, String writer) {
		List<ReviewInfo> listPage = new ArrayList<>();

		connect();

		try {
				String sql = "select  board_type, prod_id, prod_name, writer, write_date, board_content, bno, cnt " +
							 " from(select rownum rn, board_type, prod_id, prod_name, writer, write_date, board_content, bno, cnt " +
		                     " from(select  board_type, prod_id, prod_name, writer, write_date, board_content, bno, cnt from v_bo_plus_nm where writer ='" + writer + "' and board_type=3 order by write_date desc ) "
		                   + " where rownum <=?) where rn>=?";
			
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cri.getAmount() * cri.getPageNum()); // 10 * 1;
			pstmt.setInt(2, cri.getAmount() * (cri.getPageNum() - 1)); // 10

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				ReviewInfo rvo = new ReviewInfo();
				
				rvo.setBno(rs.getInt("bno"));
				rvo.setProdId(rs.getInt("prod_id"));
				rvo.setWriter(rs.getString("writer"));
				rvo.setProdName(rs.getString("prod_name"));
				rvo.setWriteDate(rs.getString("write_date"));
				rvo.setBoardContent(rs.getString("board_content"));
				rvo.setCnt(rs.getInt("cnt"));

				listPage.add(rvo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return listPage;
		
	}
	

	/*
	 * 실시간 리뷰
	 * 별점이 높으면서 최신순으로
	 */
	public List<ProdReview> realTimeReviewList() {
		List<ProdReview> list = new ArrayList<>();
		
		try {
			connect();
			String sql = "select b.board_content, b.writer, b.write_date, b.bno, b.prod_id, b.cnt, p.img_url, p.prod_name, p.prod_price "
					+ "from boards b, products p where b.board_type = 3 and b.prod_id = p.prod_id "
					+ "order by cnt desc, write_date desc";
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				ProdReview pr = new ProdReview();
				pr.setBno(rs.getInt("bno"));
				pr.setBoardContent(rs.getString("board_content"));
				pr.setCnt(rs.getInt("cnt"));
				pr.setImgUrl(rs.getString("img_url"));
				pr.setProdId(rs.getInt("prod_id"));
				pr.setProdName(rs.getString("prod_name"));
				pr.setProdPrice(rs.getInt("prod_price"));
				pr.setWriteDate(rs.getString("write_date"));
				pr.setWriter(rs.getString("writer"));
				list.add(pr);
			}
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return list;
	}
	
	
}
