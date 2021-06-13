package springmvc.Utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

@Component
public class UploadFileUtils {
	private final String root ="/usr/var";
	public  void writeOrUpdate(byte[] bytes ,String path) {
		//check folder
		File file = new File(StringUtils.substringBeforeLast(root + path, "/"));
		if (!file.exists()) {
			file.mkdir();
		}
		try(FileOutputStream fos = new FileOutputStream(new File(root +path)) ) {
			fos.write(bytes);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
