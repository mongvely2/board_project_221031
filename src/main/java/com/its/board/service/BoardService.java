package com.its.board.service;

import com.its.board.dto.BoardDTO;
import com.its.board.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;

    public void save(BoardDTO boardDTO) throws IOException {
        /*
        1. BoardDTO 객체에 담긴 파일을 꺼냄
        2. 파일의 원본 이름을 가져옴(originalFileName)
        3. 서버 관리용 이름 만듦(storedFileName)
        4. originalFileName, storedFileName 을 dto 객체에 담음
        5. 파일 실제 저장 위치 지정
        6. 파일 저장 처리
        7. repository로 dto 객체 전달
         */
        if (!boardDTO.getBoardFile().isEmpty()) {
            System.out.println("파일있음");
            MultipartFile boardFile = boardDTO.getBoardFile(); //   1
            String originalFileName = boardFile.getOriginalFilename(); //   2
            System.out.println("originalFileName = " + originalFileName);
            System.out.println(System.currentTimeMillis());
            String storedFileName = System.currentTimeMillis() + "-" + originalFileName; // 3
            System.out.println("storedFileName = " + storedFileName);
            boardDTO.setOriginalFileName(originalFileName); //  4
            boardDTO.setStoredFileName(storedFileName); //  4
            String savePath = "D:\\spring_img\\" + storedFileName; //   5 -> 경로지정, 뒤에 백슬래시(\\) 두 개 붙여줘야함
            boardFile.transferTo(new File(savePath));   //  6 -> 첨부파일 저장처리
            boardDTO.setFileAttached(1);  // 파일이 있을 경우 1이란 값 부여, 없으면 0부여(else)
            BoardDTO savedBoard = boardRepository.save(boardDTO); //  7 -> save(텍스트입력값, 기존에 하던것) 처리
            boardRepository.saveFileName(savedBoard);
        } else {
            System.out.println("파일없음");
            boardDTO.setFileAttached(0);
            boardRepository.save(boardDTO);
        }

//        int result = boardRepository.save(boardDTO);
//        if (result > 0 ) {
//            return true;
//        } else {
//            return false;
//        }
//        return true;

    }

    public List<BoardDTO> boardList() {
        return boardRepository.boardList();
    }

    public void updateHits(Long id) {
        boardRepository.updateHits(id);
    }
    public BoardDTO findById(Long id) {
        //        조회수 증가 부터 처리
//        boardRepository.updateHits(id);
        //        상세내용 가져와서 리턴
//        BoardDTO result = boardRepository.findById(id);
//        return result;
        return boardRepository.findById(id);
    }


    public BoardDTO deleteCheck(Long id) {
        return boardRepository.deleteCheck(id);
    }

    public int deleteBoard(Long id) {
        return boardRepository.deleteBoard(id);
    }

//    public BoardDTO updateForm(Long id) {
//        return boardRepository.updateForm(id);
//    }

    public void update(BoardDTO boardDTO) {
        boardRepository.update(boardDTO);
    }
}
