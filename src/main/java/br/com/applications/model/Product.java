package br.com.applications.model;//package br.com.applications.model;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;

@Entity
@RequiredArgsConstructor
@Getter @Setter
public class Product extends AbstractEntity<Integer> implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = GENERATOR)
    protected Integer Id;

    private String name;
    private String description;
    private Double price;
    private String imgUrl;

}