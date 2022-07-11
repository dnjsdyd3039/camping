package com.camily.dto;

import lombok.Data;

@Data		
public class CampingReviewDto {
	private String cgrvcode;		// 캠핑장 리뷰 코드 (PK)
	private String cgrvmid;			// 캠핑장 리뷰 작성자 (FK)
	private String cgrvcacode;		// 리뷰 쓸 캠핑장 코드 (FK)
	private String cgrvcontents;	// 캠핑장 리뷰 내용 (NOT NULL)
	private int cgrvlike;			// 캠핑장 좋아요(0: 없음, 1: 좋아요)
	public String getCgrvcode() {
		return cgrvcode;
	}
	public void setCgrvcode(String cgrvcode) {
		this.cgrvcode = cgrvcode;
	}
	public String getCgrvmid() {
		return cgrvmid;
	}
	public void setCgrvmid(String cgrvmid) {
		this.cgrvmid = cgrvmid;
	}
	public String getCgrvcacode() {
		return cgrvcacode;
	}
	public void setCgrvcacode(String cgrvcacode) {
		this.cgrvcacode = cgrvcacode;
	}
	public String getCgrvcontents() {
		return cgrvcontents;
	}
	public void setCgrvcontents(String cgrvcontents) {
		this.cgrvcontents = cgrvcontents;
	}
	public int getCgrvlike() {
		return cgrvlike;
	}
	public void setCgrvlike(int cgrvlike) {
		this.cgrvlike = cgrvlike;
	}
	
	
	
}
