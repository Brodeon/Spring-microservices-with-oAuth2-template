package com.brodeon.gallery.gallery.service.oauth;

public interface UserDAO {

    User getUserByUsername(String username);
    void saveUser(User user);
    void deleteUser(User user);

}
