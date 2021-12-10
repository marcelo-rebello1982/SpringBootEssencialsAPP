package br.com.applications.model.validation;

import br.com.applications.model.Student;
import br.com.applications.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class CPFUnicoValidator implements ConstraintValidator<CPFUnico, String> {

    @Autowired
    private Student student;

    @Autowired
    private StudentRepository studentRepository;

    @Override
    public boolean isValid(String cpf, ConstraintValidatorContext validatorContext) {
        return studentRepository.findByCpf(cpf).isEmpty();
    }

}