package vn.hoidanit.laptopshop.service.specification;

import java.util.function.Predicate;

import org.springframework.data.jpa.domain.Specification;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.Product_;

public class ProductSpecification {
    // tìm kiếm theo tên
    public static Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
    }

    // tìm kiếm theo hãng sản xuất
    public static Specification<Product> factoryLike(String factory) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + factory + "%");
    }

    // tìm kiếm nhiều hãng sản xuất
    public static Specification<Product> manyFactoryLike(String factory) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + factory + "%");
    }


}
