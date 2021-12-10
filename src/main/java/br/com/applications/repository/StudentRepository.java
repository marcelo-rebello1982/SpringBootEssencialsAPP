package br.com.applications.repository;

import br.com.applications.generic.GenericRepository;
import br.com.applications.model.EmailEntity;
import br.com.applications.model.Student;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Repository
@Transactional
public interface StudentRepository extends GenericRepository<Student> {


    @Query("select s from student s")
    List<Student> findAllSorted(Sort sort);

    @Query("select s FROM student s")
    Page<Student> findAllPage(Pageable pageable);

    @Query("select s from student s")
    Slice<Student> findAllStudent(Pageable pageable);

    @Query("select s from student s where s.name = :name")
    Slice<Student> findByStudentCustom(
            @Param("name") String Name, Pageable pageable);

    @Query("select s from student s where s.name = :name")
    List<Student> findByStudentSorted(
            @Param("name") String Name, Sort sort);

    @Query("select s from student s where s.name = :name")
    Student findByName(@Param("name") String name);

    @Query("select s from student s where s.name like %?1%")
    List<Student> findByNameContaining(String name);


    @Query("select s from student s where upper(s.name) like upper(concat('%', ?1, '%'))")
    List<Student> findByNameReturnList(String name);

    @Query("select s from student s where s.emailEntity = ?1")
    Student findByEmailEntity(EmailEntity emailAddress);

//    @Query("select from ADDRESS a inner join STUDENT_ADDRESS st ON a.id = st.id")
//    Student findStudentByAddressId(Integer id);

    @Modifying
    @Query(value = "DELETE FROM student s WHERE s.name = :name")
    Integer deleteByName(@Param("name") String name);

    @Query("FROM student ORDER BY ID ASC")
    List<Student> findAllOrderByIDAsc();

    @Query("FROM student ORDER BY ID DESC")
    List<Student> findAllOrderByIDDesc();

    @Query("FROM student ORDER BY NAME ASC")
    List<Student> findAllOrderByNameAsc();

    //@Query("FROM student ORDER BY EMAIL ASC")

    @Query("select s from student s where s.emailEntity like %?1%")
    List<Student> findAllByEmailContaining();

    @Query("select s from student s where s.name like ?1%")
    List<Student> findByAndSort(String name, Sort sort);

    @Query("select s from student s where s.emailEntity = :email and s.name = :name")
    List<Student> findByEmailAndName(@Param("email") EmailEntity email, @Param("name") String name);

    @Query("FROM student ORDER BY NAME DESC")
    List<Student> findAllOrderByNameDesc();

    @Query("FROM student ORDER BY CPF ASC")
    List<Student> findAllOrderByCpfContainingAsc();

    @Query("FROM student ORDER BY CPF DESC")
    List<Student> findAllOrderByCpfContainingDesc();

    @Query("FROM student ORDER BY CPF ASC")
    List<Student> findAllOrderByCpfContainingAsc(Sort sort);

    @Query("FROM student ORDER BY CPF DESC")
    List<Student> findAllOrderByCpfContainingDesc(Sort sort);

    List<Student> findByCpfContaining(String cpf);

 //   List<Student> findByEmailIgnoreCaseContaining(String email);

    @Query("select s from student s where upper(s.name) like upper(concat('%', ?1, '%')) or s.cpf like %?2%")
    List<Student> findByNameOrCpf(String name, String cpf);


    @Query("select s from student s where s.cpf = :cpf or upper(s.name) like upper(concat('%', :name, '%'))")
    Student findByCpfOrName(@Param("cpf") String lastname, @Param("name") String firstname);

    @Query("select s from student s where s.name = ?1 or s.cpf = ?2 or s.emailEntity = ?3")
    List<Student> findByNameOrCpfOrEmail(String name, String cpf, EmailEntity email);

    @Query("select s from student s where upper(s.profession) like upper(concat('%', ?1, '%'))")
    List<Student> findByProfession(String profession);

    @Query("select s from student s where s.cpf = ?1")
    Optional<Student> findByCpf(String cpf);

    @Query("select s from student s where s.emailEntity = ?1")
    Optional<Student> findByEmail(String email);
}
