package vn.demo.laptopshop.controller.client;

import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.demo.laptopshop.service.ProductService;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

class CartRequest {
    private long quantity;
    private long productId;

    public long getQuantity() {
        return quantity;
    }

    public long getProductId() {
        return productId;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public void setProductId(long productId) {
        this.productId = productId;
    }

}

@RestController
@RequestMapping("/api")
public class CartAPI {
    private final ProductService productService;

    public CartAPI(ProductService productService) {
        this.productService = productService;
    }

    @PostMapping("/add-product-to-cart")
    public ResponseEntity<Integer> addProductToCart(@RequestBody CartRequest cartRequest,
            HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("email") == null) {
            return ResponseEntity.status(401).body(-1); // Trả về mã lỗi nếu chưa đăng nhập
        }
        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, cartRequest.getProductId(), session,
                cartRequest.getQuantity());
        Integer sum = (Integer) session.getAttribute("sum");
        if (sum == null) {
            sum = 0; // Giá trị mặc định nếu sum chưa được set
        }
        return ResponseEntity.ok(sum);
    }

}
