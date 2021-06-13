package springmvc.dto;

public class JsonResultDto<T> {
	private Integer code; // 0:success | 1:fail
	private String msg; // Thông điệp
	private T data; // return Object

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public JsonResultDto() {
	}

	public JsonResultDto(Integer code, String msg, T data) {
		this.code = code;
		this.msg = msg;
		this.data = data;
	}

	public JsonResultDto<T> error() {
		return new JsonResultDto<>(1, "Lỗi hệ thống", null);
	}

	public JsonResultDto<T> error(String msg ) {
		return new JsonResultDto<>(1, msg, null);
	}
	
	public JsonResultDto<T> error(String msg, T data) {
		return new JsonResultDto<>(1, msg, data);
	}

	public JsonResultDto<T> success() {
		return new JsonResultDto<>(0, "Thành công", null);
	}

	public JsonResultDto<T> success(T data) {
		return new JsonResultDto<>(0, "Thành công", data);
	}

	public JsonResultDto<T> success(String msg, T data) {
		return new JsonResultDto<>(0, msg, data);
	}
}
