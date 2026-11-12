package com.studentmanagement.service;

import com.studentmanagement.entity.Student;
import com.studentmanagement.exception.StudentNotFoundException;
import com.studentmanagement.repository.StudentRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class StudentServiceImpl implements StudentService {

    private final StudentRepository studentRepository;

    public StudentServiceImpl(StudentRepository studentRepository) {
        this.studentRepository = studentRepository;
    }

    @Override
    public Student saveStudent(Student student) {
        student.setId(null);
        return studentRepository.save(student);
    }

    @Override
    public Student updateStudent(Student student) {
        if (student.getId() == null) {
            throw new StudentNotFoundException("Student ID is required for update");
        }
        Student existingStudent = studentRepository.findById(student.getId());
        if (existingStudent == null) {
            throw new StudentNotFoundException("Student not found with id: " + student.getId());
        }
        existingStudent.setFullName(student.getFullName());
        existingStudent.setEmail(student.getEmail());
        existingStudent.setMobile(student.getMobile());
        existingStudent.setAge(student.getAge());
        existingStudent.setCourse(student.getCourse());
        return studentRepository.save(existingStudent);
    }

    @Override
    @Transactional(readOnly = true)
    public Student getStudentById(Long id) {
        Student student = studentRepository.findById(id);
        if (student == null) {
            throw new StudentNotFoundException("Student not found with id: " + id);
        }
        return student;
    }

    @Override
    @Transactional(readOnly = true)
    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }

    @Override
    public void deleteStudent(Long id) {
        Student student = studentRepository.findById(id);
        if (student == null) {
            throw new StudentNotFoundException("Student not found with id: " + id);
        }
        studentRepository.delete(student);
    }
}
