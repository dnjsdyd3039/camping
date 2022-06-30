package com.camily.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.camily.dao.BoardDao;

@Service
public class BoardService {
	
	@Autowired
	BoardDao bdao;
}
