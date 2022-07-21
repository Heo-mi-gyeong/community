package util_DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import vo.CommentVO;

public class CommentDAO {
	private static Connection cn = DBConnection.getConnection(); 
	private static PreparedStatement pst;
	private static ResultSet rs;
	private static String sql;
	
	public List<CommentVO> commentList(CommentVO cvo) {
		sql = "select * from comment where seq=?";
		List<CommentVO> clist = new ArrayList<CommentVO>();
		try {
			pst=cn.prepareStatement(sql);
			 pst.setString(1, cvo.getSeq());
			 rs= pst.executeQuery();
			 if (rs.next()) {
				 do {
					 CommentVO vo = new CommentVO();
					 vo.setSeq(rs.getString(1));
					 vo.setMySeq(rs.getInt(2));
					 vo.setLogId(rs.getString(3));
					 vo.setMyId(rs.getString(4));
					 vo.setCom(rs.getString(5)); //이름으로도 가능
					 vo.setDate(rs.getString(6));
					 clist.add(vo);
				 }while(rs.next());
			 }else {
				 System.out.println("** 출력할 데이터가 1건도 없습니다 **");
				 clist = null;
			 }
		} catch (Exception e) {
			System.out.println("** 댓글 출력 에러=> "+e);
			 clist = null;
		} //catch
		return clist;
	}
	
	public List<CommentVO> commentList2(CommentVO cvo) {
		sql = "select * from comment where seq=?";
		List<CommentVO> clist = new ArrayList<CommentVO>();
		try {
			pst=cn.prepareStatement(sql);
			 pst.setInt(1,Integer.parseInt(cvo.getSeq()));
			 rs= pst.executeQuery();
			 if (rs.next()) {
				 do {
					 CommentVO vo = new CommentVO();
					 vo.setSeq(rs.getString(1));
					 vo.setMySeq(rs.getInt(2));
					 vo.setLogId(rs.getString(3));
					 vo.setMyId(rs.getString(4));
					 vo.setCom(rs.getString(5)); //이름으로도 가능
					 vo.setDate(rs.getString(6));
					 clist.add(vo);
				 }while(rs.next());
			 }else {
				 System.out.println("** 출력할 데이터가 1건도 없습니다 **");
				 clist = null;
			 }
		} catch (Exception e) {
			System.out.println("두번째 댓글 출력 에러 => "+e);
			 clist = null;
		} //catch
		return clist;
	}
	
	public List<String> imageList(CommentVO cvo) {
		sql = "select * from comment where seq=?";
		List<String> idList = new ArrayList<String>();
		try {
			pst=cn.prepareStatement(sql);
			 pst.setInt(1,Integer.parseInt(cvo.getSeq()));
			 rs= pst.executeQuery();
			 if (rs.next()) {
				 do {
					 idList.add(rs.getString(4));
				 }while(rs.next());
			 }else {
				 System.out.println("** 출력할 데이터가 1건도 없습니다 **");
				 idList = null;
			 }
		} catch (Exception e) {
			System.out.println("두번째 댓글 출력 에러 => "+e);
			 idList = null;
		} //catch
		return imagesel(idList);
	}
	
	public List<String> imageList2(CommentVO cvo) {
		sql = "select * from comment where seq=?";
		List<String> idList = new ArrayList<String>();
		try {
			pst=cn.prepareStatement(sql);
			 pst.setString(1,cvo.getSeq());
			 rs= pst.executeQuery();
			 if (rs.next()) {
				 do {
					 idList.add(rs.getString(4));
				 }while(rs.next());
			 }else {
				 System.out.println("** 출력할 데이터가 1건도 없습니다 **");
				 idList = null;
			 }
		} catch (Exception e) {
			System.out.println("두번째 댓글 출력 에러 => "+e);
			 idList = null;
		} //catch
		return imagesel(idList);
	}
	
	public List<String> imagesel(List<String> myId) {
		sql= "select uploadfile from member where id=?";
		List<String> clist = new ArrayList<String>();
		try {
			for (String myid : myId) {
				pst=cn.prepareStatement(sql);
				pst.setString(1,myid);
				rs= pst.executeQuery();
				 if (rs.next()) {
					 do {
						 clist.add(rs.getString(1));
					 }while(rs.next());
				 }else {
					 System.out.println("이미지 없음");
					 clist = null;
				 }
			}
		} catch (Exception e) {
			System.out.println("이미지 가져오기 에러=> "+e);
			 return null;
		} 
		return clist;
	}
	
	public int commentDel(CommentVO vo) {
		sql="delete from comment where mySeq=?";
		try {
			pst=cn.prepareStatement(sql);
			pst.setInt(1, vo.getMySeq());
			return pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("** delete Exception => "+e);
			return 0;
		} //try
	} //delete		
	public int commentDel2(CommentVO vo) {
		sql="delete from comment where seq=?";
		try {
			pst=cn.prepareStatement(sql);
			pst.setInt(1, Integer.parseInt(vo.getSeq()));
			return pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("** delete Exception => "+e);
			return 0;
		} //try
	} //delete		
	  public int commentUp(CommentVO vo) { 
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar now =Calendar.getInstance();
	  
	  //세션에 있는 아이디랑 게시물 쓴 사람의 아이디랑 같지 않으면 이라는 조건 추가 
		sql ="update comment set com=?, date=? where mySeq=?"; 
		//sql ="update board set cnt=? where id=? and ?!=?"; 
		try {
			pst=cn.prepareStatement(sql); 
			pst.setString(1, vo.getCom());
			pst.setString(2,sdf1.format(now.getTime()));
			pst.setInt(3, vo.getMySeq());
	  if(pst.executeUpdate()>0) { 
		  System.out.println("댓글 수정 성공"); 
		  return pst.executeUpdate(); 
		  }
	  } catch(Exception e) {
		System.out.println("** insert Exception => "+e); } //try
		return 0;
		}
	 
	public CommentVO commentIn(CommentVO vo) {
		sql = "insert into comment (seq, logId,myId,com)values (?,?,?,?)";
		try {
			pst=cn.prepareStatement(sql);
			pst.setString(1, vo.getSeq());
			pst.setString(2, vo.getLogId());
			pst.setString(3, vo.getMyId());
			pst.setString(4, vo.getCom());
			if(pst.executeUpdate()>0) {
				System.out.println("등록 성공");
				return vo;
			}else {
				System.out.println("등록 실패.");
				vo=null;
			}
		} catch (Exception e) {
			System.out.println("에러 발생 : "+e);
			vo=null;
		}
		return vo;
	}
	
	public int commentBdel(CommentVO vo) {
		sql="delete from comment where seq=?";
		try {
			pst=cn.prepareStatement(sql);
			pst.setInt(1, Integer.parseInt(vo.getSeq()));
			return pst.executeUpdate();
		} catch (Exception e) {
			System.out.println("** delete Exception => "+e);
			return 0;
		} //try
	} //delete		
}
