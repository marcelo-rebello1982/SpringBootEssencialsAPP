package br.com.applications.model;//package br.com.applications.disabledmodel;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@RequiredArgsConstructor
@Getter
@Setter
public class Profile extends AbstractEntity<Integer> implements Serializable {

    @Id
    @EqualsAndHashCode.Include
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = GENERATOR)
    protected Integer Id;

    private String profileName;

    @OneToMany(cascade = CascadeType.ALL)
    @JoinTable(name="users_profile",
    joinColumns = {@JoinColumn(name="profile_Id",
            referencedColumnName = "Id")},
                inverseJoinColumns = {@JoinColumn(name="users_Id",
                    referencedColumnName = "Id")})
    private List<Users> usersProfile;

}
