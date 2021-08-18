package br.com.applications.generic;



public interface GenericEntity<T> {

    void update(T source);

    Integer getId();

    String getName();

    T createNewInstance();
}


