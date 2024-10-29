package vn.hoidanit.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import vn.hoidanit.laptopshop.domain.User;
import vn.hoidanit.laptopshop.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
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

    public List<User> getAllUsersByEmail(String email) {
        return this.userRepository.findByEmail(email);
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
}
