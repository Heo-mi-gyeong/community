package com.ncs.green;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.BoardService;
import service.CommentService;
import vo.BoardVO;
import vo.CommentVO;

@Controller
public class BoardController {
	@Autowired
	BoardService service;
	
	@RequestMapping(value = "/bList", method = RequestMethod.GET)
	public ModelAndView bList(ModelAndView mv) {
				mv.addObject("info",service.selectList());
				mv.setViewName("board/boardList");
		return mv;
	}
	
	@RequestMapping(value = "/bdetail")
	public ModelAndView bdetail(HttpServletRequest request, ModelAndView mv,BoardVO vo,CommentVO cvo, HttpServletResponse response, RedirectAttributes rttr) {
		CommentService cservice = new CommentService();
		
		Cookie viewCookie = null;
		Cookie[] cookies = request.getCookies();
		
		if ( cookies!=null ) {
			for ( Cookie c:cookies ) {
				if (c.getName().equals("|"+vo.getSeq()+"|")) {   //  쿠키의 보관 값 -> (seq)
					viewCookie = c;
					break;
				}
			} //for
		} //if
		
		if ( viewCookie==null ) {
			if ( service.cntupdate(vo) > 0 ) {
				Cookie newCookie = new Cookie("|"+vo.getSeq()+"|","view") ;
				newCookie.setMaxAge(24*60*60);  // MaxAge 24시간 지정 -> 단위 초
				response.addCookie(newCookie);
			}else {
				mv.addObject("message", "조회수 증가가 정상적으로 처리되지 않음");
			}
		} // if
		if(service.selectOne(vo)!=null) {
			mv.addObject("comImg", cservice.imageList(cvo));
			mv.addObject("comList", cservice.commentList2(cvo));
			mv.addObject("info",service.selectOne(vo));
			mv.setViewName("board/boardDetail");
		}else {
			rttr.addFlashAttribute("message", "글 번호에 해당하는 글이 없습니다.");
			mv.setViewName("board/boardList");
		}
		return mv;
	}
	
	@RequestMapping(value = "/bdetail2")
	public ModelAndView bdetail2(HttpServletRequest request, ModelAndView mv,BoardVO vo,CommentVO cvo, HttpServletResponse response, RedirectAttributes rttr) {
		CommentService cservice = new CommentService();
		
		if(service.selectOne(vo)!=null) {
			mv.addObject("comImg", cservice.imageList2(cvo));
			mv.addObject("comList", cservice.commentList(cvo));
			mv.addObject("info",service.selectOne(vo));
			mv.setViewName("board/boardDetail");
		}else {
			rttr.addFlashAttribute("message", "글 번호에 해당하는 글이 없습니다.");
			mv.setViewName("board/boardList");
		}
		return mv;
	}
	
	@RequestMapping(value = "/contentIn", method = RequestMethod.GET)
	public ModelAndView contentIn(ModelAndView mv) {
		mv.setViewName("board/contentInsert");
		return mv;
	}
	
	@RequestMapping(value = "/bdetail3") //댓글 번호 받아서 댓글 수정창 가기
	public ModelAndView bdetail3(HttpServletRequest request, ModelAndView mv,BoardVO vo,CommentVO cvo, HttpServletResponse response, RedirectAttributes rttr) {
		CommentService cservice = new CommentService();
		HttpSession session = request.getSession(false);

		if(service.selectOne(vo)!=null) {
			session.setAttribute("mySeq", request.getParameter("mySeq"));
			mv.addObject("comImg", cservice.imageList2(cvo));
			mv.addObject("comList", cservice.commentList(cvo));
			mv.addObject("info",service.selectOne(vo));
			mv.setViewName("board/commentUp");
		}else {
			rttr.addFlashAttribute("message", "글 번호에 해당하는 글이 없습니다.");
			mv.setViewName("board/boardList");
		}
		return mv;
	}
	
	@RequestMapping(value = "/bInsert", method = RequestMethod.POST)
	public ModelAndView bInsert(ModelAndView mv,BoardVO vo,RedirectAttributes rttr ) {
		if(service.insert(vo)>0){
			rttr.addFlashAttribute("message","게시물 등록 성공");
			mv.setViewName("redirect:bList");
		}else {
			rttr.addFlashAttribute("message","게시물 등록 실패");
			mv.setViewName("redirect:bInsert");
		}
		return mv;
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView delete(ModelAndView mv,BoardVO vo,RedirectAttributes rttr,CommentVO cvo ) {
		CommentService cservice = new CommentService();
		
		if(service.delete(vo)>0){
			cservice.commentBdel(cvo);
			rttr.addFlashAttribute("message","게시물 삭제 성공");
			mv.setViewName("redirect:bList");
		}else {
			rttr.addFlashAttribute("message","게시물 삭제 실패");
			mv.setViewName("redirect:bDetail");
		}
		return mv;
	}
	
	@RequestMapping(value = "/contentUp", method = RequestMethod.GET)
	public ModelAndView contentUp(HttpServletRequest request,ModelAndView mv,BoardVO vo) {
		mv.addObject("info",service.selectOne(vo));
		mv.setViewName("board/contentUpdate");
		return mv;
	}
	
	@RequestMapping(value = "/bUpdate", method = RequestMethod.POST)
	public ModelAndView bUpdate(ModelAndView mv,BoardVO vo,RedirectAttributes rttr) {
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar now = Calendar.getInstance();
		vo.setRegdate(sdf1.format(now.getTime()));
		if(service.update(vo)>0){
			rttr.addFlashAttribute("message","게시물 수정 성공");
			mv.setViewName("redirect:bList");
		}else {
			rttr.addFlashAttribute("message","게시물 삭제 실패");
			mv.setViewName("redirect:bDetail?seq="+vo.getSeq());
		}
		return mv;
	}
	
}