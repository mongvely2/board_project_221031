package com.its.board.controller;

import com.its.board.dto.BoardDTO;
import com.its.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    private BoardService boardService;

    // @RequestMapping 없는 경우 ->
    // @GetMapping("/board/save") -> /board/board/save 주소요청 반응 _ 잘못된 방법
    // = @RequestMapping(value = "/save", method = RequestMethod.GET) _ 위, 아래랑 동일
    @GetMapping("/save")
    public String boardSaveForm() {
        return "boardPages/boardSave";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute BoardDTO boardDTO) {
        boolean result = boardService.save(boardDTO);
        if (result) {
            return "redirect:/board/";
        } else {
            return "index";
        }
    }

    @GetMapping("/")
    public String boardList(Model model){
        List<BoardDTO> boardList = boardService.boardList();
        model.addAttribute("boardList", boardList);
        return "boardPages/boardList";
    }

//    상세조회: /board 로 호출하는데 기본 리퀘스트맵핑이 /board로 되어있어서 공란으로 기입함
    @GetMapping
    public String findById(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("result", boardDTO);
        return "boardPages/boardDetail";
    }

    @GetMapping("/delete")
    public String deleteCheck(@RequestParam("result") Long id, Model model) {
        BoardDTO result = boardService.deleteCheck(id);
        model.addAttribute("result", result);
        return "boardPages/deleteCheck";
    }

//    @GetMapping("/board")
//    public String boardDetail




}
