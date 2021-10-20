package bean;

public class khachhangbean {
	private String makhachhang;
	private String hoten;
	private String diachi;
	private String matkhau;

	

	public khachhangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public khachhangbean(String makhachhang, String hoten, String diachi, String matkhau) {
		super();
		this.makhachhang = makhachhang;
		this.hoten = hoten;
		this.diachi = diachi;
		this.matkhau = matkhau;

	}
	
	public String getMakhachhang() {
		return makhachhang;
	}
	public void setMakhachhang(String makhachhang) {
		this.makhachhang = makhachhang;
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
	public String getMatkhau() {
		return matkhau;
	}
	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}
	
}
