package br.com.applications.enumeration;


import lombok.Getter;

@Getter
public enum GenderType {

    F("Fem"),
    M("Masc");

    private final String description;

    GenderType(String description) {
        this.description = description;
    }
}