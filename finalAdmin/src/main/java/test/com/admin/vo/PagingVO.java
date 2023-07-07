package test.com.admin.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PagingVO {
	
	private int page;
	private int size;
	private int totalCount;
	
	private int start;
	private int end;
	
	private int startPage;
	private int endPage;
	private int totalPage;
	
	public PagingVO(int page,int size, int totalCount) {
		this.size=size;
		this.totalCount=totalCount; // 총 데이터 갯수
		
		// 페이지 갯수
		totalPage = (totalCount - 1)/size+1;
		
		// 페이지가 잘못 넘어왔을때
		page = (page<1)?1:page;
		page = (page>totalPage)? totalPage:page;
		
		this.page = page;
		
		// 1페이지면 start = 1 즉, 데이터 첫번째부터
		start = (this.page-1)*size+1;
		// 1페이지일때 start = 1이니 마지막은 10 즉, 1~10데이터
		end = start + (size-1);
		
		// totalCount 이하의 값이어야 한다.
		this.end = this.end>totalCount? totalCount:this.end;
		
		// page가 11~20일때 startpage는 모두 11 즉, 1~10 = 1 / 11~20 = 11
		startPage=(this.page-1)/10*10+1;
		
		// startpage가 11일때 + 9 해서 20
		endPage = startPage + 9;
		
		// totalPage 이하의 값이어야 한다.
		this.endPage = this.endPage>totalPage? totalPage:this.endPage;
		
		
	}

}
