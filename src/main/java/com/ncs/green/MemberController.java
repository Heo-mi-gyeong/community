package com.ncs.green;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.MemberService;
import vo.MemberVO;

// Bean을 생성하는 @
// Java : @Component
// Spring 세분화
// @Controller, @Service, @Repository
@Controller
public class MemberController {
	@Autowired 
	//자동 주입(injection)
	//-> 조건1 주입받으려는 클래스가 반드시 생성되어있어야함
	MemberService service;
	//MemberService service = new MemberServiceImpl();
	
	@RequestMapping(value = "/idDupCheck", method = RequestMethod.GET)
	public ModelAndView idDupCheck(ModelAndView mv,MemberVO vo) {
		mv.addObject("newId",vo.getId());
		vo = service.selectOne(vo);
		if(vo!=null) {
			mv.addObject("idUse","F");
		}else {
			mv.addObject("idUse","T");
		}
		mv.setViewName("member/idDupCheck");
		return mv;
	}
	
	// ** 로그인 폼으로 이동
	@RequestMapping(value = "/loginf", method = RequestMethod.GET)
	public ModelAndView loginf(ModelAndView mv) {
		mv.setViewName("member/loginForm");
		return mv;
	}
	
	// ** 로그인 로직 수행
	@RequestMapping(value = "/login")
	public ModelAndView login(HttpServletRequest request,ModelAndView mv,MemberVO vo,RedirectAttributes rttr) {
		String password= vo.getPassword();
		
		vo = service.selectOne(vo);
		if(vo != null) {
			if ( vo.getPassword().equals(password)) {

				HttpSession session = request.getSession();
				session.setAttribute("LoginId", vo.getId());
				session.setAttribute("LoginName", vo.getName()); //세션에 보관
				session.setAttribute("uploadfile", vo.getUploadfile());
				rttr.addFlashAttribute("message","로그인 성공");
				mv.setViewName("redirect:home");
				//요청명 "home"으로 sendRedirect 
				//redirect의 경우 메시지 출력 안됨
				//	-> 해결: RedirectAttributes
			} else {
				rttr.addFlashAttribute("message","비밀번호가 일치하지 않습니다.");
				mv.setViewName("member/loginForm");
			}
		} else {
			rttr.addFlashAttribute("message","존재하지 않는 아이디 입니다.");
			mv.setViewName("member/loginForm");
		}
		return mv;
	}
	
	// ** 로그아웃
	@RequestMapping(value = "/logout")
	public ModelAndView logoutf(HttpServletRequest request,ModelAndView mv,MemberVO vo,RedirectAttributes rttr) {
		request.getSession().invalidate();
		rttr.addFlashAttribute("message","로그아웃 성공");
		mv.setViewName("redirect:home");
		return mv;
	}
	
	// ** 조인 폼으로 이동 
	@RequestMapping(value = "/joinf", method = RequestMethod.GET)
	public ModelAndView joinf(ModelAndView mv) {
		mv.setViewName("member/joinForm");
		return mv;
	}
	
	// ** 조인 로직 수행
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView join(HttpServletRequest request, ModelAndView mv,MemberVO vo) throws IOException{
		System.out.println(vo);
		// 1. 요청분석
		//1.1) Upload Image 처리
		// => image file 의 저장위치를 결정 -> 저장 -> 저장위치를 vo에 set
		// => 이 작업을 도와주는 객체 : MultipartFile
		
		// ** MultipartFile
	    // => MultipartFile 타입의 uploadfilef 의 정보에서 
	    //    upload된 image 와 화일명을 get 처리,
	    // => upload된 image 를 서버의 정해진 폴더 (물리적위치)에 저장 하고,  -> file1
	    // => 이 위치에 대한 정보를 table에 저장 (vo의 UploadFile 에 set) -> file2
	    // ** image 화일명 중복시 : 나중 이미지로 update 됨. 
		
		// ** Image 물리적위치 에 저장
	      // 1) 현재 웹어플리케이션의 실행 위치 확인 : 
	      // => eslipse 개발환경 (배포전)
	      //    D:\MTest\MyWork\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\Spring01\
	      // => 톰캣서버에 배포 후 : 서버내에서의 위치가 됨
	      //    D:\MTest\IDESet\apache-tomcat-9.0.41\webapps\Spring01\
	      String realPath = request.getRealPath("/"); // deprecated Method
	      System.out.println("** realPath => "+realPath);
	      
	      if(realPath.contains(".eclipse.")) realPath = "D:\\MTest\\MyWork\\Spring01\\src\\main\\webapp\\resources\\uploadImage\\";//개발중
	      else realPath += "resources\\uploadImage\\";  // 톰캣 서버에 배포 후 : 서버내에서의 위치 
	      
	      // 폴더 만들기(File 클래스 활용)
	      // => 위의 저장경로에 폴더가 없는 경우 (uploadImage가 없는 경우) 만들어준다.
	      File f1 = new File(realPath);
	      if(!f1.exists()) f1.mkdir();
	      // => realPath 디렉터리가 존재하는지 검사 (uploadImage 폴더 존재확인)
	      // 존재하지 않으면 디렉터리 생성
	      
	      //기본 이미지 지정하기
	      String file1, file2 = "resources\\uploadImage\\person2.png";
	      
	      // ** MultipartFile
	      // => 업로드한 파일에 대한 모든 정보를 가지고 있으며 이의 처리를 위한 메서드를 제공한다.
	      //    -> String getOriginalFilename(), 
	      //    -> void transferTo(File destFile),
	      //    -> boolean isEmpty()
	      MultipartFile uploadfilef = vo.getUploadfilef();
	      if(uploadfilef!=null&&!uploadfilef.isEmpty()) {
	    	  
	    	  // Image를 선택함 -> Image 저장(경로_realPath +파일명)
	    	  // 1) 물리적 저장경로에 Image 저장
	    	  file1 = realPath + uploadfilef.getOriginalFilename();//경로 완성
	    	  uploadfilef.transferTo(new File(file1)); //Image 저장
	    	  // 2) Table 저장 준비
	    	  file2="resources\\uploadImage\\"+uploadfilef.getOriginalFilename();
	      }
	      //완성된 경로를 vo에 저장
	    vo.setUploadfile(file2);
	      
		if(service.insert(vo)>0) {
			mv.addObject("message","회원가입 성공! 로그인 해주세요. ");
			mv.setViewName("member/loginForm");
		}else {
			mv.addObject("message","회원가입 실패! 다시 회원가입 해주세요.  ");
			mv.setViewName("member/joinForm");
		}
		return mv;
	}
	
	// ** memberList
	@RequestMapping(value="/mList")
	public ModelAndView mList(ModelAndView mv) {
		mv.addObject("banana", service.selectList());
		mv.setViewName("member/memberList");
		return mv;
	}
	
	//** memberDetail
	@RequestMapping(value="/mdetail")
	public ModelAndView mdetail(HttpServletRequest request,ModelAndView mv,MemberVO vo) {
		HttpSession session = request.getSession(false);
		
		if (session != null && session.getAttribute("LoginId")!=null){
			//service 처리
			vo.setId((String)session.getAttribute("LoginId"));
			vo = service.selectOne(vo);
			if(vo != null) {
				request.setAttribute("info", vo);
				if(request.getParameter("jcode")!=null&&request.getParameter("jcode").equals("U")) {
					mv.setViewName("member/updateForm");
				}else mv.setViewName("member/memberDetail");
			}else {mv.addObject("message", "정보를 가져오는데 실패했습니다. 다시 로그인 해주세요.");
			mv.addObject("message", "정보를 가져오는데 실패했습니다. 다시 로그인 해주세요.");
				mv.setViewName("member/loginForm");
			}
		}else {
			mv.addObject("message", "로그인 정보가 없습니다. 다시 로그인 해주세요.");
			mv.setViewName("member/loginForm") ;
		}
		return mv;
	}
	
	//** MemberUpdate
	@RequestMapping(value = "/mupdate", method = RequestMethod.POST)
	public ModelAndView mupdate(HttpServletRequest request, ModelAndView mv,MemberVO vo) throws IOException {
		String realPath = request.getRealPath("/"); // deprecated Method
	      
	      if(realPath.contains(".eclipse.")) realPath = "D:\\MTest\\MyWork\\Spring01\\src\\main\\webapp\\resources\\uploadImage\\";//개발중
	      else realPath += "resources\\uploadImage\\";  // 톰캣 서버에 배포 후 : 서버내에서의 위치 
	      
	      File f1 = new File(realPath);
	      if(!f1.exists()) f1.mkdir();
	      
	      String file1, file2 ;
	      
	      MultipartFile uploadfilef = vo.getUploadfilef();
	      if(uploadfilef!=null&&!uploadfilef.isEmpty()) {
	    	  
	    	  file1 = realPath + uploadfilef.getOriginalFilename();//경로 완성
	    	  uploadfilef.transferTo(new File(file1)); //Image 저장
	    	  file2="resources\\uploadImage\\"+uploadfilef.getOriginalFilename();
	    	  vo.setUploadfile(file2);
	      }
	      
		mv.addObject("info", vo);
		if(service.update(vo)>0) {
			vo = service.selectOne(vo);
			HttpSession session = request.getSession();
			session.setAttribute("LoginId", vo.getId());
			session.setAttribute("LoginName", vo.getName()); //세션에 보관
			session.setAttribute("uploadfile", vo.getUploadfile());
			request.getSession().setAttribute("LoginName", vo.getName());
			mv.addObject("message","업데이트 성공! 로그인 해주세요. ");
			mv.setViewName("member/memberDetail");
		}else {
			mv.addObject("message","업데이트 실패! 다시 회원가입 해주세요.  ");
			mv.setViewName("member/updateForm");
		}
		return mv;
	}
	
	@RequestMapping(value = "/mdelete", method = RequestMethod.GET)
	public ModelAndView mdelete(HttpServletRequest request, ModelAndView mv,MemberVO vo,RedirectAttributes rttr) {
		HttpSession session = request.getSession(false);
		if(session!=null && session.getAttribute("LoginId")!=null) {
				vo.setId((String)session.getAttribute("LoginId"));
				if(service.delete(vo)>0) {
					rttr.addFlashAttribute("message","회원탈퇴 성공! 1개월 후 재가입 가능합니다. ");
					session.invalidate();
					
			}else {
				rttr.addFlashAttribute("message","회원탈퇴 처리 중 오류가 발생했습니다. 잠시후 다시 시도해주세요.  ");
			}
				}else {
					rttr.addFlashAttribute("message","회원탈퇴 실패! 로그인 정보가 없습니다. ");
			}
		mv.setViewName("redirect:home");
		return mv;
	}
}
