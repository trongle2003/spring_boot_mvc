package vn.demo.laptopshop.controller.client;

import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import vn.demo.laptopshop.domain.Cart;
import vn.demo.laptopshop.domain.CartDetail;
import vn.demo.laptopshop.domain.Product;
import vn.demo.laptopshop.domain.Product_;
import vn.demo.laptopshop.domain.User;
import vn.demo.laptopshop.domain.dto.ProductCriteriaDTO;
import vn.demo.laptopshop.domain.dto.RegisterDTO;
import vn.demo.laptopshop.service.CartDetailService;
import vn.demo.laptopshop.service.ProductService;
import vn.demo.laptopshop.service.UserService;

import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomePageController {

    private final ProductService productService;
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final CartDetailService cartDetailsService;

    public HomePageController(ProductService productService, UserService userService, PasswordEncoder passwordEncoder,
            CartDetailService cartDetailsService) {
        this.productService = productService;
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.cartDetailsService = cartDetailsService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Product> products = this.productService.fetchAllProducts();
        model.addAttribute("Products1", products);
        return "client/homepage/show";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerUser", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String handleRegister(@ModelAttribute("registerUser") @Valid RegisterDTO registerDTO,
            BindingResult bindingResult) {

        // validate
        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }

        User user = this.userService.registerDTOtoUser(registerDTO);
        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName("USER"));
        this.userService.handleSaveUser(user);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String getLoginPage() {
        return "client/auth/login";
    }

    @GetMapping("/access-deny")
    public String getDenyPage() {
        return "client/auth/deny";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productService.fetchByUser(currentUser);

        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail i : cartDetails) {
            totalPrice += i.getPrice() * i.getQuantity();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cart", cart);
        return "client/cart/show";
    }

    @GetMapping("/products")
    public String getProductPage(Model model, ProductCriteriaDTO productCriteriaDTO) {
        int page = 1;
        try {
            if (productCriteriaDTO != null && productCriteriaDTO.getPage() != null
                    && productCriteriaDTO.getPage().isPresent()) {
                page = Integer.parseInt(productCriteriaDTO.getPage().get());
                if (page < 1)
                    page = 1;
            }
        } catch (NumberFormatException e) {
            page = 1;
        }

        // check sort price
        Pageable pageable;
        if (productCriteriaDTO != null && productCriteriaDTO.getSort() != null
                && productCriteriaDTO.getSort().isPresent()) {
            String sort = productCriteriaDTO.getSort().get();
            if (sort.equals("gia-tang-dan")) {
                pageable = PageRequest.of(0, 60, Sort.by(Product_.PRICE).ascending()); // page bắt đầu từ 0
            } else if (sort.equals("gia-giam-dan")) {
                pageable = PageRequest.of(0, 60, Sort.by(Product_.PRICE).descending());
            } else {
                pageable = PageRequest.of(0, 60);
            }
        } else {
            pageable = PageRequest.of(0, 60);
        }

        Page<Product> products = this.productService.fetchProductsWithSpecification(pageable, productCriteriaDTO);

        List<Product> listProducts = products.getContent().size() > 0 ? products.getContent()
                : new ArrayList<Product>();
        model.addAttribute("Products1", listProducts);

        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", products.getTotalPages());
        return "client/product/products";
    }

}
