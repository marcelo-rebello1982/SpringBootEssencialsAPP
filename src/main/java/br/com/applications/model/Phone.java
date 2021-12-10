package br.com.applications.model;

import br.com.applications.enumeration.TelephoneType;
import com.sun.istack.NotNull;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.io.Serializable;

@RequiredArgsConstructor
@Getter
@Setter
@Entity(name = "PHONE")
@NamedQueries({
        @NamedQuery(name = "phone.findAll", query = "SELECT p FROM PHONE p"),
        @NamedQuery(name = "phone.findNameByID", query = "SELECT p FROM PHONE p WHERE p.id = :student_id")})
public class Phone extends AbstractEntity<Integer> implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = GENERATOR)
    protected Integer Id;

    @Column(length = 3, nullable = false, unique = false)
    private Integer codeArea;

    @NotNull
    //@Pattern(regexp = "(\\(?\\d{2}\\)?\\s)?(\\d{4,5}\\-\\d{4})",
    //        message = "Number should be in format: {+55 1234567890, +911234567890, 1234567890}")
    @Column(length = 20, nullable = true, unique = false)
    private String number;

    @Column(length = 50, nullable = true, unique = false)
    private String operator;

    @Enumerated(EnumType.STRING)
    private TelephoneType telephoneTypes;

    @ManyToOne
    @JoinColumn(name = "student_Id", referencedColumnName = "Id")
    @OnDelete(action = OnDeleteAction.CASCADE)
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
