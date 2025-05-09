package vn.demo.laptopshop.service.specification;

import java.util.List;
import java.util.function.Predicate;

import org.springframework.data.jpa.domain.Specification;

import vn.demo.laptopshop.domain.Product;
import vn.demo.laptopshop.domain.Product_;

public class ProductSpecification {
    // tìm kiếm theo tên
    public static Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
    }

    // case 1
    public static Specification<Product> minPrice(double price) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.ge(root.get(Product_.PRICE), price);
    }

    // case 2
    public static Specification<Product> maxPrice(double price) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.le(root.get(Product_.PRICE), price);
    }

    // case 3
    public static Specification<Product> matchFactory(String factory) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.equal(root.get(Product_.FACTORY), factory);
    }

    // case 4
    public static Specification<Product> matchListFactory(List<String> factory) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Product_.FACTORY)).value(factory);
    }

    public static Specification<Product> matchListTarget(List<String> target) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Product_.TARGET)).value(target);
    }

    // case 5
    public static Specification<Product> matchPrice(double min, double max) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.and(criteriaBuilder.gt(root.get(Product_.PRICE), min),
                criteriaBuilder.lt(root.get(Product_.PRICE), max));
    }

    // case 6
    public static Specification<Product> matchMultipePrice(double min, double max) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.between(root.get(Product_.PRICE), min, max);
    }
}
