package vn.demo.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;
import jakarta.transaction.Transactional;
import vn.demo.laptopshop.domain.Cart;
import vn.demo.laptopshop.domain.CartDetail;
import vn.demo.laptopshop.domain.Order;
import vn.demo.laptopshop.domain.OrderDetail;
import vn.demo.laptopshop.domain.Product;
import vn.demo.laptopshop.domain.Product_;
import vn.demo.laptopshop.domain.User;
import vn.demo.laptopshop.domain.dto.ProductCriteriaDTO;
import vn.demo.laptopshop.repository.CartDetailRepository;
import vn.demo.laptopshop.repository.CartRepository;
import vn.demo.laptopshop.repository.OrderDetailRepository;
import vn.demo.laptopshop.repository.OrderRepository;
import vn.demo.laptopshop.repository.ProductRepository;
import vn.demo.laptopshop.repository.UserRepository;
import vn.demo.laptopshop.service.specification.ProductSpecification;

@Service
@Transactional
public class ProductService {
    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;
    private final UserRepository userRepository;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService, UserRepository userRepository,
            OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
        this.userRepository = userRepository;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public Product createProduct(Product product) {
        return this.productRepository.save(product);
    }

    public Product updateProduct(Product product) {
        return this.productRepository.save(product);
    }

    public Page<Product> fetchProductsWithSpecification(Pageable page, ProductCriteriaDTO productCriteriaDTO) {
        Specification<Product> combinedSpec = Specification.where(null);
        if (productCriteriaDTO.getTarget() != null && productCriteriaDTO.getTarget().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecification
                    .matchListTarget(productCriteriaDTO.getTarget().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }
        if (productCriteriaDTO.getFactory() != null && productCriteriaDTO.getFactory().isPresent()) {
            Specification<Product> currentSpecs = ProductSpecification
                    .matchListFactory(productCriteriaDTO.getFactory().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }
        if (productCriteriaDTO.getPrice() != null && productCriteriaDTO.getPrice().isPresent()) {
            Specification<Product> currentSpecs = this.buildPriceSpecification(productCriteriaDTO.getPrice().get());
            combinedSpec = combinedSpec.and(currentSpecs);
        }
        return this.productRepository.findAll(combinedSpec, page);
    }

    // case 6
    public Specification<Product> buildPriceSpecification(List<String> price) {
        Specification<Product> combinedSpec = Specification.where(null);

        for (String p : price) {
            double min = 0, max = 0;
            switch (p) {
                case "duoi-10-trieu":
                    min = 1;
                    max = 10000000;
                    break;
                case "10-15-trieu":
                    min = 10000000;
                    max = 15000000;
                    break;
                case "15-20-trieu":
                    min = 15000000;
                    max = 20000000;
                    break;
                case "tren-20-trieu":
                    min = 20000000;
                    max = Double.MAX_VALUE;
                    break;
            }
            Specification<Product> rangeSpec = ProductSpecification.matchMultipePrice(min, max);
            combinedSpec = combinedSpec == null ? rangeSpec : combinedSpec.or(rangeSpec);
        }
        return combinedSpec;
    }

    // case 1
    // public Page<Product> fetchProductsWithSpecification(Pageable page, double
    // min) {
    // return this.productRepository.findAll(ProductSpecification.minPrice(min),
    // page);
    // }

    // case 2
    // public Page<Product> fetchProductsWithSpecification(Pageable page, double
    // max) {
    // return this.productRepository.findAll(ProductSpecification.maxPrice(max),
    // page);
    // }

    // case 3
    // public Page<Product> fetchProductsWithSpecification(Pageable page, String
    // factory) {
    // return
    // this.productRepository.findAll(ProductSpecification.matchFactory(factory),
    // page);
    // }

    // case 4
    // public Page<Product> fetchProductsWithSpecification(Pageable page,
    // List<String> factory) {
    // return
    // this.productRepository.findAll(ProductSpecification.matchListFactory(factory),
    // page);
    // }

    // case 5
    // public Page<Product> fetchProductsWithSpecification(Pageable page, String
    // price) {
    // if (price.equals("10-toi-15-trieu")) {
    // double min = 10000000;
    // double max = 15000000;
    // return this.productRepository.findAll(ProductSpecification.matchPrice(min,
    // max), page);
    // } else if (price.equals("15-toi-30-trieu")) {
    // double min = 15000000;
    // double max = 30000000;
    // return this.productRepository.findAll(ProductSpecification.matchPrice(min,
    // max), page);
    // } else {
    // return this.productRepository.findAll(page);
    // }
    // }

    public Page<Product> fetchProducts(Pageable page) {
        return this.productRepository.findAll(page);
    }

    public List<Product> fetchAllProducts() {
        return this.productRepository.findAll();
    }

    public Product getProductById(long id) {
        return this.productRepository.findById(id);
    }

    public Product deleteProduct(long id) {
        return this.productRepository.deleteById(id);
    }

    public void handleAddProductToCart(String email, long productId, HttpSession session, long quantity) {
        User user = this.userService.getUserByEmail(email);
        if (user != null) {
            // check user đã có cart chưa ? nếu chưa thì tạo mới
            Cart cart = this.cartRepository.findByUser(user);
            if (cart == null) {
                // tạo mới cart
                Cart otherCart = new Cart();
                otherCart.setUser(user);
                otherCart.setSum(0);
                cart = this.cartRepository.save(otherCart);
            }
            // save
            Product product = this.productRepository.findById(productId);
            if (product != null) {
                // check xem sản phẩm đã nằm trong giỏ hàng trước đây chưa
                CartDetail oldDetail = this.cartDetailRepository.findByCartAndProduct(cart, product);

                if (oldDetail == null) {
                    CartDetail cartDetail = new CartDetail();
                    cartDetail.setCart(cart);
                    cartDetail.setProduct(product);
                    cartDetail.setPrice(product.getPrice());
                    cartDetail.setQuantity(quantity);
                    this.cartDetailRepository.save(cartDetail);
                    // update sum
                    int s = cart.getSum() + 1;
                    cart.setSum(s);
                    this.cartRepository.save(cart);
                    session.setAttribute("sum", s);
                } else {
                    oldDetail.setQuantity(oldDetail.getQuantity() + quantity);
                    this.cartDetailRepository.save(oldDetail);
                }

            }
        }
    }

    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }

    public void handleRemoveCartDetail(long cartDetailId, HttpSession session) {
        Optional<CartDetail> cartDetailOptional = this.cartDetailRepository.findById(cartDetailId);
        if (cartDetailOptional.isPresent()) {
            CartDetail cartDetail = cartDetailOptional.get();
            Cart currentCart = cartDetail.getCart();
            // xóa cartDetail
            this.cartDetailRepository.deleteById(cartDetailId);
            // update cart
            if (currentCart.getSum() > 1) {
                // update current cart
                int s = currentCart.getSum() - 1;
                currentCart.setSum(s);
                session.setAttribute("sum", s);
                this.cartRepository.save(currentCart);
            } else {
                // xoa nếu = 1
                this.cartRepository.deleteById(currentCart.getId());
                session.setAttribute("sum", 0);
            }
        }
    }

    public void handleUpdateCartBeforeCheckout(List<CartDetail> cartDetails) {
        for (CartDetail cartDetail : cartDetails) {
            Optional<CartDetail> cdOptional = this.cartDetailRepository.findById(cartDetail.getId());
            if (cdOptional.isPresent()) {
                CartDetail currentCartDetail = cdOptional.get();
                currentCartDetail.setQuantity(cartDetail.getQuantity());
                this.cartDetailRepository.save(currentCartDetail);
            }
        }
    }

    public void handlePlaceOrder(User user, HttpSession session, String receiverName, String receiverAddress,
            String receiverPhone) {

        // create order detail
        // step 1 : get cart by user
        Cart cart = this.cartRepository.findByUser(user);
        if (cart != null) {
            List<CartDetail> cartDetails = cart.getCartDetails();
            if (cartDetails != null) {
                // create order
                Order order = new Order();
                order.setUser(user);
                order.setReceiverAddress(receiverAddress);
                order.setReceiverName(receiverName);
                order.setReceiverPhone(receiverPhone);
                order.setStatus("PENDING");
                double sum = 0;
                for (CartDetail cd : cartDetails) {
                    sum += cd.getPrice();
                }
                order.setTotalPrice(sum);
                order = this.orderRepository.save(order);

                // create orderDetail
                for (CartDetail cd : cartDetails) {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.setOrder(order);
                    orderDetail.setProduct(cd.getProduct());
                    orderDetail.setPrice(cd.getPrice());
                    orderDetail.setQuantity(cd.getQuantity());
                    this.orderDetailRepository.save(orderDetail);
                }
            }

            // step 2 : delete cart_detail và cart
            for (CartDetail cd : cartDetails) {
                this.cartDetailRepository.deleteById(cd.getId());
            }

            this.cartRepository.deleteById(cart.getId());

            // step 3: update session
            session.setAttribute("sum", 0);
        }

    }

    // lấy tất cả thông tin của order
    public List<Order> fetchAllSOrders() {
        return this.orderRepository.findAll();
    }

    public Page<Order> fetchOrders(Pageable page) {
        return this.orderRepository.findAll(page);
    }

    // lấy tất cả thông tin của 1 order
    public List<OrderDetail> fetchOrderDetails(long id) {
        return this.orderDetailRepository.findByOrderId(id);
    }

    // lấy thông tin id của 1 order
    public Order getOrdersById(long id) {
        return this.orderRepository.findById(id);
    }

    // cập nhật order
    public Order updateOrder(Order order) {
        return this.orderRepository.save(order);
    }

    // muốn xóa 1 order thì cần xóa orderdetail trước
    public List<OrderDetail> deleteOrderDetails(long id) {
        return this.orderDetailRepository.deleteByOrderId(id);
    }

    // xóa order theo id
    public Order deleteOrder(long id) {
        return this.orderRepository.deleteById(id);
    }

    // lấy thống kê số lượng user
    public long countUsers() {
        return this.userRepository.count();// đếm số lượng
    }

    // lấy thống kê số lượng product
    public long countProducts() {
        return this.productRepository.count();
    }

    // lấy thống kê số lượng order
    public long countOrders() {
        return this.orderRepository.count();
    }

    public List<Order> fetchOrderByUser(User user) {
        return this.orderRepository.findByUser(user);
    }

}
