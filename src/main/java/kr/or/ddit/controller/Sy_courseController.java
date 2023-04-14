package kr.or.ddit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/sycourse")
@Controller
public class Sy_courseController {
	
	/**
	 * 강의 목록
	 * 학생 / 교수 공통
	 */
	@GetMapping("/list")
	public String courseList() {
		return "course/list";
	}
	
	/**
	 * 주차
	 * 학생
	 */
	@GetMapping("/week")
	public String courseWeek() {
		return "course/week";
	}
	
	/**
	 * 공지
	 * 학생 / 교수 공통
	 */
	@GetMapping("/notice")
	public String courseNotice() {
		return "course/notice";
	}
	
	/**
	 * 공지 detail
	 * 학생
	 */
	@GetMapping("/noticeDetail")
	public void courseNoticeDetail() {}
	
	/**
	 * 공지 insert / update 페이지
	 * 교수
	 */
	@GetMapping("/noticeForm")
	public void courseNoticeForm() {}
	
	/**
	 * 학생 목록
	 * 교수
	 */
	@GetMapping("/studentList")
	public void courseStudentList() {}
	
	/**
	 * 과제
	 * 학생 / 교수 공통
	 */
	@GetMapping("/assignment")
	public String courseAssignment() {
		return "course/assignment";
	}
	
	/**
	 * 자료실
	 * 학생 / 교수 공통
	 */
	@GetMapping("/reference")
	public void courseReference() {}
	
}
