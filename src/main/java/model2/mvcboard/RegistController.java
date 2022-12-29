package model2.mvcboard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import membership.MemberDAO;
import membership.MemberDTO;
import utils.JSFunction;

@WebServlet("/mvcboard/regist.do")
public class RegistController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		String id = req.getParameter("id");
		String pass1 = req.getParameter("pass1");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String domain = req.getParameter("domain");
		String mobile = req.getParameter("phonenum");
		
		

		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPass(pass1);
		dto.setName(name);
		dto.setEmail(email);
		dto.setDomain(domain);
		dto.setPhonenum(mobile);

		MemberDAO dao = new MemberDAO(getServletContext());

		int iResult = dao.addAccount(dto); 
		//자원해제
		dao.close();
		 
		if(iResult == 1){
		   JSFunction.alertLocation(resp, "회원가입 성공", "../mvcboard/list.do"); 
		}
		else{
		   
		   JSFunction.alertBack(resp, "회원가입에 실패하였습니다.");
		}

		
	}
}
