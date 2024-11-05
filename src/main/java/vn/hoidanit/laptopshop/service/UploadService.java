package vn.hoidanit.laptopshop.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

public class UploadService {
    private final ServletContext servletContext;

    public UploadService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public void handleSaveUploadFile(MultipartFile file) {

        String rootPath = this.servletContext.getRealPath("/resources/images");// lấy ra absolute file
        try {
            byte[] bytes = file.getBytes();

            File dir = new File(rootPath + File.separator + "avatar");
            if (!dir.exists())
                dir.mkdirs();// make directory
            // Create the file on server
            File serverFile = new File(dir.getAbsolutePath() + File.separator +
                    +System.currentTimeMillis() + "-" + file.getOriginalFilename());
            // currentTimeMillis file tới sau sẽ ghi đè file tới trước
            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));// chuyền vào file bạn muốn lưu
            stream.write(bytes);// ghi file
            stream.close();// kết thúc
            // this.userService.handleUserService(trong);

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
