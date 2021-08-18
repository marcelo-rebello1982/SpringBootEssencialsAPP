package br.com.applications.model;


public class AlreadyExistsException extends RuntimeException {

    public AlreadyExistsException(final String message) {
        super(message);
    }
}