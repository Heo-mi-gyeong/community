package service;

import java.util.List;

import util_DB.CommentDAO;
import vo.CommentVO;

public class CommentService {
	CommentDAO cdao = new CommentDAO();

	public CommentVO commentIn(CommentVO vo) {
		return cdao.commentIn(vo);
	}
	public List<CommentVO> commentList(CommentVO vo) {
		return cdao.commentList(vo);
	}
	public List<String> imageList(CommentVO vo) {
		return cdao.imageList(vo);
	}
	public List<String> imageList2(CommentVO vo) {
		return cdao.imageList2(vo);
	}
	public int commentDel(CommentVO vo) {
		return cdao.commentDel(vo);
	}
	public int commentDel2(CommentVO vo) {
		return cdao.commentDel2(vo);
	}
	public int commentBdel(CommentVO vo) {
		return cdao.commentBdel(vo);
	}
	public List<CommentVO> commentList2(CommentVO vo) {
		return cdao.commentList2(vo);
	}
	public int commentUp(CommentVO vo) {
		return cdao.commentUp(vo);
	}
}
