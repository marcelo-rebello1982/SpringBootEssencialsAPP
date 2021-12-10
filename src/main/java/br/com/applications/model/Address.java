package br.com.applications.model;

import br.com.applications.enumeration.AddressType;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import java.io.Serializable;


@Entity
@RequiredArgsConstructor
@Getter
@Setter
public class Address extends AbstractEntity<Integer> implements Serializable {
    // extends AbstractEntity<Integer> implements Serializable, GenericEntity<Address>

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = GENERATOR)
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
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Student student;


    public Address(String streetAddress, String city, String district, String state, String zipCode, AddressType addressType) {
        this.streetAddress = streetAddress;
        this.city = city;
        this.district = district;
        this.state = state;
        this.zipCode = zipCode;
        this.addressType = addressType;
    }

    public Address(String streetAddress, String complement, String city, String district, String state, String zipCode, AddressType addressType) {
        this.streetAddress = streetAddress;
        this.complement = complement;
        this.city = city;
        this.district = district;
        this.state = state;
        this.zipCode = zipCode;
        this.addressType = addressType;
    }
}