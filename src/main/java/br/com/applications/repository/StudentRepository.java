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

@Repository
@Transactional
public interface StudentRepository extends GenericRepository<Student> {


    @Query("select s from STUDENT s")
    List<Student> findAllSorted(Sort sort);

    @Query("select s FROM STUDENT s")
    Page<Student> findAllPage(Pageable pageable);

    @Query("select s from STUDENT s")
    Slice<Student> findAllStudent(Pageable pageable);



    @Query("select s from STUDENT s where s.name = :name")
    Slice<Student> findByStudentCustom(
            @Param("name") String Name, Pageable pageable);

    @Query("select s from STUDENT s where s.name = :name")
    List<Student> findByStudentSorted(
            @Param("name") String Name, Sort sort);

    Student findStudentByName(String name);

    @Query("select s from STUDENT s where s.email = ?1")
    Student findByEmail(EmailEntity emailAddress);

//    @Query("select from ADDRESS a inner join STUDENT_ADDRESS st ON a.id = st.id")
//    Student findStudentByAddressId(Integer id);

    @Modifying
    @Query(value = "DELETE FROM STUDENT s WHERE s.name = :name")
    Integer deleteByName(@Param("name") String name);

    @Query("FROM STUDENT ORDER BY ID ASC")
    List<Student> findAllOrderByIDAsc();

    @Query("FROM STUDENT ORDER BY ID DESC")
    List<Student> findAllOrderByIDDesc();

    @Query("FROM STUDENT ORDER BY NAME ASC")
    List<Student> findAllOrderByNameAsc();

    @Query("FROM STUDENT ORDER BY EMAIL ASC")
    List<Student> findAllOrderByEmailContainingAsc();

    @Query("FROM STUDENT ORDER BY EMAIL DESC")
    List<Student> findAllOrderByEmailContainingDesc();

    @Query("select s from STUDENT s where s.name like ?1%")
    List<Student> findByAndSort(String name, Sort sort);

    @Query("select s from STUDENT s where s.email = ?1 and s.name = ?2")
    List<Student> findByEmailAddressAndName(EmailEntity email, String name);

    @Query("FROM STUDENT ORDER BY NAME DESC")
    List<Student> findAllOrderByNameDesc();

    @Query("FROM STUDENT ORDER BY CPF ASC")
    List<Student> findAllOrderByCpfContainingAsc();

    @Query("FROM STUDENT ORDER BY CPF DESC")
    List<Student> findAllOrderByCpfContainingDesc();

    @Query("FROM STUDENT ORDER BY CPF ASC")
    List<Student> findAllOrderByCpfContainingAsc(Sort sort);

    @Query("FROM STUDENT ORDER BY CPF DESC")
    List<Student> findAllOrderByCpfContainingDesc(Sort sort);

    List<Student> findByCpfContaining(String cpf);

    List<Student> findByEmailIgnoreCaseContaining(String email);

    List<Student> findByNameIgnoreCaseContainingOrCpfContaining(String name, String cpf);


    @Query(value = "select s from STUDENT s where s.name like %?1%")
    List<Student> findByNameIgnoreCaseContaining(String name);

    @Query("select s from STUDENT s where s.name = :name or s.cpf = :cpf")
    Student findByCpfOrNameContaining(@Param("cpf") String lastname, @Param("name") String firstname);

    List<Student> findByNameIgnoreCaseContainingOrCpfContainingOrEmailIgnoreCaseContaining(String name, String cpf, EmailEntity email);

    List<Student> findByProfessionIgnoreCaseContaining(String profession);

}
