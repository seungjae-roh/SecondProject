package model2.mvcboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.BoardPage;



@WebServlet("/mvcboard/default.do")
public class MainController extends HttpServlet{
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      MVCBoardDAO dao = new MVCBoardDAO();
      
      Map<String, Object> map = new HashMap<String, Object>();
      
      String b_flag = req.getParameter("b_flag");
		map.put("b_flag", "notice");
      
      String searchField = req.getParameter("searchField");
      String searchWord = req.getParameter("searchWord");
      
      if(searchWord != null) {
         map.put("searchField", searchField);
         map.put("searchWord", searchWord);
      }
      
      int totalCount = dao.selectCount(map);
      
      ServletContext application = getServletContext();
      int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
      int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
      
      int pageNum = 1;
      String pageTemp = req.getParameter("pageNum");
      if(pageTemp != null && !pageTemp.equals("")) {
         pageNum = Integer.parseInt(pageTemp);
      }
      
      int start = (pageNum - 1) * pageSize;
      int end = pageSize;
      
      map.put("start", start);
      map.put("end", end);
      
      List<MVCBoardDTO> boardLists = dao.selectListPage(map);
      dao.close();
      
      String pagingImg= BoardPage.pagingStr(totalCount, pageSize,
    		  blockPage, pageNum, "../mvcboard/notice.do", b_flag);
      
      map.put("pagingImg", pagingImg);
      map.put("totalCount", totalCount);
      map.put("pageSize", pageSize);
      map.put("pageNum", pageNum);
      
      req.setAttribute("boardLists", boardLists);
      req.setAttribute("map", map);
      
      req.getRequestDispatcher("/14MVCBoard/Default.jsp").forward(req, resp);
   }
}