package br.com.applications.controller;

import br.com.applications.errors.ResourceNotFoundException;
import br.com.applications.generic.GenericController;
import br.com.applications.model.EmailEntity;
import br.com.applications.model.Student;
import br.com.applications.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;
import javax.validation.Valid;
import java.time.LocalDate;
import java.time.Period;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

//https://auth0.com/blog/automatically-mapping-dto-to-entity-on-spring-boot-apis/

@RestController
@RequestMapping("api/v1/students")
public class StudentManagementController extends GenericController<Student> {

    @Autowired
    public StudentRepository studentRepository;

    public StudentManagementController(StudentRepository studentRepository) {
        super(studentRepository);
    }

    @RequestMapping(value = "/findById/{id}", method = RequestMethod.GET)
    public ResponseEntity<Student> findById(@PathVariable(value = "id") Integer id) {
        Optional<Student> student = studentRepository.findById(id);
        return student.map(value -> new ResponseEntity<>(value, HttpStatus.OK))
                .orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }


    @GetMapping(value = "/findAllStudents")
    public ResponseEntity<List<Student>> findAllStudents(Pageable pageable) {
        List<Student> students = studentRepository.findAll();
        return new ResponseEntity<List<Student>>(students, HttpStatus.OK);
    }

    @GetMapping(value = "/findByName")
    public ResponseEntity<List<Student>> findByName(@RequestParam(name = "name") String name) {
        try {
            List<Student> students = studentRepository.findByNameReturnList(name);
            if (students == null)
                students.addAll(studentRepository.findAll());
            else
                students.addAll(studentRepository.findByNameContaining(name));
            if (students.isEmpty()) {
                return new ResponseEntity<>(HttpStatus.NO_CONTENT);
            }
            return new ResponseEntity<>(students, HttpStatus.OK);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/save")
    @Transactional(rollbackOn = Exception.class)
    public ResponseEntity<Student> saveAndFlush(@Valid @RequestBody Student student) {
        Optional<Student> newStudent = Optional.ofNullable(studentRepository.findByName(student.getName()));
        return newStudent.map(value -> new ResponseEntity<>(value, HttpStatus.FOUND)).orElseGet(()
                -> new ResponseEntity<Student>(studentRepository.save(student), HttpStatus.CREATED));
    }

    @RequestMapping(method = RequestMethod.PUT, value = "/update")
    public ResponseEntity<Student> update(@RequestBody Student student) {
        if (studentRepository.existsById(student.getId())) {
            studentRepository.save(student);
            return ResponseEntity.status(HttpStatus.ACCEPTED).body(student);
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(student);
        }
    }


//    @PutMapping("/update/{id}")
//    public ResponseEntity<Student> update(@PathVariable("Id") Student targetStudent, @RequestBody Student sourceStudent) {
//        BeanUtils.copyProperties(sourceStudent, targetStudent, "Id");
//        return ResponseEntity.ok(studentRepository.save(targetStudent));
//    }

    @DeleteMapping("/delete/{id}")
    public Map<String, Boolean> delete(@PathVariable(value = "id") Integer Id)
            throws ResourceNotFoundException {
        Student student = studentRepository.findById(Id)
                .orElseThrow(() -> new ResourceNotFoundException("ATENÇÃO!! CÓDIGO " + Id + " NÃO ENCONTRADO"));
        studentRepository.delete(student);
        Map<String, Boolean> response = new HashMap<>();
        response.put(" CADASTRO ".concat(student.getName()) + " EXCLUÍDO.", Boolean.TRUE);
        return response;
    }

//    @DeleteMapping("/{repository}/{id}")
//    public ResponseEntity delete(@PathVariable String repository, @PathVariable Long id) {
//        return mappingManager.getJpaRepository(repository).map(repo -> {
//                    repo.deleteById(id);
//                    return ResponseEntity.noContent().build();
//                }).
//                orElseGet(() -> ResponseEntity.notFound().build());
//    }


    // https://dzone.com/articles/java-11-http-client-api-to-consume-restful-web-ser-1


    public int sumContactsAgesUsingReduce(List<Student> students) {
        return students.stream()
                .map(student -> Period.between(student.getDateOfBirth(), LocalDate.now()).getYears())
                .reduce(0, (contactAge, otherContactAge) -> contactAge + otherContactAge);
    }


    @RequestMapping(value = "/findByNameOrCpf", method = RequestMethod.GET)
    public ResponseEntity<List<Student>> findByNameOrCpf(@RequestParam(name = "name") String
                                                                 name, @RequestParam(name = "cpf") String cpf) {
        List<Student> student = studentRepository.findByNameOrCpf(name, cpf);
        return new ResponseEntity<List<Student>>(student, HttpStatus.OK);
    }

    @RequestMapping(value = "/findByNameOrCpfOrEmail", method = RequestMethod.GET)
    public ResponseEntity<List<Student>> findByNameOrCpfOrEmail
            (@RequestParam(name = "name", required = false) String name,
             @RequestParam(name = "cpf", required = false) String
                     cpf, @RequestParam(name = "email", required = false) EmailEntity email) {
        List<Student> student = studentRepository.findByNameOrCpfOrEmail(name, cpf, email);
        return new ResponseEntity<List<Student>>(student, HttpStatus.OK);
    }

    @RequestMapping(value = "/findByProfession", method = RequestMethod.GET)
    public ResponseEntity<List<Student>> findByProfession(@RequestParam(name = "profession") String profession) {
        List<Student> student = studentRepository.findByProfession(profession);
        return new ResponseEntity<List<Student>>(student, HttpStatus.OK);
    }

    //    @GetMapping(value = "/findAllStudents")
//    public ResponseEntity<?> findAll(Pageable pageable) {
//        return new ResponseEntity<>(studentRepository.findAll(pageable), HttpStatus.OK);
//    }


//    @PutMapping(path = "/update")
//    @PreAuthorize("hasAuthority('student:write')")
//    public void update(@PathVariable("studentId") Integer studentId, @RequestBody Student student) {
//        student.setId(100);
//        System.out.println("MÉTODO : update/{studentId} " + String.format("%s %s", studentId, student.getId()));
//    }

    // https://github.com/gilsonsilvati/controle-ponto-api/blob/main/src/main/java/com/controleponto/api/domain/service/FuncionarioService.java
//    public Funcionario salvar(FuncionarioModelInput funcionarioModelInput) {
//        Optional<Funcionario> funcionarioExistente = buscarPorEmailOuCpf(funcionarioModelInput.getEmail(), funcionarioModelInput.getCpf());
//
//        if (funcionarioExistente.isPresent())
//            throw new NegocioException("Já existe um funcionário cadastrado com este e-mail ou cpf.");
//
//        Funcionario funcionario = toEntity(funcionarioModelInput);
//        funcionario = funcionarios.save(funcionario);
//
//        return funcionario;
//    }


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


//    @PostMapping("save")
//    @PreAuthorize("hasAuthority('student:write')")
//    public void saveAndFlush(@RequestBody Student student) {
//        System.out.println("MÉTODO : /save : saving student : " + student);
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


    //    @DeleteMapping(path = "/delete/{studentId}")
//    @PreAuthorize("hasAuthority('student:write')")
//    public void delete_(@PathVariable("studentId") Integer studentId) {
//        System.out.println("MÉTODO : /delete/{studentId}  : deleting student id number : " + studentId);
//    }

}
