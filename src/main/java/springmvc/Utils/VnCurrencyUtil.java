package springmvc.Utils;

import java.text.NumberFormat;
import java.util.Locale;

import org.springframework.stereotype.Component;
@Component
public class VnCurrencyUtil {
	public String currencyVn(double number) {
		Locale localeVN = new Locale("vi", "VN");
		NumberFormat vn = NumberFormat.getInstance(localeVN);
		String str2 = vn.format(number);
		return str2;
	}
	
}
