package br.com.applications.model;

import br.com.applications.enumeration.GenderType;
import br.com.applications.enumeration.StatusType;
import br.com.applications.generic.GenericEntity;
import br.com.applications.interfaces.EnumEstados;
import br.com.applications.interfaces.EnumEstadosConverter;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.apachecommons.CommonsLog;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;


@Data
@CommonsLog
@Entity(name = "STUDENT")
@Table()
@NoArgsConstructor
@AllArgsConstructor
@NamedQueries({
        @NamedQuery(name = "s.findAll", query = "SELECT s FROM STUDENT s"),
        @NamedQuery(name = "s.findByName", query = "SELECT s FROM STUDENT s WHERE s.name = :name")})
public class Student extends AbstractEntity<Integer> implements GenericEntity<Student> {


    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = GENERATOR)
    @Column(name = "student_id", nullable = false)
    protected Integer Id;

    //  @Min(value = 18 , message = "Age should note be less than 18")
    //  @Max(value = 150)
    //  private int age;

    @Column(length = 50, nullable = false, unique = false)
    private String name;

    @Column(length = 14, nullable = true, unique = true)
    private String cpf;

    @javax.validation.constraints.Email
    @Column(length = 60)
    private String email;

    @Column(length = 60)
    private String profession;

    @Temporal(TemporalType.DATE)
    @Column(name = "dateOfBirth")
    private Calendar dateOfBirth;

    @Enumerated(EnumType.STRING)
    private GenderType genderType;

    @Enumerated(EnumType.STRING)
    private StatusType statusType;

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

    @OneToMany(mappedBy = "student", fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
    @Column(name = "PHONES")
    private List<Phone> phonesList = new ArrayList<>();

    @OneToMany(mappedBy = "student", fetch = FetchType.EAGER, cascade = CascadeType.ALL, orphanRemoval = true)
    @Column(name = "ADDRESS")
    private List<Phone> addressList = new ArrayList<>();

//    @Enumerated
//    @Convert(converter = EnumEstadosConverter.class)
//    private EnumEstados uf;

    public Student(String name, String email) {
        this.name = name;
        this.email = email;
    }

    public Student(Integer id, String name, String cpf, String email, String profession) {
        Id = id;
        this.name = name;
        this.cpf = cpf;
        this.email = email;
        this.profession = profession;
    }


    public Student(String name, String cpf, String email, String profession) {
        this.name = name;
        this.cpf = cpf;
        this.email = email;
        this.profession = profession;
    }


    public Student(String name, String cpf, String email, String profession, Phone phone) {
        this.name = name;
        this.cpf = cpf;
        this.email = email;
        this.profession = profession;
        this.phone = phone;
    }

    public Student(String name, String cpf, String email, String profession, GenderType gender) {
        this.name = name;
        this.cpf = cpf;
        this.email = email;
        this.profession = profession;
        this.genderType = gender;
    }

    //  LocalDate.of(1995, Month.MARCH, 14)


    public Student(String name, String cpf, String email, String profession, GenderType gender, Phone phone, Address address) {
        this.name = name;
        this.cpf = cpf;
        this.email = email;
        this.profession = profession;
        this.genderType = gender;
        this.phone = phone;
        this.address = address;
    }

    public Student(String name, String cpf, String email, String profession, Calendar dateOfBirth, GenderType genderType, Phone phone, Address address) {
        this.name = name;
        this.cpf = cpf;
        this.email = email;
        this.profession = profession;
        this.dateOfBirth = dateOfBirth;
        this.genderType = genderType;
        this.phone = phone;
        this.address = address;
    }

    public Student(String name, String cpf, String email, String profession, GenderType gender, Phone phone) {
        this.name = name;
        this.cpf = cpf;
        this.email = email;
        this.profession = profession;
        this.genderType = gender;
        this.phone = phone;
    }

    @Override
    public void update(Student source) {
    }

    @Override
    public Integer getId() {
        return null;
    }

    @Override
    public Student createNewInstance() {
        return null;
    }
}
