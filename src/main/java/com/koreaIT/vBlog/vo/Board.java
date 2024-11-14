package com.koreaIT.vBlog.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
// 어노테이션 Data (모든 필드를 대상으로 접근자와 설정자가 자동으로 생성되고, final 또는 @NonNull 필드 값을 파라미터로 받는 생성자가 만들어지며, toStirng, equals, hashCode 메소드가 자동 생성)

@AllArgsConstructor
// 어노테이션 AllArgsConstructor (생성자 생성)

@NoArgsConstructor
//어노테이션 NoArgsConstructor (파라미터가 없는 기본 생성자를 생성)

public class Board {
	// Board 클래스
	
	private int id;
	// private int 타입 변수 id
	
	private String regDate;
	private String updateDate;
	private String code;
	private String name;
}
