package com.camping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping(value = "freeBoard")
	public String freeBoard() {
		return "FreeBoard";
	}
}
