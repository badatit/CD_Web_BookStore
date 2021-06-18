package springmvc.Enums;

public enum CoverTypesEnums {
	bia_cung("Bìa Cứng"),
	bia_mem("Bìa Mềm"),
	bia_da("Bìa Da"),
	bia_roi("Bìa Rời"),
	bia_gap("Bìa Gập"),
	books_1980("1980 Books");
	
	

	private final String coverTypesValue;

	CoverTypesEnums(String coverTypesValue) {
		this.coverTypesValue = coverTypesValue;
	}

	public String getCoverTypesValue() {
		return coverTypesValue;
	}
}
