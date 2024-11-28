package vn.hoidanit.laptopshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import vn.hoidanit.laptopshop.domain.User;

@Repository
// crud : create, read , update , delete
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User trong);

    List<User> findOneByEmail(String email);

    List<User> findAll();

    User findById(long id);

    User deleteById(long id);

    boolean existsByEmail(String email);

    User findByEmail(String email);
}
