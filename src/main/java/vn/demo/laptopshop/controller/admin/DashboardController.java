package vn.demo.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import vn.demo.laptopshop.service.ProductService;

@Controller
public class DashboardController {

    private final ProductService productService;

    public DashboardController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/admin")
    public String getDashboard(Model model) {
        model.addAttribute("countUsers", this.productService.countUsers());
        model.addAttribute("countProducts", this.productService.countProducts());
        model.addAttribute("countOrders", this.productService.countOrders());
        return "admin/dashboard/show";
    }
}
