package br.com.applications.enumeration;

import lombok.Getter;

@Getter
public enum Sexo {

    F("Fem"),
    M("Masc");

    private final String descricao;

    Sexo(String descricao) {
        this.descricao = descricao;
    }

}