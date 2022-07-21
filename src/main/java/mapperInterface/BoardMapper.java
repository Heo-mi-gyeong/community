package mapperInterface;

import java.util.List;

import vo.BoardVO;

public interface BoardMapper {
	List<BoardVO> selectList();
	BoardVO selectOne(BoardVO vo);
	int insert(BoardVO vo);
	int cntupdate(BoardVO vo);
	int update(BoardVO vo);
	int delete(BoardVO vo);
}
