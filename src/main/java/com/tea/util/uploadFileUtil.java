package com.tea.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class uploadFileUtil {
	private static final Logger logger = LoggerFactory.getLogger(uploadFileUtil.class);

	public static void uploadFile(MultipartFile file) {
		try {

			String originalFilename = new String(file.getOriginalFilename().getBytes("ISO-8859-1"), "UTF-8");
			logger.debug(originalFilename + " is processing...");
			File tmpFolder = new File("D:\\tmp");
			if (!tmpFolder.exists()) {
				tmpFolder.mkdir();
			}

			File tmp = new File("D:\\\\tmp\\" + originalFilename);
			FileOutputStream fos = new FileOutputStream(tmp);
			FileCopyUtils.copy(file.getInputStream(), fos);
			logger.debug(originalFilename + " upload is sucess!");
		} catch (IOException e) {
			logger.error("Upload File Error: " + e.getMessage());
		}
	}
}
