package springmvc.Utils;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import springmvc.dto.MyUser;


public class SecurityUtils {
	public static MyUser getPrincipal() {
		MyUser myUser = null;
		try {
			myUser= (MyUser) (SecurityContextHolder.getContext()).getAuthentication().getPrincipal();
		} catch (Exception e) {
			myUser = null;
		}
		return myUser;
    }
	
	
	@SuppressWarnings("unchecked")
	public static List<String> getAuthorication() {
		List<String> result = new ArrayList<>();
		List<GrantedAuthority> authorities = (List<GrantedAuthority>)(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
        for (GrantedAuthority authority : authorities) {
            result.add(authority.getAuthority());
        }
		return result;

	}

}
