package controllerC;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CommentService;
import vo.CommentVO;

@WebServlet("/cdelete")
public class C02_deleteCom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public C02_deleteCom() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		CommentVO cvo = new CommentVO();
		CommentService cservice = new CommentService();
		HttpSession session = request.getSession(false);
		
		String url = "";

		cvo.setSeq(request.getParameter("seq"));
		cvo.setMySeq(Integer.parseInt(request.getParameter("myseq")));
		if(cvo!=null) {
			cservice.commentDel(cvo);
			//session.removeAttribute("comList");
			url="bdetail";
		}
		else {
			request.setAttribute("message", "삭제에 실패했습니다.");
			url="bdetail";
		}
		request.getRequestDispatcher(url).forward(request, response); 
		}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
