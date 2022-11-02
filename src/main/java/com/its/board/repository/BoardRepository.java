package com.its.board.repository;

import com.its.board.dto.BoardDTO;
import org.apache.ibatis.session.SqlSessionException;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;


    public BoardDTO save(BoardDTO boardDTO) {
        System.out.println("insert 전 boardDTO = " + boardDTO);
        sql.insert("Board.save", boardDTO);
        System.out.println("insert 후 boardDTO = " + boardDTO);
        return boardDTO;
    }

    public void saveFileName(BoardDTO savedBoard) {
        sql.insert("Board.saveFile", savedBoard);
    }

    public List<BoardDTO> boardList() {
        return sql.selectList("Board.boardList");
    }

    public void updateHits(Long id) {
        sql.update("Board.updateHits", id);
    }

    public BoardDTO findById(Long id) {
        BoardDTO boardDTO = sql.selectOne("Board.findById", id);
        if (boardDTO.getFileAttached() == 1) {
            return sql.selectOne("Board.findByIdFile", id);
        } else {
            return boardDTO;
        }
//        return sql.selectOne("Board.findById", id);
    }


    public BoardDTO deleteCheck(Long id) {
        return sql.selectOne("Board.deleteCheck", id);
    }

    public int deleteBoard(Long id) {
        return sql.delete("Board.deleteBoard", id);
    }

//    public BoardDTO updateForm(Long id) {
//        return sql.selectOne("Board.updateForm", id);
//    }

    public void update(BoardDTO boardDTO) {
        sql.update("Board.update", boardDTO);
    }


}
