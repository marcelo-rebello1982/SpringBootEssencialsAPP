//package br.com.applications.model;
//
//import lombok.Getter;
//import lombok.Setter;
//
//import javax.persistence.*;
//import java.io.Serializable;
//import java.util.HashSet;
//import java.util.Set;
//
//@Entity
//@Table(name = "tb_product")
//@Getter
//@Setter
//public class Product implements Serializable {
//    private static final long serialVersionUID = 1L;
//
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private Long id;
//    private String name;
//    private String description;
//    private Double price;
//    private String imgUrl;
//
//    @ManyToMany
//    @JoinTable(name = "tb_product_category", joinColumns = @JoinColumn(name = "product_id"), inverseJoinColumns = @JoinColumn(name = "category_id"))
//    private Set<Category> categories = new HashSet<>();
//
//    @OneToMany(mappedBy = "id.product")
//    private Set<OrdemItem> items = new HashSet<>();
//    public Product() {
//
//    }
//
//    public Product(Long id, String name, String description, Double price, String imgUrl) {
//        super();
//        this.id = id;
//        this.name = name;
//        this.description = description;
//        this.price = price;
//        this.imgUrl = imgUrl;
//    }
//}