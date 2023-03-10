package model2.mvcboard;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;

@WebServlet("/mvcboard/edit.do")
public class EditController extends HttpServlet{
	
	//수정페이지로 진입해서 기존 내용을 수정폼에 설정한다.
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String idx = req.getParameter("idx");
		MVCBoardDAO dao = new MVCBoardDAO();
		MVCBoardDTO dto = dao.selectView(idx);

		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/14MVCBoard/Edit.jsp").forward(req, resp);
	}
	
	
	//게시물 수정처리 및 파일업로드
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		String saveDirectory = req.getServletContext().getRealPath("/Uploads");
		
		ServletContext application = this.getServletContext();
		int maxPostSize = 
					Integer.parseInt(application.getInitParameter("maxPostSize"));
		
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
		
		if (mr == null) {
			JSFunction.alertBack(resp, "첨부 파일이 제한 용량을 초과합니다.");
			return;
		}
		
		//hidden박스에 저장된 내용(게시물 수정 및 파일 수정에 필요함)
		String idx = mr.getParameter("idx");
		String prevOfile = mr.getParameter("prevOfile");
		String prevSfile = mr.getParameter("prevSfile");
		String b_flag = mr.getParameter("b_flag");
		
		//사용자가 직접 입력한 값
		String id = mr.getParameter("id");
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		
		HttpSession session = req.getSession();
		String pass = (String)session.getAttribute("pass");
		
		MVCBoardDTO dto = new MVCBoardDTO();
		dto.setIdx(idx);
		dto.setId(id);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setB_flag(b_flag);
		
		//수정페이지에서 첨부한 파일이 있는경우 파일명을 변경한다.
		String fileName = mr.getFilesystemName("ofile");
		if (fileName != null) {
			/*
			날짜와 시간으로 파일명을 생성한 후 확장자와 합쳐서 서버에
			저장될 파일명을 만든다.
			 */
			String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
			String ext = fileName.substring(fileName.lastIndexOf("."));
			String newFileName = now + ext;
			
			File oldFile = new File(saveDirectory + File.separator + fileName); 
			File newFile = new File(saveDirectory + File.separator + newFileName);
			oldFile.renameTo(newFile);
			
			dto.setOfile(fileName);
			dto.setSfile(newFileName);
			
			//새로운 파일이 등록되었으므로 기존 파일은 삭제한다.
			FileUtil.deleteFile(req, "/Uploads", prevSfile);
		}
		else {
			//새로운 파일을 등록하지 않은 경우 기존 파일명을 그대로 DTO에 저장한다.
			dto.setOfile(prevOfile);
			dto.setSfile(prevSfile);
		}
		
		MVCBoardDAO dao = new MVCBoardDAO();
		int result = dao.editPost(dto);
		dao.close();
		
		if (result == 1) {
			//내용보기 화면으로 이동하여 수정된 내용을 확인한다.(b_flag 사용)
			resp.sendRedirect
				("../mvcboard/view.do?b_flag="+ b_flag + "&idx=" + dto.getIdx());
		}
		else {
			JSFunction.alertBack(resp, "수정하기에 실패하였습니다.");
		}
	}
}
