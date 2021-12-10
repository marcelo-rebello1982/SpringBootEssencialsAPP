package br.com.applications.model.validation;

import br.com.applications.model.Student;
import br.com.applications.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class EmailUnicoValidator implements ConstraintValidator<EmailUnico, String> {

    @Autowired
    private Student student;

    @Autowired
    private StudentRepository studentRepository;

    @Override
    public boolean isValid(String email, ConstraintValidatorContext constraintValidatorContext) {
        return studentRepository.findByEmail(email).isEmpty();
    }

}