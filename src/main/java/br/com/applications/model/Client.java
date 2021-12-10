package br.com.applications.model;//package br.com.applications.disabledmodel;


import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.br.CPF;

import javax.persistence.*;
import javax.validation.constraints.Email;
import java.io.Serializable;

@Entity
@RequiredArgsConstructor
@Getter @Setter
@Table(uniqueConstraints = {@UniqueConstraint(columnNames = "cpf")})
public class Client  extends AbstractEntity<Integer> implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = GENERATOR)
    protected Integer Id;

    @NotBlank(message = "Name is required")
    private String name;

    @Email(message = "Invalid e-mail")
    @Column(unique = true, nullable = false)
    private String email;

    @CPF(message = "Invalid CPF")
    @Column(unique = true, nullable = false)
    private String cpf;

    @NotBlank(message = "Birthday is required")
    private String birthday;

}