package br.com.applications.model;

import br.com.applications.model.AbstractEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.extern.apachecommons.CommonsLog;

import javax.persistence.*;
import javax.validation.constraints.Email;

@Data
@CommonsLog
@NoArgsConstructor
@Entity
@EqualsAndHashCode(callSuper = true)
public class EmailEntity extends AbstractEntity<Integer> {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = GENERATOR)
    @Column(nullable = false)
    protected Integer Id;

    @Email
    private String email;

    @ManyToOne
    @JoinColumn(name="student_id")
    private Student student;

}