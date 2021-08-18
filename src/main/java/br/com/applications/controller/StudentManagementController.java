package br.com.applications.controller;

import br.com.applications.errors.RecordNotFoundException;
import br.com.applications.errors.ResourceNotFoundException;
import br.com.applications.errors.ServerException;
import br.com.applications.generic.GenericController;
import br.com.applications.model.EmailEntity;
import br.com.applications.model.Student;
import br.com.applications.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("management/api/v1/students")
public class StudentManagementController extends GenericController<Student> {

    @Autowired
    public StudentRepository studentRepository;

    public StudentManagementController(StudentRepository studentRepository) {
        super(studentRepository);
    }

    @PostMapping(path = "save")
    @PreAuthorize("hasAuthority('student:write')")
    @Transactional(rollbackOn = Exception.class)
    public ResponseEntity<Student> saveAndFlush(@Valid @RequestBody Student student) {
        Student newStudent = studentRepository.save(student);
        if (newStudent == null) {
            throw new ServerException();
        } else {
            return new ResponseEntity<>(studentRepository.save(student), HttpStatus.CREATED);
        }
    }

    @PutMapping(path = "/update/{studentId}")
    @PreAuthorize("hasAuthority('student:write')")
    public void update(@PathVariable("studentId") Integer studentId, @RequestBody Student student) {
        student.setId(100);
        System.out.println("MÉTODO : update/{studentId} " + String.format("%s %s", studentId, student.getId()));
    }


    @PutMapping(path = "update")
    @PreAuthorize("hasAuthority('student:write')")
    public ResponseEntity<Student> update(@RequestBody final Student newStudent) {
        Student student = studentRepository.save(newStudent);
        if (student != null) {
            return new ResponseEntity<>(student, HttpStatus.CREATED);
        }
        else {
            throw new ServerException();
        }
    }

//    @DeleteMapping("delete")
//    @PreAuthorize("hasAuthority('student:write')")
//    public Map<String, Boolean> delete_(@RequestParam Integer Id) throws ResourceNotFoundException {
//        Student student = studentRepository.findById(Id)
//                .orElseThrow(() -> new ResourceNotFoundException("ATENÇÃO!! CÓDIGO " + Id + " NÃO ENCONTRADO"));
//        studentRepository.delete(student);
//        Map<String, Boolean> response = new HashMap<>();
//        response.put(" CADASTRO ".concat(student.getName().toString()) + " EXCLUÍDO.", Boolean.TRUE);
//        return response;
//    }

    @DeleteMapping("delete")
    @PreAuthorize("hasAuthority('student:write')")
    public ResponseEntity<?> delete(@PathVariable Integer Id) {
        return studentRepository.findById(Id)
                .map(record -> {
                    studentRepository.deleteById(Id);
                    return ResponseEntity.ok().build();
                }).orElse(ResponseEntity.notFound().build());
    }


    @GetMapping(value = "findAllStudents")
    public ResponseEntity<?> findAll(Pageable pageable) {
        return new ResponseEntity<>(studentRepository.findAll(pageable), HttpStatus.OK);
    }

    @ResponseBody
    @GetMapping(value = "findByID")
    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_TRAINEE' )")
    public ResponseEntity<Student> findByID(@RequestParam(name = "Id") Integer id) {
        Optional<Student> student = studentRepository.findById(id);
        if (student.isPresent()) {
            return new ResponseEntity<>(student.get(), HttpStatus.OK);
        } else {
            throw new RecordNotFoundException();
        }
    }


    // OK
    @ResponseBody
    @GetMapping(value = "findByNameContaining")
    public ResponseEntity<List<Student>> findByNameIgnoreCaseContaining(@RequestParam(name = "name") String name) {
        List<Student> student = studentRepository.findByNameIgnoreCaseContaining(name);
        return new ResponseEntity<List<Student>>(student, HttpStatus.OK);
    }

    // OK
    @ResponseBody
    @RequestMapping(value = "findByNameOrCpfContaining", method = RequestMethod.GET)
    public ResponseEntity<List<Student>> findByNameOrCpfContaining(@RequestParam(name = "name") String name, @RequestParam(name = "cpf") String cpf) {
        List<Student> student = studentRepository.findByNameIgnoreCaseContainingOrCpfContaining(name, cpf);
        return new ResponseEntity<List<Student>>(student, HttpStatus.OK);
    }

    @ResponseBody
    @RequestMapping(value = "findByNameOrCpfOrEmailContaining", method = RequestMethod.GET)
    public ResponseEntity<List<Student>> findByNameOrCpfOrEmailContaining(@RequestParam(name = "name") String name,
                                                                          @RequestParam(name = "cpf") String cpf, @RequestParam(name = "email") EmailEntity email) {
        List<Student> student = studentRepository.findByNameIgnoreCaseContainingOrCpfContainingOrEmailIgnoreCaseContaining(name, cpf, email);
        return new ResponseEntity<List<Student>>(student, HttpStatus.OK);
    }


//    @PostMapping("save")
//    @PreAuthorize("hasAuthority('student:write')")
//    public void saveAndFlush(@RequestBody Student student) {
//        System.out.println("MÉTODO : /save : saving student : " + student);
//    }


//    @PostMapping("save")
//    @Transactional(rollbackOn = Exception.class)
//    public String save(@RequestBody Student student) {
//        if (studentRepository.findStudentByName(student.getName()) == null) {
//            studentRepository.save(student);
//            return "Success";
//        } else {
//            return "Username Already Exsist";
//        }
//    }

    //    OK
//    @GetMapping("findAllStudents")
//    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_TRAINEE')")
//    public List<Student> findAllStudents(){
//        System.out.println("MÉTODO : findAllStudents");
//        return STUDENTS;
//    }

    // OK
//    @GetMapping(value = "findAllStudents")
//    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_TRAINEE')")
//    public ResponseEntity<List<Student>> findAllStudents(Pageable pageable) {
//        List<Student> students = studentRepository.findAll();
//        return new ResponseEntity<List<Student>>(students, HttpStatus.OK);
//    }

    //    @DeleteMapping("delete")
//    @PreAuthorize("hasAuthority('student:write')")
//    public ResponseEntity<String> delete(@RequestParam Integer Id) {
//        studentRepository.delete(studentRepository.findById(Id).orElseThrow(() -> new EmptyResultDataAccessException(
//                String.format("No %s entity with id %s exists!", Id), 1)));
//        return new ResponseEntity<String>("Deletado com sucesso", HttpStatus.OK);
//    }

    //    @DeleteMapping(path = "/delete/{studentId}")
//    @PreAuthorize("hasAuthority('student:write')")
//    public void delete_(@PathVariable("studentId") Integer studentId) {
//        System.out.println("MÉTODO : /delete/{studentId}  : deleting student id number : " + studentId);
//    }

//    @DeleteMapping("delete")
//    @PreAuthorize("hasAuthority('student:write')")
//    public Map<String, Boolean> delete(@PathVariable(value = "id") Integer Id) throws ResourceNotFoundException {
//        Student student = studentRepository.findById(Id)
//                .orElseThrow(() -> new ResourceNotFoundException("ATENÇÃO!! CÓDIGO " + Id + " NÃO ENCONTRADO"));
//        studentRepository.delete(student);
//        Map<String, Boolean> response = new HashMap<>();
//        response.put(" CADASTRO EXCLUÍDO: ".concat(student.getName().toString()), Boolean.TRUE);
//        return response;
//    }


}
