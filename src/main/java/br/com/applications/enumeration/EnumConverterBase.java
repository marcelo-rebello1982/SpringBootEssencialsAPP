package br.com.applications.interfaces;

import javax.persistence.AttributeConverter;
import java.io.Serializable;

public abstract class EnumConverterBase<E extends EnumModel, T extends Serializable> implements AttributeConverter<E, T> {

    private Class<E> ennum;
    public EnumConverterBase(Class<E> ennum){
        this.ennum = ennum;
    }
    @Override
    public T convertToDatabaseColumn(E e) {
        return (T) e.getCodigo();
    }

    @Override
    public E convertToEntityAttribute(T t) {
        return (E) getEnum(t);
    }

    private EnumModel getEnum(T codigo) {
        for(EnumModel sexo: recuperaEnumValues()){
            if(sexo.getCodigo().equals(codigo)){
                return sexo;
            }
        }
        return null;
    }

    protected abstract EnumModel[] recuperaEnumValues();

}