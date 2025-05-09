package vn.demo.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.demo.laptopshop.domain.Cart;
import vn.demo.laptopshop.domain.CartDetail;
import vn.demo.laptopshop.domain.Product;
import vn.demo.laptopshop.repository.CartDetailRepository;

@Service
public class CartDetailService {
    private final CartDetailRepository cartDetailRepository;

    public CartDetailService(CartDetailRepository cartDetailRepository) {
        this.cartDetailRepository = cartDetailRepository;
    }

    public List<CartDetail> fetchCartDetails() {
        return this.cartDetailRepository.findAll();
    }

}
