package com.studentmanagement.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.studentmanagement.entity.Student;

@Repository
public class StudentServiceImpl implements IStudentService {

	private SessionFactory factory;
	private Session session;

	@Autowired
	public StudentServiceImpl(SessionFactory factory) {
		this.factory = factory;
		setSession();
	}

	public void setSession() {
		try {
			session = factory.getCurrentSession();
		} catch (Exception ex) {
			session = factory.openSession();
		}
	}

	@Override
	public List<Student> findAll() {
		session.beginTransaction();
		List<Student> students = session.createQuery("from Student").list();
		session.getTransaction().commit();
		return students;
	}

	@Override
	public Student findById(int id) {
		session.beginTransaction();
		Student student = session.get(Student.class, id);
		session.getTransaction().commit();
		return student;
	}

	@Override
	public void deleteById(int id) {
		session.beginTransaction();
		Student student = session.get(Student.class, id);
		session.delete(student);
		session.getTransaction().commit();
	}

	@Override
	public void save(Student student) {
		session.beginTransaction();
		session.save(student);
		session.getTransaction().commit();
	}

}
