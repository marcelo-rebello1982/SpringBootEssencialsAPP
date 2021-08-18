package br.com.applications.interfaces;

import java.io.Serializable;

public interface EnumModel<T extends Serializable> {

    T getCodigo();
}