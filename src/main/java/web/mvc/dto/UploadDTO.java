package web.mvc.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class UploadDTO {
	private String name;
	private MultipartFile file;

	private String fileName;
	private long fileSize;
}
