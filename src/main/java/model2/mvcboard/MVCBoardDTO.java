package model2.mvcboard;

public class MVCBoardDTO {

	//멤버변수
	private String idx;
	private String title;
	private String content;
	private String id;
	private java.sql.Date postdate;
	//Original File Name : 클라이언트가 업로드한 원본 파일명
	private String ofile;
	//Saved File Name : 파일명을 변경한 후 서버에 저장될 파일명
	private String sfile;
	//자료실이므로 파일을 다운로드한 횟수를 카운트 한다.
	private int downcount;
	private int visitcount;
	//좋아요 갯수 카운트
	private int favocount;
	private String b_flag;
	
	
	//게터 & 세터
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public java.sql.Date getPostdate() {
		return postdate;
	}
	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}
	public String getOfile() {
		return ofile;
	}
	public void setOfile(String ofile) {
		this.ofile = ofile;
	}
	public String getSfile() {
		return sfile;
	}
	public void setSfile(String sfile) {
		this.sfile = sfile;
	}
	public int getDowncount() {
		return downcount;
	}
	public void setDowncount(int downcount) {
		this.downcount = downcount;
	}
	public int getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(int visitcount) {
		this.visitcount = visitcount;
	}
	public int getFavocount() {
		return favocount;
	}
	public void setFavocount(int favocount) {
		this.favocount = favocount;
	}
	public String getB_flag() {
		return b_flag;
	}
	public void setB_flag(String b_flag) {
		this.b_flag = b_flag;
	}
	
	
	
}
