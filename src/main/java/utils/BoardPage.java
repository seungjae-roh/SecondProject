package utils;

public class BoardPage {
	
	public static String pagingStr(int totalCount, int pageSize, int blockPage,
	         int pageNum, String reqUrl, String b_flag) {
	      
		StringBuffer pagingStr = new StringBuffer();
      
		int totalPages = (int)Math.ceil((double)totalCount / pageSize);
      
      
		int pageTemp = (((pageNum - 1) / blockPage) * blockPage)+1;
      
		pagingStr.append("<ul class='pagination justify-content-center'>");

		if (pageTemp != 1) {
         
			pagingStr.append("<li class=\"page-item\">");
			pagingStr.append("<a class='page-link' href='" + reqUrl + "?b_flag=" + b_flag + "&pageNum=1'><i class='bi bi-skip-backward-fill'></i></a>");
			pagingStr.append("</li>");
           
			pagingStr.append("<li class=\"page-item\">");
			pagingStr.append("<a class='page-link' href='" 
                 + reqUrl + "?b_flag=" + b_flag +"&pageNum="+ (pageTemp - 1)+"'><i class='bi bi-skip-start-fill'></i></a>"); 
			pagingStr.append("</li>");
        }
		int blockCount = 1;
		while (blockCount <= blockPage && pageTemp <= totalPages) {
			if (pageTemp == pageNum) {
				pagingStr.append("<li class='page-item active'>");
				pagingStr.append("<a class='page-link' href='" + reqUrl + "&pageNum=" + pageTemp + "'>" + pageTemp + "</a>") ;
				pagingStr.append("</li>");
			} 	
			else {
				pagingStr.append("<li class='page-item'>");
				pagingStr.append("<a class='page-link' href='" + reqUrl+"?b_flag="+b_flag+ "&pageNum=" + pageTemp + "'>" + pageTemp + "</a>");
				pagingStr.append("<li class='page-item'>");
			}
			pageTemp++;
			blockCount++;
		}
	      // 다음 페이지는 블록 바로가기 링크 추가
	      // 마지막 페이지가 아닌 경우에만 다음 블럭을 출력한다.
	     if (pageTemp <= totalPages) {
	         
	         pagingStr.append("<li class=\"page-item\">");
	         pagingStr.append("<a class='page-link' href='" + reqUrl +"?b_flag="+b_flag 
	               + "&pageNum=" + pageTemp + "'><i class='bi bi-skip-end-fill'></i></a>");
	         pagingStr.append("</li>");
	         
	         pagingStr.append("<li class=\"page-item\">");
	         pagingStr.append("<a class='page-link' href='" + reqUrl +"?b_flag="+b_flag
	               + "&pageNum=" + totalPages + "'><i class='bi bi-skip-forward-fill'></i></a>");
	         pagingStr.append("</li>");
	     }
	     pagingStr.append("</ul>");
	      
	      
	return pagingStr.toString();
	
   }
}
