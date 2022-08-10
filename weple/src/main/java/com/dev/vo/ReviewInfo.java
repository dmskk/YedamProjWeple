package com.dev.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewInfo {
	
	private int bno;
	private int prodId;
	private String prodName;
	private String boardContent;
	private String writer;
	private String writeDate;
	private int cnt;
	private int rating;
	
}
