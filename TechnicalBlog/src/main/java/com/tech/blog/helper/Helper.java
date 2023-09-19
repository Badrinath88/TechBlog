package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

import javax.servlet.http.Part;

public class Helper {
	public static boolean deleteFile(String path) {
		boolean res = false;
		
		try {
			File file = new File(path);
			res = file.delete();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public static boolean saveFile(InputStream is , String path) {
		boolean res = false;
		
		try {
			byte b[] = new byte[is.available()];
			is.read(b);
			
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(b);
			fos.flush();
			fos.close();
			res = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	
	
}
