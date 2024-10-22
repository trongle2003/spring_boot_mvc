package vn.hoidanit.laptopshop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import vn.hoidanit.laptopshop.domain.User;

//crud : create, read , update , delete
public interface UserRepository extends JpaRepository<User, Long> {
    User save(User trong);

    List<User> findByEmail(String email);

    List<User> findAll();
}
