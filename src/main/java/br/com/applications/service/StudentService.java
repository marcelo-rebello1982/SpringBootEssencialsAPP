package br.com.applications.service;

import br.com.applications.model.Student;
import br.com.applications.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class StudentService {

    @Autowired
    StudentRepository studentRepository;

    public List<Student> getAllStudents() {

        return studentRepository.findAll();

    }

    public Optional<Student> findByID(Integer id) {
        return studentRepository.findById(id);
    }

    public Student save(Student student) {
        return studentRepository.save(student);
    }

    public void delete(Student student) {
                studentRepository.delete(student);
    }

}
