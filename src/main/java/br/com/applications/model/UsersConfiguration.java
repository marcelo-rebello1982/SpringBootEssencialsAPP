package br.com.applications.model;

import br.com.applications.generic.GenericEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.extern.apachecommons.CommonsLog;

import javax.persistence.*;
import java.io.Serializable;

@Data
@CommonsLog
@NoArgsConstructor
@Entity(name = "USERCONFIGURATION")
@EqualsAndHashCode(callSuper = true)
public class UsersConfiguration extends AbstractEntity<Integer> implements Serializable, GenericEntity<UsersConfiguration> {

    @javax.persistence.Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = GENERATOR)
    @Column(nullable = false)
    protected Integer Id;

    @MapsId
    @OneToOne
    private Users users;

    private boolean sendNotification;

    private boolean endAutomaticSession;


    @Override
    public void update(UsersConfiguration source) {

    }

    @Override
    public String getName() {
        return null;
    }

    @Override
    public UsersConfiguration createNewInstance() {
        return null;
    }
}
