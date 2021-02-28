package dao;

import java.util.List;
import java.util.Optional;

/**
 * Generic DAO for general functions
 *
 * @param <T>
 */
public interface GenericDao<T> extends AutoCloseable {
    Optional<T> create(T entity);

    T findById(int id);

    List<T> findAll();

    void update(T entity);

    void delete(int id);

    void close();
}
