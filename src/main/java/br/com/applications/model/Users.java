package br.com.applications.model;//package br.com.applications.disabledmodel;

import br.com.applications.generic.GenericEntity;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.extern.apachecommons.CommonsLog;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.io.Serializable;
import java.time.LocalDateTime;


@Data
@CommonsLog
@NoArgsConstructor
@Entity
@EqualsAndHashCode(callSuper = true)
@NamedQueries({
        @NamedQuery(name = "Users.findAll", query = "SELECT u FROM Users u"),
        @NamedQuery(name = "Users.findByUsername", query = "SELECT u FROM Users u WHERE u.username = :username")})
public class Users extends AbstractEntity<Integer> implements Serializable, GenericEntity<Users> {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = GENERATOR)
    @Column(nullable = false)
    protected Integer Id;

    @Column(length = 60, nullable = false)
    private String name;

    @Column(length = 60, nullable = false, unique = false)
    private String username;

    @NotEmpty
    @JsonIgnore
    @Column(length = 60, nullable = false, unique = false)
    private String password;

    @Column(name = "admin")
    private Boolean admin;

    @Column(nullable = false)
    private Boolean active;

    public boolean isAdmin() {
        return admin;
    }

    private Integer status;

    private LocalDateTime lastLoginDate;

    @OneToOne(cascade=CascadeType.ALL)
    @JoinTable(name="users_profile",
            joinColumns={@JoinColumn(name="users_Id",
                    referencedColumnName="Id")},
                         inverseJoinColumns={@JoinColumn(name="profile_Id",
                                referencedColumnName="Id")})
    private Profile profile;


//    @ElementCollection
//    @CollectionTable(name = "users_phone", joinColumns = @JoinColumn(name = "users_id"))
//
//    @OneToMany(mappedBy = "phone", fetch = FetchType.EAGER , cascade = CascadeType.ALL, orphanRemoval = true)
//    private List<Phone> phone;

    public Users(String name, String username, String password, Boolean admin, Boolean active, Integer status) {
        this.name = name;
        this.username = username;
        this.password = password;
        this.admin = admin;
        this.active = active;
        this.status = status;
    }

    @Override
    public void update(Users source) {

    }

    public Integer findById() {
        return null;
    }

    @Override
    public Users createNewInstance() {
        return null;
    }
}
