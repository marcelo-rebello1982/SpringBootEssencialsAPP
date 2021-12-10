package br.com.applications.model;

import br.com.applications.enumeration.GenderType;
import br.com.applications.enumeration.StatusType;
import br.com.applications.generic.GenericEntity;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@Entity(name = "student")
@RequiredArgsConstructor
@Table(name = "student", uniqueConstraints = {@UniqueConstraint(name = "unq_cpf", columnNames = {"cpf"})},
        indexes = {@Index(name = "idx_name", columnList = "name"), @Index(name = "idx_cpf", columnList = "cpf")})
@NamedQueries({
        @NamedQuery(name = "s.findAll", query = "SELECT s FROM student s"),
        @NamedQuery(name = "s.findByName", query = "SELECT s FROM student s WHERE s.name = :name")})
public class Student extends AbstractEntity<Integer> implements Serializable, GenericEntity<Student> {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = GENERATOR)
    protected Integer Id;

    @Column(length = 50, nullable = false, unique = false)
    private String name;

    @Column(length = 14, nullable = true, unique = true)
    private String cpf;

    @Min(value = 16, message = "cadastro para menor de 10 anos não permitido.")
    @Max(value = 150)
    private int age;

    @Column(length = 60)
    private String profession;

    @JsonFormat(pattern = "dd-MM-yyyy")
    @Column(name = "dateOfBirth")
    private LocalDate dateOfBirth;

    @Column(length = 30, nullable = true)
    @Enumerated(EnumType.STRING)
    private GenderType genderType;

    @Enumerated(EnumType.STRING)
    private StatusType statusType;

//    @OneToMany(mappedBy = "student", fetch = FetchType.LAZY)
//    private Set<Book> books = new HashSet<>();

    @OneToOne(cascade = CascadeType.ALL)
    @JoinTable(name = "student_phone", joinColumns = {@JoinColumn(name = "student_Id",
            referencedColumnName = "Id")}, inverseJoinColumns = {@JoinColumn(name = "phone_Id",
            referencedColumnName = "Id")})
    private Phone phone;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinTable(name = "student_address", joinColumns = {@JoinColumn(name = "student_Id",
            referencedColumnName = "Id")}, inverseJoinColumns = {@JoinColumn(name = "address_Id",
            referencedColumnName = "Id")})
    private Address address;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinTable(name = "student_email", joinColumns = {@JoinColumn(name = "student_Id",
            referencedColumnName = "Id")}, inverseJoinColumns = {@JoinColumn(name = "emaill_Id",
            referencedColumnName = "Id")})
    private EmailEntity emailEntity;

    @OneToMany(mappedBy = "student", fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    @Column(name = "PHONES")
    private List<Phone> phonesList = new ArrayList<>();

    @OneToMany(mappedBy = "student", fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true)
    @Column(name = "ADDRESS")
    private List<Address> addressList = new ArrayList<>();

//    @ManyToMany
//    @JoinTable(name = "student_course", joinColumns = {@JoinColumn(name = "student_Id",
//            referencedColumnName = "Id")}, inverseJoinColumns = {@JoinColumn(name = "courses_course_Id",
//            referencedColumnName = "Id")})
//    private List<Course> courses;


    public Student(Integer id, String name, String cpf, String profession) {
        Id = id;
        this.name = name;
        this.cpf = cpf;

        this.profession = profession;
    }

    public Student(String name, String cpf, EmailEntity emailEntity, String profession) {
        this.name = name;
        this.cpf = cpf;
        this.profession = profession;
        this.emailEntity = emailEntity;
    }


    public Student(String name, String cpf, EmailEntity email, String profession, GenderType gender, Phone phone, Address address) {
        this.name = name;
        this.cpf = cpf;
        this.emailEntity = email;
        this.profession = profession;
        this.genderType = gender;
        this.phone = phone;
        this.address = address;
    }

    public Student(String name, String cpf, EmailEntity email, String profession, LocalDate dateOfBirth, GenderType genderType, Phone phone, Address address) {
        this.name = name;
        this.cpf = cpf;
        this.emailEntity = email;
        this.profession = profession;
        this.dateOfBirth = dateOfBirth;
        this.genderType = genderType;
        this.phone = phone;
        this.address = address;
    }

    public Student(String name, String cpf, EmailEntity email, String profession, GenderType gender, Phone phone) {
        this.name = name;
        this.cpf = cpf;
        this.emailEntity = email;
        this.profession = profession;
        this.genderType = gender;
        this.phone = phone;
    }


    @Override
    public void update(Student source) {

    }

    @Override
    public Student createNewInstance() {
        return null;
    }
}
