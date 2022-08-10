package com.dev.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class Board {
	private int boardType;
	private String title;
	private String boardContent;
	private String writer;
	private String writeDate;
	private int bno;
	private int prodId;
	private int isHandled;
	private String repsComment;
	private int CNT;
	
	@Override
	public String toString() {
		return "Board [boardType=" + boardType + ", title=" + title + ", boardContent=" + boardContent + ", writer="
				+ writer + ", writeDate=" + writeDate + ", bno=" + bno + ", prodId=" + prodId + ", isHandled="
				+ isHandled + ", repsComment=" + repsComment + ", CNT=" + CNT + "]";
	}
	
	
}
