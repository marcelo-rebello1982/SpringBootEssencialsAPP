package br.com.applications.enumeration;

import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.PostLoad;
import javax.persistence.PrePersist;
import java.util.stream.Stream;


public enum StatusType {

    APROVED(1), REPROVED(1);

    private int types;

    @Enumerated(EnumType.STRING)
    private AddressType addressType;

    StatusType(int types) {
        this.types = types;
    }

    public int getTypes() {
        return types;
    }

    public static AddressType of(int types) {
        return Stream.of(AddressType.values()).filter(a ->
                a.getTypes() == types).findFirst()
                .orElseThrow(IllegalArgumentException::new);
    }

    @PostLoad
    void populateTypesAttrAfterLoad() {
        if (types > 0) {
            this.addressType = AddressType.of(types);
        }
    }

    @PrePersist
    void populateTypesAttrBeforePersist() {
        if (addressType != null) {
            this.types = addressType.getTypes();
        }
    }

}
