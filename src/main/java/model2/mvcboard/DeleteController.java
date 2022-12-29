package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/mvcboard/delete.do")
public class DeleteController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		//hidden박스에서 전송된 파라미터 받기
		String idx = req.getParameter("idx");
		
		//DAO객체 생성 및 패스워드 검증
		MVCBoardDAO dao = new MVCBoardDAO();
		
		//기존 게시물의 내용을 읽어온다.
		MVCBoardDTO dto = dao.selectView(idx);
		//게시물을 삭제한다.
		int result = dao.deletePost(dto);
		dao.close();
		//게시물 삭제에 성공했다면..
		if (result == 1) {
			//파일도 함께 삭제한다.
			String saveFileName = dto.getSfile();
			FileUtil.deleteFile(req, "/Uploads", saveFileName);
		}
		//삭제가 완료되었다면 리스트로 이동한다.
		JSFunction.alertLocation(resp, "삭제되었씸", "../mvcboard/list.do");
			
		
	}
}
