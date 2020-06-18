package com.tea.web.action.ec;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping(value = "/document")
public class DocumentController {
	private static final Logger logger = LoggerFactory.getLogger(DocumentController.class);

	@ResponseStatus(value = HttpStatus.OK)
	@PostMapping("/upload")
	public String uploadCommons(@RequestPart("file") MultipartFile file) {
		logger.debug("---Run Upload Commons---");
		storeFile(file);
		return "success";
	}

	private void storeFile(MultipartFile file) {
		try {

			String originalFilename = new String(file.getOriginalFilename().getBytes("ISO-8859-1"), "UTF-8");
			logger.debug("----File Name: " + originalFilename + "----");
			
			File tmpFolder = new File("D:\\tmp");
			if (!tmpFolder.exists()) {
				tmpFolder.mkdir();
			}

			File tmp = new File("D:\\\\tmp\\" + originalFilename);
			FileOutputStream fos = new FileOutputStream(tmp);
			FileCopyUtils.copy(file.getInputStream(), fos);
		} catch (IOException e) {
			System.out.println("Upload File Error: " + e.getMessage());
		}
	}
}
