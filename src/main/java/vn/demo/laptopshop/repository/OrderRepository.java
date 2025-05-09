package vn.demo.laptopshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.demo.laptopshop.domain.Order;
import vn.demo.laptopshop.domain.OrderDetail;
import vn.demo.laptopshop.domain.User;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    Order findById(long id);

    Order deleteById(long id);

    List<Order> findByUser(User user);

    Page<Order> findAll(Pageable pageable);
}