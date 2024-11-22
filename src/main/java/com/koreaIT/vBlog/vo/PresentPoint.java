package com.koreaIT.vBlog.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PresentPoint {
	private int id;
	private int memberId;
	private String relTypeCode;
	private int point;
}