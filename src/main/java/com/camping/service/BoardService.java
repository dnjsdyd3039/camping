package com.camping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camping.dao.BoardDao;

@Service
public class BoardService {
	
	@Autowired
	BoardDao bdao;
}
