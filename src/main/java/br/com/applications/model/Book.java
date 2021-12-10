package br.com.applications.model;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;


@Entity
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Book extends AbstractEntity<Integer> implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = GENERATOR)
    protected Integer Id;

    @Column(nullable = false, unique = true)
    private String name;

    @Column(nullable = false)
    private  Integer pages;

    @Column(nullable = false)
    private Integer chapters;

    @Column(nullable = false)
    private String isbn;

    @Column(name = "publisher_name", nullable = false, unique = true)
    private String publisherName;

    @ManyToOne(fetch = FetchType.LAZY, cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REMOVE })
    private Student  student;

}