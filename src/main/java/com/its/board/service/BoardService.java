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
        //        조회수 증가 부터 처리
        boardRepository.updateHits(id);
        //        상세내용 가져와서 리턴
//        BoardDTO result = boardRepository.findById(id);
//        return result;
        return boardRepository.findById(id);
    }


    public BoardDTO deleteCheck(Long id) {
        return boardRepository.deleteCheck(id);
    }
}
