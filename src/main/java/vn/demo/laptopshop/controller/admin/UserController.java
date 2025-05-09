package vn.demo.laptopshop.controller.admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;
import jakarta.validation.Valid;
import vn.demo.laptopshop.domain.Product;
import vn.demo.laptopshop.domain.User;
import vn.demo.laptopshop.repository.UserRepository;
import vn.demo.laptopshop.service.UploadService;
import vn.demo.laptopshop.service.UserService;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        String test = this.userService.handleHello();
        model.addAttribute("trong", test);
        return "hello";
    }

    @GetMapping("admin/user/create")
    public String getInformation(Model model) { // ModelAttribute để lấy giá trị
                                                // đã được điền tại view
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user")
    public String getTable(Model model, @RequestParam(value = "page", defaultValue = "1") int page) {
        Pageable pageable = PageRequest.of(page - 1, 4);
        Page<User> Users = this.userService.fetchUsers(pageable);
        List<User> listUsers = Users.getContent();
        model.addAttribute("Users1", listUsers);

        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", Users.getTotalPages());
        return "admin/user/show";
    }

    @PostMapping("/admin/user/create")
    public String createUsers(Model model,
            @ModelAttribute("newUser") @Valid User trong,
            BindingResult newUserBindingResult,
            @RequestParam("demoFile") MultipartFile file) {
        // validate
        List<FieldError> errors = newUserBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        // sau khi báo lỗi thì return ra view
        if (newUserBindingResult.hasErrors()) {
            return "admin/user/create";
        }
        // xử lý ảnh
        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(trong.getPassword());
        trong.setAvatar(avatar);
        trong.setPassword(hashPassword);
        trong.setRole(this.userService.getRoleByName(trong.getRole().getName()));
        this.userService.handleSaveUser(trong);
        return "redirect:/admin/user"; // chuyển hướng trang bằng redirect
    }

    @RequestMapping(value = "/admin/user/{id}")
    public String getId(Model model, @PathVariable long id) {
        User User = this.userService.getUserById(id);
        model.addAttribute("Users1", User);
        model.addAttribute("id", id);
        return "admin/user/detail";
    }

    @GetMapping(value = "/admin/user/update/{id}")
    public String updateUserRedirect(Model model, @PathVariable long id) {// PathVariable lấy giá trị trên params
        User User = this.userService.getUserById(id);
        model.addAttribute("Users1", User);// lấy đối tượng user gán cho users1 để mang sang file jsp truyền giá trị
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String updateUser(Model model, @ModelAttribute("Users1") User tempUser,
            @RequestParam("demoFile") MultipartFile file) {
        User currentUser = this.userService.getUserById(tempUser.getId());
        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        if (currentUser != null) {
            currentUser.setAddress(tempUser.getAddress());
            currentUser.setFullName(tempUser.getFullName());
            currentUser.setPhone(tempUser.getPhone());
            currentUser.setAvatar(avatar);
            currentUser.setRole(this.userService.getRoleByName(currentUser.getRole().getName()));
            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String deleteUserRedirect(Model model, @PathVariable long id) {
        User User = this.userService.deleteUserById(id);
        model.addAttribute("Users1", User);
        return "admin/user/delete";
    }

    @GetMapping("/admin/user/delete")
    public String deleteUser() {
        return "redirect:/admin/user";
    }
}
