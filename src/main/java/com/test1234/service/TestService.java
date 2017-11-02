package com.test1234.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test1234.dao.TestDao;

@Service
public class TestService {

	@Autowired
	TestDao testDao;

}
