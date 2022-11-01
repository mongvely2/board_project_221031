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


    public int save(BoardDTO boardDTO) {
        return sql.insert("Board.save", boardDTO);
    }

    public List<BoardDTO> boardList() {
        return sql.selectList("Board.boardList");
    }

    public BoardDTO findById(Long id) {
        return sql.selectOne("Board.findById", id);
    }
}