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
import vo.CommentVO;

@WebServlet("/cupdate")
public class C03_UpdateCom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public C03_UpdateCom() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		CommentVO cvo = new CommentVO();
		CommentService cservice = new CommentService();
		
		String url = "";

		cvo.setSeq(request.getParameter("seq"));
		cvo.setMySeq(Integer.parseInt(request.getParameter("mySeq")));
		cvo.setCom(request.getParameter("comment"));
		if(cvo!=null) {
			cservice.commentUp(cvo);
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
