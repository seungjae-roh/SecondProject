package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import membership.MemberDAO;
import membership.MemberDTO;
import utils.JSFunction;

@WebServlet("/mvcboard/update.do")
public class UpdateController extends HttpServlet{
	
	//회원정보 수정페이지로 진입해서 기존 내용을 수정폼에 설정한다.
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		
		MemberDAO dao = new MemberDAO(getServletContext());
		MemberDTO dto = dao.getMemberDTO(id, pass);
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("../14MVCBoard/Update.jsp").forward(req, resp);
	}
	
	
	//회원정보수정
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		//사용자가 직접 입력한 값
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String domain = req.getParameter("domain");
		String phonenum = req.getParameter("phonenum");
		
		
		
		//DTO에 데이터 저장
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPass(pass);
		dto.setName(name);
		dto.setEmail(email);
		dto.setDomain(domain);
		dto.setPhonenum(phonenum);
		
		//DB연결및 업데이트 처리
		MemberDAO dao = new MemberDAO(getServletContext());
		int result = dao.UpdateInfo(dto);
		dao.close();
		
		if (result == 1) {
			//내용보기 화면으로 이동하여 수정된 내용을 확인한다.
			JSFunction.alertLocation(resp, "회원정보수정 성공", "../mvcboard/list.do");
		}
		else {
			JSFunction.alertBack(resp, "회원정보수정에 실패하였습니다.");

		}
	}
}
