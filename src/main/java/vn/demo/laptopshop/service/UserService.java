package vn.demo.laptopshop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import vn.demo.laptopshop.domain.Product;
import vn.demo.laptopshop.domain.Role;
import vn.demo.laptopshop.domain.User;
import vn.demo.laptopshop.domain.dto.RegisterDTO;
import vn.demo.laptopshop.repository.RoleRepository;
import vn.demo.laptopshop.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public String handleHello() {
        return "hello from service ";
    }

    public User handleSaveUser(User user) {
        User trong = this.userRepository.save(user);
        System.out.println(trong);
        return trong;
    }

    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    public Page<User> fetchUsers(Pageable page) {
        return this.userRepository.findAll(page);
    }

    public List<User> getAllUsersByEmail(String email) {
        return this.userRepository.findOneByEmail(email);
    }

    public User handleUserService(User user) {
        User trong = this.userRepository.save(user);
        return trong;
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public User deleteUserById(long id) {
        return this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    // mapper
    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());
        return user;
    }

    public boolean checkEmailExist(String email) {
        return this.userRepository.existsByEmail(email);
    }

    public User getUserByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }
}
