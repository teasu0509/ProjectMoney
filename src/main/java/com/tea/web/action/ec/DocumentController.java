package com.tea.web.action.ec;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;

import com.tea.util.uploadFileUtil;

@Controller
@RequestMapping(value = "/document")
public class DocumentController {
	private static final Logger logger = LoggerFactory.getLogger(DocumentController.class);

	@ResponseStatus(value = HttpStatus.OK)
	@PostMapping("/upload")
	public @ResponseBody String uploadCommons(@RequestPart("file") MultipartFile file) {
		try {
			logger.info("檔案上傳成功!");
			uploadFileUtil.uploadFile(file);
		} catch (Exception e) {
			logger.error("檔案上傳失敗");
		}
		return "success";
	}
}
