package bean;

public class SinhVienbean {
	private String masv;
	private String hoten;
	private String diachi;
	private Double dtb;
	private String malop;
	public SinhVienbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SinhVienbean(String masv, String hoten, String diachi, Double dtb, String malop) {
		super();
		this.masv = masv;
		this.hoten = hoten;
		this.diachi = diachi;
		this.dtb = dtb;
		this.malop = malop;
	}
	public String getMasv() {
		return masv;
	}
	public void setMasv(String masv) {
		this.masv = masv;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	public Double getDtb() {
		return dtb;
	}
	public void setDtb(Double dtb) {
		this.dtb = dtb;
	}
	public String getMalop() {
		return malop;
	}
	public void setMalop(String malop) {
		this.malop = malop;
	}
	
}
