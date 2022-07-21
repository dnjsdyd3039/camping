package com.camily.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.camily.dto.CampingDto;
import com.camily.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService advc;
	
	// ������ ķ���� ��� ������
	@RequestMapping(value="/adminCamping")
	public ModelAndView adminCamping(String page){
		System.out.println("������ ķ���� ��� ������ �̵� ��û");
		ModelAndView mav = advc.getCampingList(page);
		
		return mav;
	}
	
	// ������ ķ���� ���� ����
	@RequestMapping(value="/modifyCampingState")
	public @ResponseBody String modifyCampingState(String cacode, String castate){
		System.out.println("������ ķ���� ���� ���� ��û");
		
		String updateResult = advc.modifyCampingState(cacode,castate);
		
		return updateResult;
	}
	
	// ������ ķ���� �󼼺���
	@RequestMapping(value="/adminCampingInfo")
	public ModelAndView adminCampingInfo(String cacode) {
		System.out.println("������ ķ���� �󼼺��� ��û");
		
		ModelAndView mav = advc.getCampingInfo(cacode);
		return mav;
	}
	
	// ������ ķ���� ��������
	@RequestMapping(value="/modifyCampingInfo")
	public ModelAndView modifyCampingInfo(CampingDto camping, RedirectAttributes ra) throws IllegalStateException, IOException{
		System.out.println("������ ķ���� �������� ��û");
		
		ModelAndView mav = advc.modifyCampingInfo(camping,ra);
		return mav;
	}
	
	// ������ ķ���� ��� ������ �̵�
	@RequestMapping(value="/adminCampingInsertPage")
	public String adminCampingInsertPage() {
		System.out.println("������ ķ���� ��� ������ �̵���û");
		
		return "admin/AdminCampingInsert";
	}
	
	@RequestMapping(value="/adminCampingRegister")
	public ModelAndView adminCampingRegister(CampingDto camping, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("������ ķ���� ��� ��û");
		
		ModelAndView mav = advc.registerCamping(camping,ra);
		return mav;
	}
	
    

}
