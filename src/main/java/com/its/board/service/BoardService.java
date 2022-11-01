package com.its.board.service;

import com.its.board.dto.BoardDTO;
import com.its.board.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;

    public boolean save(BoardDTO boardDTO) {
        int result = boardRepository.save(boardDTO);
        if (result > 0 ) {
            return true;
        } else {
            return false;
        }

    }

    public List<BoardDTO> boardList() {
        return boardRepository.boardList();
    }

    public BoardDTO findById(Long id) {
//        BoardDTO result = boardRepository.findById(id);
//        return result;
        return boardRepository.findById(id);

    }
}
