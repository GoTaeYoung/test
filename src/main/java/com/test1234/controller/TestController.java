package com.test1234.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.test1234.dao.TestDao;
import com.test1234.vo.UserVO;

@Controller
public class TestController {
	@Autowired
	TestDao testDao;

	@RequestMapping("/test")
	public String test() {
		return "/test";
	}

	@RequestMapping("/test1")
	public ModelAndView test1(HttpServletRequest req) {
		ModelAndView model = new ModelAndView("/test1");
		UserVO vo = new UserVO();
		vo.setId(req.getParameter("id"));
		vo.setPw(req.getParameter("pw"));
		vo.setName(req.getParameter("name"));
		vo.setNname(req.getParameter("nname"));
		vo.setRadio1(req.getParameter("radio1"));
		vo.setCb(Arrays.toString(req.getParameterValues("cb")));
		vo.setRadio2(req.getParameter("radio2"));
		vo.setSns(req.getParameter("sns"));
		System.out.println(vo.toString());
		if (testDao.checkId(req.getParameter("id")) == 0) {
			testDao.insertTest(vo);
			System.out.println("회원가입 완료");
		} else if (testDao.checkId(req.getParameter("id")) == 1) {
			testDao.updateTest(vo);
			System.out.println("정보수정 완료");
		}
		model.addObject("vo", vo);
		return model;
	}

	// ------------------------------------------------------
	// @RequestMapping(value = "/test1", produces = "application/text;charset=utf8")
	// @ResponseBody
	// public String index1() /* throws UnsupportedEncodingException */ {
	// return /* URLEncoder.encode( */"성공"/* , "UTF-8") */;
	// }
	@RequestMapping(value = "/checkId", produces = "application/text;charset=utf8")
	@ResponseBody
	public String checkId(HttpServletRequest req) {
		String id = req.getParameter("id");
		int cntId = testDao.checkId(id);
		if (cntId == 0)
			return "사용 가능";
		return "사용 불가능";
	}

	@RequestMapping("/test2")
	public ModelAndView test2(HttpServletRequest req) {
		ModelAndView model = new ModelAndView("/test2");
		UserVO vo = testDao.getUserData(req.getParameter("id"));
		System.out.println("갑니다");
		System.out.println(vo.toString());
		model.addObject("vo", vo);
		return model;
	}

	@RequestMapping("/main")
	public ModelAndView goMain(HttpServletRequest req) {
		ModelAndView model = new ModelAndView("/main");
		UserVO vo = testDao.getUserData(req.getParameter("id"));
		model.addObject("vo", vo);
		return model;
	}
}
