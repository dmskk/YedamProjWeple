package com.dev.service.notice;

import java.util.List;

import com.dev.dao.NoticeDAO;
import com.dev.vo.Board;

public class NoticeService {
	// 싱글톤
	private static NoticeService noticeService = null;
	NoticeDAO nDAO = new NoticeDAO();
	
	private NoticeService() {
		
	}
	
	public static NoticeService getInstance() {
		if(noticeService == null) {
			noticeService = new NoticeService();
		}
		return noticeService;
	}
	
	// 공지사항 게시판 전체 select해오는 기능
	public List<Board> showAllNotice() {
		return nDAO.showAllNotice();
	}
	
	// 글 클릭했을때 각 컨텐츠 보여주는 기능
	public Board showOneNotice(int bno) {
		return nDAO.showOneNotice(bno);
	}
	
	// 글 클릭했을 때 조회수 업로드 하는 기능
	public void updateCNT(int bno, int cnt) {
		nDAO.updateCNT(bno, cnt);
	}
	
}
