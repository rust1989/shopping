package com.rust.shopping.user;

public class UserNotFindException extends RuntimeException {
    public UserNotFindException(String message){
    	super(message);
    }
}
