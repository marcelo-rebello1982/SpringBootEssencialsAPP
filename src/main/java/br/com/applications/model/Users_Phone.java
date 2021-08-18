package br.com.applications.model;


import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.extern.apachecommons.CommonsLog;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import java.io.Serializable;

@Data
@CommonsLog
@NoArgsConstructor
@Entity
@EqualsAndHashCode(callSuper = true)
public class Users_Phone extends AbstractEntity<Integer> implements Serializable {


    @javax.persistence.Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = GENERATOR)
    @Column(name = "student_id", nullable = false)
    protected Integer Id;

}
