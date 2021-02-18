package dao;

import model.user.User;

import java.util.Optional;

public interface UserDao {

    Optional<User> findById(Long id);
}
