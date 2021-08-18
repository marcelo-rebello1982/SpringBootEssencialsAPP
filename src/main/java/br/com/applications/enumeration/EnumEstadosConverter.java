package br.com.applications.interfaces;

import javax.persistence.Converter;

@Converter
public class EnumEstadosConverter extends EnumConverterBase<EnumEstados, String> {
    public EnumEstadosConverter(){
        super(EnumEstados.class);
    }

    @Override
    protected EnumEstados[] recuperaEnumValues() {
        return EnumEstados.values();
    }
}