package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mapperInterface.BoardMapper;
import vo.BoardVO;

@Service
public class BoardService implements BoardServiceImpl {
	@Autowired
	BoardMapper mapper;
	
	@Override
	public List<BoardVO> selectList(){
		return mapper.selectList();
	}
	
	@Override
	public BoardVO selectOne(BoardVO vo){
		return mapper.selectOne(vo);
	}
	
	@Override
	public int cntupdate(BoardVO vo) {
		return mapper.cntupdate(vo);
	}
	@Override
	public int update(BoardVO vo) {
		return mapper.update(vo);
	}
	@Override
	public int delete(BoardVO vo) {
		return mapper.delete(vo);
	}
	@Override
	public int insert(BoardVO vo) {
		return mapper.insert(vo);
	}
	}
