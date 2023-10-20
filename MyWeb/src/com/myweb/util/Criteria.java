package com.myweb.util;

public class Criteria {
	//select * from board order by num desc limit ?(시작위치), ?(개수);
	
	private int pageNum; //페이지 번호
	private int count; //페이지 당 게시물 수
	
	public Criteria() {
		//최초 게시판에 진입할 때 기본 값 1번 페이지, 10개를 데이터로 셋팅 = 초기 값
		this.pageNum = 1;
		this.count = 10;
	}

	public Criteria(int pageNum, int count) {
		//매개 변수를 전달 받아 페이지 출력 값을 계산 처리하게 함
		//limit ?(시작위치), ?(개수); 여기에 들어갈 값을 얻기 위함
		this.pageNum = pageNum;
		this.count = count;
	}
	
	public int getPageStart() { //limit ?(pageNum), ?(count)
		return (pageNum - 1) * count; //인덱스 값이므로 1을 빼야 함
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	
}
