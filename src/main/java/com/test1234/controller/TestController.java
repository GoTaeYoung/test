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
import com.test1234.service.TestService;
import com.test1234.vo.UserVO;

@Controller
public class TestController {
	@Autowired
	TestDao testDao;
	@Autowired TestService testService;
	@RequestMapping("/test")
	public String test() {
		return "/test";
	}
	@RequestMapping("/test1")
	public ModelAndView test1(HttpServletRequest req, UserVO userVo ) {
		return testService.test1(req, userVo, "/test1");
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
		return testDao.checkId(req.getParameter("id")) > 0 ? "가능" : "불가능";
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
