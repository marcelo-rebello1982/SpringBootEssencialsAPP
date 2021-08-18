package br.com.applications.model;

import br.com.applications.enumeration.AddressType;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.extern.apachecommons.CommonsLog;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;


@Data
@CommonsLog
@NoArgsConstructor
@Entity(name = "ADDRESS")
@EqualsAndHashCode(callSuper = true)
public class Address extends AbstractEntity<Integer> implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = GENERATOR)
    @Column(nullable = false)
    protected Integer Id;

    @Column(length = 60, nullable = false, unique = false)
    private String streetAddress;

    @Column(length = 60, nullable = true, unique = false)
    private String complement;

    @Column(length = 50, nullable = false, unique = false)
    private String city;

    @Column(length = 30, nullable = false, unique = false)
    private String district;

    @Column(length = 2, nullable = false, unique = false)
    private String state;

    @Column(length = 8, nullable = false, unique = false)
    private String zipCode;

    @Enumerated(EnumType.STRING)
    private AddressType addressType;

    @ManyToOne
    @JoinColumn(name = "student_Id", referencedColumnName = "Id")
    private Student student;


    public Address(String streetAddress, String city, String district, String state, String zipCode, AddressType addressType) {
        this.streetAddress = streetAddress;
        this.city = city;
        this.district = district;
        this.state = state;
        this.zipCode = zipCode;
        this.addressType = addressType;
    }

    public Address(String streetAddress,  String complement,  String city, String district,String state, String zipCode, AddressType addressType) {
        this.streetAddress = streetAddress;
        this.complement = complement;
        this.city = city;
        this.district = district;
        this.state = state;
        this.zipCode = zipCode;
        this.addressType = addressType;
    }
}