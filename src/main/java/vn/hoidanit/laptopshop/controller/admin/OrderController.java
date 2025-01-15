package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.ui.Model;

import vn.hoidanit.laptopshop.domain.Order;
import vn.hoidanit.laptopshop.domain.OrderDetail;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.service.ProductService;

@Controller
public class OrderController {
    private final ProductService productService;

    public OrderController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping(value = "/admin/order")
    public String getOrder(Model model) {
        List<Order> Orders = this.productService.fetchOrders();
        model.addAttribute("Order1", Orders);
        System.out.println(Orders);
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

}
