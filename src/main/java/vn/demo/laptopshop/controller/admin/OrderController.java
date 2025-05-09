package vn.demo.laptopshop.controller.admin;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.ui.Model;

import vn.demo.laptopshop.domain.Order;
import vn.demo.laptopshop.domain.OrderDetail;
import vn.demo.laptopshop.domain.Product;
import vn.demo.laptopshop.domain.User;
import vn.demo.laptopshop.service.ProductService;

@Controller
public class OrderController {
    private final ProductService productService;

    public OrderController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping(value = "/admin/order")
    public String getOrder(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
        Pageable pageable = PageRequest.of(page - 1, 4);
        Page<Order> Orders = this.productService.fetchOrders(pageable);
        List<Order> listOrders = Orders.getContent();
        model.addAttribute("Order1", listOrders);

        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", Orders.getTotalPages());

        return "admin/order/show";
    }

    @RequestMapping(value = "/admin/order/{id}")
    public String getOrderDetails(Model model, @PathVariable long id) {
        List<OrderDetail> orderDetails = this.productService.fetchOrderDetails(id);
        model.addAttribute("OrderDetail1", orderDetails);
        model.addAttribute("id", id);
        return "admin/order/detail";
    }

    @GetMapping(value = "/admin/order/update/{id}")
    public String updateOrder(Model model, @PathVariable long id) {
        Order order = this.productService.getOrdersById(id);
        model.addAttribute("Order1", order);
        return "admin/order/update";
    }

    @PostMapping("/admin/order/update")
    public String updateStatusOrder(Model model, @ModelAttribute("Order1") Order tempOrder) {
        Order currentOrder = this.productService.getOrdersById(tempOrder.getId());
        if (currentOrder != null) {
            currentOrder.setStatus(tempOrder.getStatus());
            this.productService.updateOrder(currentOrder);
        }
        return "redirect:/admin/order";
    }

    @GetMapping("/admin/order/delete/{id}")
    public String deleteOrderById(Model model, @PathVariable long id) {
        this.productService.deleteOrderDetails(id);
        Order order = this.productService.deleteOrder(id);
        model.addAttribute("Order1", order);
        return "admin/order/delete";
    }

    @GetMapping("/admin/order/delete")
    public String deleteOrder() {
        return "redirect:/admin/order";
    }

}
