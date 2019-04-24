package com.brodeon.gallery.gallery.service.security;

public interface UserService {

    User getUserByUsername(String username);
    void saveUser(User user);
    void deleteUser(User user);


}
