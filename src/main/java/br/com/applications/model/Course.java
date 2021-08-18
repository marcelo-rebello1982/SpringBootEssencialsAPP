//package br.com.applications.model;
//
//import com.fasterxml.jackson.annotation.JsonIgnore;
//import lombok.EqualsAndHashCode;
//import lombok.Getter;
//import lombok.NoArgsConstructor;
//import lombok.Setter;
//import lombok.extern.apachecommons.CommonsLog;
//
//import javax.persistence.*;
//import java.io.Serializable;
//import java.util.Set;
//
//@Getter
//@Setter
//@Entity
//@CommonsLog
//@NoArgsConstructor
//@EqualsAndHashCode(callSuper = true)
//public class Course extends AbstractEntity<Integer> implements Serializable {
//
//
//    @Id
//    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = GENERATOR)
//    @Column(name = "course_id", nullable = false)
//    protected Integer Id;
//
//    private String course;
//
// //   @ManyToMany(mappedBy = "courses")
// //   @JsonIgnore
// //   private Set<Student> studentSet;
//}
