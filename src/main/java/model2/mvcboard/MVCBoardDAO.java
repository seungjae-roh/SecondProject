package model2.mvcboard;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import model1.board.BoardDTO;


public class MVCBoardDAO extends DBConnPool{

	public MVCBoardDAO() {
		super();
	}
	
	//게시물의 갯수를 카운트한다.
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		String query = "SELECT COUNT(*) FROM mvcboard WHERE b_flag= '" 
				+ map.get("b_flag") + "'";
		if (map.get("searchWord") != null) {
			query += " AND " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'";
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch (Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	
	//조건에 맞는 게시물을 목록에 출력하기 위한 쿼리문
	public List<MVCBoardDTO> selectListPage(Map<String, Object> map) {
		
		List<MVCBoardDTO> board = new Vector<MVCBoardDTO>();
		
		String query = " SELECT * FROM mvcboard WHERE b_flag='" + map.get("b_flag")+ "'";

	      if (map.get("searchWord") != null) {
	         query += " AND " + map.get("searchField") 
	              + " LIKE '%" + map.get("searchWord") + "%' ";
	      }
	      query += "ORDER BY idx DESC LIMIT ?, ?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			//결과값 반환
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				MVCBoardDTO dto = new MVCBoardDTO();
				
				dto.setIdx(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setVisitcount(rs.getInt(9));
				dto.setFavocount(rs.getInt(10));
				dto.setB_flag(rs.getString(11));
				
				board.add(dto);
			}
		}
		catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return board;
	}
	
	 //파일첨부형 글쓰기 메소드
	public int insertWrite(MVCBoardDTO dto) {
		int result = 0;
		
		try {
			String query = "INSERT INTO mvcboard ( "
					+ " id, title, content, ofile, sfile, b_flag) "
					+ " VALUES (?,?,?,?,?,?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getB_flag());

			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	//내용보기를 위해 일련번호를 인수로 받아 게시물 하나를 인출한다.
	public MVCBoardDTO selectView(String idx) {

		MVCBoardDTO dto = new MVCBoardDTO();
		String query = "SELECT * FROM mvcboard WHERE idx=?";
					
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			//하나의 게시물이므로 if문을 통해 next()함수를 실행한다.
			if (rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setVisitcount(rs.getInt(9));
				dto.setFavocount(rs.getInt(10));
				dto.setB_flag(rs.getString(11));
			}
		}
		catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	
	//게시물의 조회수를 1증가시킨다.
	public void updateVisitCount(String idx) {
		
		String query = "UPDATE mvcboard SET "
					+ " visitcount=visitcount+1 "
					+ " WHERE idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeQuery();
		}
		catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	//첨부파일을 다운받은 횟수
	//조회수 증가 메소드와 동일한 로직
	public void downCountPlus(String idx) {
		String sql = "UPDATE mvcboard SET "
				+ " downcount=downcount+1 "
				+ " WHERE idx=? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			psmt.executeUpdate();
		}
		catch (Exception e) {}
	}
	
	//좋아요 갯수 카운트
	public void favoCountPlus(String idx) {
		String sql = "UPDATE mvcboard SET "
				+ " favocount=downcount+1"
				+ " WHERE idx=? ";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			psmt.executeUpdate();
		}
		catch (Exception e) {}
	}
	
	//게시글 삭제
	public int deletePost(MVCBoardDTO dto) {
		int result = 0;
		try {
			String query = " DELETE FROM mvcboard WHERE idx=? ";
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getIdx());
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	//게시글 데이터를 받아 DB에 저장되어 있던 내용을 갱신합니다.
	public int editPost(MVCBoardDTO dto) {
		int result = 0;
		
		try {
			String query = "UPDATE mvcboard "
						+ " SET title=?, content=?, ofile=?, sfile=? "
						+ " WHERE idx=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getOfile());
			psmt.setString(4, dto.getSfile());
			psmt.setString(5, dto.getIdx());
			
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		
		System.out.println("중복된 아이디가 없습니다.");
		return result;
	}
	
}
