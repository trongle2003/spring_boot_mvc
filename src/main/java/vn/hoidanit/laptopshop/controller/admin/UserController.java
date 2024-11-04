package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
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
    public String getInformation(Model model, @ModelAttribute("newUser") User trong) { // ModelAttribute để lấy giá trị
                                                                                       // đã được điền tại view
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
        return "admin/user/show";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUsers(Model model, @ModelAttribute("newUser") User trong) {
        this.userService.handleUserService(trong);
        return "redirect:/admin/user"; // chuyển hướng trang bằng redirect
    }

    @RequestMapping(value = "/admin/user/{id}")
    public String getId(Model model, @PathVariable long id) {
        User User = this.userService.getUserById(id);
        model.addAttribute("Users1", User);
        model.addAttribute("id", id);
        return "/admin/user/detail";
    }

    @RequestMapping(value = "/admin/user/update/{id}")
    public String updateUserRedirect(Model model, @PathVariable long id) {// PathVariable lấy giá trị trên params
        User User = this.userService.getUserById(id);
        model.addAttribute("Users1", User);// lấy đối tượng user gán cho users1 để mang sang file jsp truyền giá trị
        return "/admin/user/update";
    }

    @GetMapping("/admin/user/update")
    public String updateUser(Model model, @ModelAttribute("Users1") User tempUser) {
        User currentUser = this.userService.getUserById(tempUser.getId());
        if (currentUser != null) {
            currentUser.setAddress(tempUser.getAddress());
            currentUser.setFullName(tempUser.getFullName());
            currentUser.setPhone(tempUser.getPhone());
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String deleteUserRedirect(Model model, @PathVariable long id) {
        User User = this.userService.deleteUserById(id);
        model.addAttribute("Users1", User);
        return "/admin/user/delete";
    }

    @GetMapping("/admin/user/delete")
    public String deleteUser() {
        return "redirect:/admin/user";
    }
}
