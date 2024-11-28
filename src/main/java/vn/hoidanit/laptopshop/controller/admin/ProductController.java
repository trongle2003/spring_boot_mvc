package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;

@Controller
public class ProductController {
    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product/create")
    public String createNewProduct(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @GetMapping(value = "/admin/product")
    public String getTableProduct(Model model) {
        List<Product> Products = this.productService.fetchProducts();
        model.addAttribute("Products1", Products);
        System.out.println(Products);
        return "admin/product/show";
    }

    @PostMapping("/admin/product/create")
    public String createProducts(Model model, @ModelAttribute("newProduct") @Valid Product trong,
            BindingResult newUserBindingResult,
            @RequestParam("hoidanitFile") MultipartFile file) {

        // validate
        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }

        // sau khi báo lỗi thì return ra view
        if (newUserBindingResult.hasErrors()) {
            return "admin/product/create";
        }

        String avatar = this.uploadService.handleSaveUploadFile(file, "product");
        trong.setImage(avatar);
        this.productService.createProduct(trong);
        return "redirect:/admin/product"; // chuyển hướng trang bằng redirect
    }

    @RequestMapping(value = "/admin/product/{id}")
    public String getId(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("Products1", product);
        model.addAttribute("id", id);
        return "admin/product/detail";
    }

    @GetMapping(value = "/admin/product/update/{id}")
    public String updateProductRedirect(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        model.addAttribute("Products1", product);
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String updateProduct(Model model, @ModelAttribute("Products1") Product tempProduct,
            @RequestParam("hoidanitFile") MultipartFile file) {
        Product currentProduct = this.productService.getProductById(tempProduct.getId());
        if (currentProduct != null) {
            if (!file.isEmpty()) {
                String avatar = this.uploadService.handleSaveUploadFile(file, "product");
                currentProduct.setImage(avatar);
            }
            currentProduct.setName(tempProduct.getName());
            currentProduct.setDetailDesc(tempProduct.getDetailDesc());
            currentProduct.setFactory(tempProduct.getFactory());
            currentProduct.setPrice(tempProduct.getPrice());
            currentProduct.setQuantity(tempProduct.getQuantity());
            currentProduct.setShortDesc(tempProduct.getShortDesc());
            currentProduct.setTarget(tempProduct.getTarget());
            this.productService.updateProduct(currentProduct);
        }
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String deleteProductRedirect(Model model, @PathVariable long id) {
        Product product = this.productService.deleteProduct(id);
        model.addAttribute("Products1", product);
        return "admin/product/delete";
    }

    @GetMapping("/admin/product/delete")
    public String deleteProduct() {
        return "redirect:/admin/product";
    }

}
