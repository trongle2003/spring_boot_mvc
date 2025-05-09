package vn.demo.laptopshop.repository;

import vn.demo.laptopshop.domain.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long>, JpaSpecificationExecutor<Product> {
    Product findById(long id);

    Product deleteById(long id);

    Page<Product> findAll(Pageable pageable);

    Page<Product> findAll(Specification<Product> spec, Pageable pageable);
}
