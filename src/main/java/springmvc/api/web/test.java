package springmvc.api.web;

import java.text.NumberFormat;
import java.util.Locale;

public class test {
			public static void main(String[] args) {
				Locale localeVN = new Locale("vi", "VN");
				NumberFormat vn = NumberFormat.getInstance(localeVN);
					
				// đối với số float được định dạng theo chuẩn của Việt am
				// thì phần thập phân của số được phân cách bằng dấu phẩy
				double c = 437.000 - 15.000;
				
			
				String str2 = vn.format(c);
				System.out.println("Số "+c + " sau khi định dạng = " + str2);
			}


}
