package br.com.applications.errors;

public class AlreadyExistsException extends RuntimeException {

    public AlreadyExistsException(final String message) {
        super(message);
    }
}