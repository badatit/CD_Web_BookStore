package springmvc.Enums;

public enum CoverTypesEnums {
	bia_cung("BÃ¬a Cá»©ng"),
	bia_mem("BÃ¬a Má»�m");

	private final String coverTypesValue;

	CoverTypesEnums(String coverTypesValue) {
		this.coverTypesValue = coverTypesValue;
	}

	public String getCoverTypesValue() {
		return coverTypesValue;
	}
}
