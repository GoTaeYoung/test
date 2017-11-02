package com.test1234.service;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.test1234.dao.TestDao;
import com.test1234.vo.UserVO;

@Service
public class TestService {

	@Autowired
	TestDao testDao;
	
	public ModelAndView test1(HttpServletRequest request, UserVO userVo, String viewName){
		
		ModelAndView model = new ModelAndView(viewName);
		userVo.setCb(Arrays.toString(request.getParameterValues("cb")));
		if (testDao.checkId(request.getParameter("id")) == 0) {
			testDao.insertTest(userVo);
			System.out.println("회원가입 완료");
		} else if (testDao.checkId(request.getParameter("id")) == 1) {
			testDao.updateTest(userVo);
			System.out.println("정보수정 완료");
		}
		model.addObject("vo", userVo);
		return model;
	}

}
