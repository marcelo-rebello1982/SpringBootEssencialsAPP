package br.com.applications.enumeration;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.PostLoad;
import javax.persistence.PrePersist;
import java.util.stream.Stream;


public enum StudentType {

    GRADUADO(1), PROSGRADUATO(2), MESTRADO(3), DOUTORADO(4);

    private int types;

    @Enumerated(EnumType.STRING)
    private StudentType studentTypes;

    StudentType(int types) {
        this.types = types;
    }

    public int getTypes() {
        return types;
    }

    public static StudentType of(int types) {
        return Stream.of(StudentType.values()).filter(s ->
                s.getTypes() == types).findFirst()
                .orElseThrow(IllegalArgumentException::new);
    }

    @PostLoad
    void populateTypesAttrAfterLoad() {
        if (types > 0) {
            this.studentTypes = StudentType.of(types);
        }
    }

    @PrePersist
    void populateTypesAttrBeforePersist() {
        if (studentTypes != null) {
            this.types = studentTypes.getTypes();
        }
    }
}
