package br.com.applications.enumeration;


import com.google.common.collect.Sets;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import java.util.Set;
import java.util.stream.Collectors;

import static br.com.applications.enumeration.ApplicationUserPermissions.*;

public enum ApplicationUserRoles {

    STUDENT(Sets.newHashSet()),
    ADMIN(Sets.newHashSet(COURSE_READ, COURSE_WRITE, STUDENT_READ, STUDENT_WRITE)),
    TRAINEE(Sets.newHashSet(COURSE_READ, STUDENT_READ));


    private final Set<ApplicationUserPermissions> permissions;

    ApplicationUserRoles(Set<ApplicationUserPermissions> permissions) {
        this.permissions = permissions;
    }

    public Set<ApplicationUserPermissions> getPermissions() {
        return permissions;
    }

    public Set<SimpleGrantedAuthority> getGrantedAuthorities() {
        Set<SimpleGrantedAuthority> permissions = getPermissions()
                .stream()
                .map(permission -> new SimpleGrantedAuthority(permission
                        .getPermission()))
                .collect(Collectors
                        .toSet());
        permissions
                .add(new SimpleGrantedAuthority("ROLE_" + this
                        .name()));
        return permissions;
    }
}
