package vn.demo.laptopshop.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class UploadService {
    private final ServletContext servletContext;

    public UploadService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public String handleSaveUploadFile(MultipartFile file, String targetFolder) {
        // nếu không upload file
        if (file.isEmpty()) {
            return "";
        }
        String rootPath = this.servletContext.getRealPath("/resources/images");// lấy ra absolute file
        String finalName = "";
        try {
            byte[] bytes = file.getBytes();

            File dir = new File(rootPath + File.separator + targetFolder);
            if (!dir.exists())
                dir.mkdirs();// make directory
            finalName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
            // Create the file on server
            File serverFile = new File(dir.getAbsolutePath() + File.separator + finalName);
            // currentTimeMillis file tới sau sẽ ghi đè file tới trước
            BufferedOutputStream stream = new BufferedOutputStream(
                    new FileOutputStream(serverFile));// chuyền vào file bạn muốn lưu
            stream.write(bytes);// ghi file
            stream.close();// kết thúc

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return finalName;
    }
}
