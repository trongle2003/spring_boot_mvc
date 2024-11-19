package vn.hoidanit.laptopshop.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.ProductService;

@Controller
public class ItemController {
    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/product/{id}")
    public String getDetailProductItem(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        List<Product> getproducts = this.productService.fetchProducts();
        model.addAttribute("Product1", getproducts);
        model.addAttribute("Products1", product);
        model.addAttribute("id", id);
        return "/client/product/detail";
    }

}
