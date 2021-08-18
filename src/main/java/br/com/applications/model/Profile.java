package br.com.applications.model;//package br.com.applications.disabledmodel;

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
@Entity
@EqualsAndHashCode(callSuper = true)
public class Profile extends AbstractEntity<Integer> implements Serializable {

    @Id
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
