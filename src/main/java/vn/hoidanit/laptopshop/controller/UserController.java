package vn.hoidanit.laptopshop.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.UserRepository;
import vn.hoidanit.laptopshop.service.UserService;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        String test = this.userService.handleHello();
        model.addAttribute("trong", test);
        return "hello";
    }

    @RequestMapping(value = "admin/user/create")
    public String getInformation(Model model, @ModelAttribute("newUser") User trong) {
        List<User> arrUsers = this.userService.getAllUsersByEmail("5@gmail.com");
        System.out.println(arrUsers);
        System.out.println("Information in params is: " + trong);
        userService.handleUserService(trong);
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user")
    public String getTable(Model model) {
        List<User> Users = this.userService.getAllUsers();
        model.addAttribute("Users1", Users);
        return "admin/user/table";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUsers(Model model, @ModelAttribute("newUser") User trong) {
        this.userService.handleUserService(trong);
        return "redirect:/admin/user";
    }

    @RequestMapping(value = "/admin/user/{id}")
    public String getId(Model model, @PathVariable long id) {
        System.out.println("check Id = " + id);
        List<User> Users = this.userService.getAllUsers();
        model.addAttribute("Users1", Users);
        return "/admin/user/detail";
    }
}
