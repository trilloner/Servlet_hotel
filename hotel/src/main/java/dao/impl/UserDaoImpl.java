package dao.impl;

import dao.UserDao;
import dao.mapper.UserMapper;
import model.user.User;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.*;
import java.util.List;
import java.util.Optional;
import java.util.ResourceBundle;

public class UserDaoImpl implements UserDao {
    private final Logger logger = LogManager.getLogger(UserDaoImpl.class);
    private final Connection connection;
    private ResourceBundle resourceBundle = ResourceBundle.getBundle("sql");
    private UserMapper userMapper = new UserMapper();

    public UserDaoImpl(Connection connection) {
        this.connection = connection;
    }

    @Override
    public Optional<User> findByEmail(String email) {

        try {
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM user WHERE email= ?");
            preparedStatement.setString(1, email);
            ResultSet set = preparedStatement.executeQuery();
            if (set.next())
                return Optional.of(userMapper.toUserFromResultSet(set));

        } catch (SQLException ex) {
            logger.warn("Could not find user with email address {}: {}", email, ex.getMessage());
        }
        return Optional.empty();
    }

    @Override
    public Optional<User> create(User entity) {

        try {
            PreparedStatement preparedStatement =
                    connection.prepareStatement(resourceBundle.getString("user.create"),
                            Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, entity.getEmail());
            preparedStatement.setString(2, entity.getName());
            preparedStatement.setString(3, entity.getPassword());
            preparedStatement.setString(4, "ROLE_USER");
            preparedStatement.executeUpdate();
            ResultSet generatedKeys = preparedStatement.getGeneratedKeys();
            if (generatedKeys.next()) {
                entity.setId(generatedKeys.getLong(1));
            }
            return Optional.of(entity);
        } catch (SQLException ex) {
            logger.warn("User already exist : {}", ex.getMessage());
        }

        return Optional.empty();
    }

    @Override
    public User findById(int id) {
        return null;
    }

    @Override
    public List<User> findAll() {
        return null;
    }

    @Override
    public void update(User entity) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public void close() {

    }
}
