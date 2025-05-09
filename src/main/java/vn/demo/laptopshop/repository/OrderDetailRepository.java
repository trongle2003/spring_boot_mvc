package vn.demo.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.demo.laptopshop.domain.Order;
import vn.demo.laptopshop.domain.OrderDetail;
import java.util.List;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {
    List<OrderDetail> findByOrderId(long id);

    List<OrderDetail> deleteByOrderId(long id);
}