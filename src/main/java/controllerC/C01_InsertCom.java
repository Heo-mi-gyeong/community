package controllerC;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BoardService;
import service.CommentService;
import vo.BoardVO;
import vo.CommentVO;

@WebServlet("/cList")
public class C01_InsertCom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public C01_InsertCom() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		CommentVO cvo = new CommentVO();
		CommentService cservice = new CommentService();
		HttpSession session = request.getSession(false);
		
		String url = "";

		cvo.setSeq(request.getParameter("seq"));
		cvo.setMyId((String)session.getAttribute("LoginId"));
		cvo.setLogId( request.getParameter("myid"));
		cvo.setCom(request.getParameter("com"));
		if(cvo!=null) {
			cservice.commentIn(cvo);
			url="bdetail2";
		}
		else {
			request.setAttribute("message", "등록에 실패했습니다.");
			url="bdetail2";
		}
		request.getRequestDispatcher(url).forward(request, response); 
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
