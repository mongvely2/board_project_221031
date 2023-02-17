package com.its.board.controller;

import com.its.board.dto.BoardDTO;
import com.its.board.dto.CommentDTO;
import com.its.board.dto.PageDTO;
import com.its.board.service.BoardService;
import com.its.board.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {

    // 오토와이어드는 선언하고 하나만 적용됨, 하나당 하나씩 선언 후 사용
    @Autowired
    private BoardService boardService;

    @Autowired
    private CommentService commentService;

    // @RequestMapping 없는 경우 ->
    // @GetMapping("/board/save") -> /board/board/save 주소요청 반응 _ 잘못된 방법
    // = @RequestMapping(value = "/save", method = RequestMethod.GET) _ 위, 아래랑 동일
    @GetMapping("/save")
    public String boardSaveForm() {
        return "boardPages/boardSave";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO) throws IOException {
        boardService.save(boardDTO);
        return "redirect:/board/";
//        boolean result = boardService.save(boardDTO);
//        if (result) {
//            return "redirect:/board/";
//        } else {
//            return "index";
//        }
    }

    @GetMapping("/")
    public String boardList(Model model){
        List<BoardDTO> boardList = boardService.boardList();
        model.addAttribute("boardList", boardList);
        return "boardPages/boardList";
    }

    @GetMapping("/paging")
    public String paging(Model model,
                         @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
//        System.out.println("model = " + model + ", page = " + page);

        // 해당 페이지에서 보여줄 글 목록
        List<BoardDTO> pagingList = boardService.pagingList(page);
        // 하단 페이지 번호 표현을 위한 데이터
        PageDTO pageDTO = boardService.pagingParam(page);
        model.addAttribute("boardList", pagingList);
        model.addAttribute("paging", pageDTO);
        return "boardPages/boardPaging";
    }

//    상세조회: /board 로 호출하는데 기본 리퀘스트맵핑이 /board로 되어있어서 공란으로 기입함
    @GetMapping
    public String findById(@RequestParam("id") Long id, Model model,
//                           @RequestParam("boardContents") int page){
                           @RequestParam(value = "page", required = false, defaultValue = "1") int page) {
        boardService.updateHits(id);
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        model.addAttribute("page", page);
//        System.out.println("조회: boardDTO = " + boardDTO);
        // 상세조회한 게시글에도 댓글 내용 포함시켜야 함, 아래부터 상세게시글 댓글보이는 코드
        // CommentService에 있는 댓글 리스트 메서드 바로 활용함
        // 반드시 CommentService Class 오토와이어드 추가 선언!!!
        List<CommentDTO> commentDTOList = commentService.findAll(id);
        model.addAttribute("commentList", commentDTOList);
        return "boardPages/boardDetail";
    }

    @GetMapping("/deleteCheck")
    public String deleteCheck(@RequestParam("id") Long id, Model model) {
//        BoardDTO boardDTO = boardService.findById(id);
//        -> findById 메서드와 같기 때문에 굳이 메서드 선언하지 않고 findById 메서드 활용해도 됨
        BoardDTO result = boardService.deleteCheck(id);
        model.addAttribute("result", result);
//        System.out.println("1"+result);
        return "boardPages/deleteCheck";
    }

    @GetMapping("/delete")
    public String deleteBoard(@RequestParam("id") Long id) {
        int result = boardService.deleteBoard(id);
//        System.out.println("2"+result);
        return "redirect:/board/";
    }

    //    findById 메서드와 동일한 작업 진행함으로 해당 메서드 활용(따로 만들어도 되긴 함)
    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model) {
    //    findById 메서드와 동일한 작업 진행함으로 해당 메서드 활용
    //    _서비스,리파지토리,맵퍼,쿼리 작성 안해도 됨(따로 만들어도 되긴 함)
        BoardDTO result = boardService.findById(id);
        model.addAttribute("result", result);
//        System.out.println("id = " + id + ", model = " + model);
        return "boardPages/boardUpdate";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO, Model model) {
        boardService.update(boardDTO);
//        수정 처리 후 상세페이지 출력
//        redirect로 상세페이지 요청 -> 조회수가 하나 더 늘음
//        return "redirect:/board?id=" + boardDTO.getId();
//        DB에서 가져와서 boardDetail 출력
        BoardDTO dto = boardService.findById(boardDTO.getId());
        model.addAttribute("result", dto);
        return "boardPages/boardDetail";
    }

    // 검색처리
    @GetMapping("/search")
    public String search(@RequestParam("type") String type,
                         @RequestParam("q") String q, Model model) {
        List<BoardDTO> searchList = boardService.search(type, q);
        model.addAttribute("boardList", searchList);
        return "boardPages/boardList";
    }




//    @GetMapping("/board")
//    public String boardDetail




}
