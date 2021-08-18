package br.com.applications.model;

import br.com.applications.enumeration.TelephoneType;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.extern.apachecommons.CommonsLog;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Data
@CommonsLog
@NoArgsConstructor
@Entity(name = "PHONE")
@EqualsAndHashCode(callSuper = true)
@NamedQueries({
        @NamedQuery(name = "phone.findAll", query = "SELECT p FROM PHONE p"),
        @NamedQuery(name = "phone.findNameByID", query = "SELECT p FROM PHONE p WHERE p.id = :student_id")})
public class Phone extends AbstractEntity<Integer> implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = GENERATOR)
    @Column(nullable = false)
    protected Integer Id;

    @Column(length = 3, nullable = false, unique = false)
    private Integer codeArea;

    @Column(nullable = false, unique = false, length = 50)
    private String number;

    @Column(length = 50, nullable = true, unique = false)
    private String operator;

    @Enumerated(EnumType.STRING)
    private TelephoneType telephoneTypes;

    @ManyToOne
    @JoinColumn(name = "student_Id", referencedColumnName = "Id")
    private Student student;



    public Phone(Integer codeArea, String number, TelephoneType telephoneTypes) {
        this.codeArea = codeArea;
        this.number = number;
        this.telephoneTypes = telephoneTypes;
    }

    public Phone(Integer codeArea, String number, String operator, TelephoneType telephoneTypes) {
        this.codeArea = codeArea;
        this.number = number;
        this.operator = operator;
        this.telephoneTypes = telephoneTypes;
    }
}
