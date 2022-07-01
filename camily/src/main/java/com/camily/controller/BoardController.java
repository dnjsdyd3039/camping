package com.camily.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {

	@GetMapping("write")
	public String boardWrite() {
		return "board/boardWrite";
	}
}
