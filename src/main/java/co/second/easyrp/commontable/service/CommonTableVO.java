package co.second.easyrp.commontable.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommonTableVO {
	private String postId;
	private String title;
	private String content;
	private String author;
	private Date createdAt;
	private String deleteyn;
	private String modalInput;
	private int offset; // 페이지네이션 기능 구현 멤버 변수 (어디서 부터 보여줄 지)
	private int pageSize; // 페이지네이션 기능 구현 멤버 변수 (보여줄 총 개수)
	private String searchNumber;
	private String searchTitle;
	private String searchContent;
	private String searchAuthor;
	private Date preSearchDate;
	private Date postSearchDate;
}
