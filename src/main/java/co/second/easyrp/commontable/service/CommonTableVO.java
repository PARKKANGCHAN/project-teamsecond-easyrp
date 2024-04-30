package co.second.easyrp.commontable.service;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//(2024년 4월 30일 오후 2시 56분 추가 박현우)
// 공통 테이블 구현을 위한 임시 VO Class
@Getter
@Setter
@ToString
public class CommonTableVO {
	private String postId;
	private String title;
	private String content;
	private String author;
}
