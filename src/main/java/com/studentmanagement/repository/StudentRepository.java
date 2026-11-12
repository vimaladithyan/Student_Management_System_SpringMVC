package com.studentmanagement.repository;

import com.studentmanagement.entity.Student;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class StudentRepository {

    @PersistenceContext
    private EntityManager entityManager;

    public Student save(Student student) {
        if (student.getId() == null) {
            entityManager.persist(student);
            return student;
        }
        return entityManager.merge(student);
    }

    public Student findById(Long id) {
        return entityManager.find(Student.class, id);
    }

    public List<Student> findAll() {
        return entityManager.createQuery("select s from Student s order by s.id desc", Student.class)
                .getResultList();
    }

    public void delete(Student student) {
        entityManager.remove(entityManager.contains(student) ? student : entityManager.merge(student));
    }
}
