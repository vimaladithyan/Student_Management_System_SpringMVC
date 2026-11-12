package com.studentmanagement.service;

import com.studentmanagement.entity.Student;

import java.util.List;

public interface StudentService {

    Student saveStudent(Student student);

    Student updateStudent(Student student);

    Student getStudentById(Long id);

    List<Student> getAllStudents();

    void deleteStudent(Long id);
}

