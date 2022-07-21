package service;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import vo.BoardVO;
@Service
public interface BoardServiceImpl{
	
	List<BoardVO> selectList();

	BoardVO selectOne(BoardVO vo);

	int update(BoardVO vo);

	int cntupdate(BoardVO vo);

	int delete(BoardVO vo);

	int insert(BoardVO vo);

}