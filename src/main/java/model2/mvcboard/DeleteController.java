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
		
		String idx = req.getParameter("idx");
		
		MVCBoardDAO dao = new MVCBoardDAO();
		
		MVCBoardDTO dto = dao.selectView(idx);
		//게시물을 삭제한다.
		int result = dao.deletePost(dto);
		dao.close();
		if (result == 1) {
			String saveFileName = dto.getSfile();
			FileUtil.deleteFile(req, "/Uploads", saveFileName);
		}
		JSFunction.alertLocation(resp, "삭제되었씸", "../mvcboard/list.do");
			
		
	}
}
