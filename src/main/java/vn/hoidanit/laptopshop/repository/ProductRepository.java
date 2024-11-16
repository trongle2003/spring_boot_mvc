package vn.hoidanit.laptopshop.repository;

import vn.hoidanit.laptopshop.domain.Product;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

    Product findById(long id);

    Product deleteById(long id);
}
