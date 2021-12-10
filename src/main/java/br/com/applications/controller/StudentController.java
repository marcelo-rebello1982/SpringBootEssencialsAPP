package br.com.applications.controller;

import br.com.applications.model.Student;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.List;

@RestController
@RequestMapping("api/v1/students")
public class StudentController {


//    private static final List<Student> STUDENTS = Arrays.asList(
//            new Student(1, "Marcelo Paulo Rebello Martins", "27769157803", "mp.rebello.martins@gmail.com", "Developer"),
//            new Student(2, "Patricia Cinti Ramos Martins", "30158469810", "patymorr@hotmail.com", ""),
//            new Student(3, "", "Adelina Dos Santos Rebello", "06558416810", "adelina.santos@terra.com.br"));
//
//
//    @GetMapping("findByID/{student_Id}")
//    public Student getStudent(@PathVariable("student_Id") Integer studentId) {
//        return STUDENTS.stream().filter(student -> studentId.equals(student.getId())).findFirst()
//                .orElseThrow(() -> new IllegalArgumentException("Student " + studentId + " does not exist"));
//
//    }
}
