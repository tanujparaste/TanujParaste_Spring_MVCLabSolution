package com.studentmanagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.studentmanagement.entity.Student;
import com.studentmanagement.service.IStudentService;

@Controller
@RequestMapping("/student")
public class StudentController {

	private IStudentService studentService;
	private String action;

	@Autowired
	public StudentController(IStudentService studentService) {
		this.studentService = studentService;
	}

	@RequestMapping("/register")
	public String register(Model model) {
		Student student = new Student();
		model.addAttribute(student);
		action = "register";
		return "student-form";
	}

	@RequestMapping("/update")
	public String updateStudent(@RequestParam("id") int id, Model model) {
		Student student = studentService.findById(id);
		model.addAttribute(student);
		action = "update";
		return "update-student-form";
	}

	@RequestMapping("/save")
	public String saveStudent(@RequestParam("id") int id, @RequestParam("name") String name,
			@RequestParam("department") String department, @RequestParam("country") String country, Model model) {
		if (!name.equals("") && !department.equals("") && !country.equals("")) {
			Student student = null;
			if (id != 0) {
				student = studentService.findById(id);
				student.setName(name);
				student.setDepartment(department);
				student.setCountry(country);
			} else {
				student = new Student(name, department, country);
			}
			studentService.save(student);
			return "redirect:./list";
		} else {
			if (action.equalsIgnoreCase("register")) {
				return "redirect:./register";
			} else if (action.equalsIgnoreCase("update")) {
				return "redirect:./update?id=" + id;
			} else {
				return "redirect:./register";
			}
		}
	}

	@RequestMapping("/delete")
	public String deleteStudent(@RequestParam("id") int id) {
		studentService.deleteById(id);
		return "redirect:./list";
	}

	@RequestMapping("/list")
	public String listStudents(Model model) {
		List<Student> students = studentService.findAll();
		model.addAttribute("students", students);
		return "list-students";
	}
}
