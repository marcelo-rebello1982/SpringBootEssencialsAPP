package br.com.applications.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;
import java.io.Serializable;

@RequiredArgsConstructor
@Entity
@Getter @Setter
public class EmailEntity extends AbstractEntity<Integer> implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = GENERATOR)
    protected Integer Id;

    @Email(regexp = "^[\\w!#$%&'*+/=?`{|}~^-]+(?:\\.[\\w!#$%&'*+/=?`{|}~^-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,6}$",
            flags = Pattern.Flag.CASE_INSENSITIVE)
    @Column(nullable = true)
    private String email;

    @ManyToOne
    @JoinColumn(name = "student_Id", referencedColumnName = "Id")
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Student student;

    public EmailEntity(String email) {
        this.email = email;
    }
}