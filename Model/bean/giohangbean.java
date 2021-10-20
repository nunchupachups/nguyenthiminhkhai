package bean;


public class giohangbean {
	private String masach;
	private String tensach;
	private String tacgia;
	private String anh;
	private Long gia;
	private Long soluong;
	private Long thanhtien;
	public giohangbean(String masach, String tensach, String tacgia, String anh, Long gia, Long soluong) {
		super();
		this.masach = masach;
		this.tensach = tensach;
		this.tacgia = tacgia;
		this.anh = anh;
		this.gia = gia;
		this.soluong = soluong;
		this.thanhtien = gia*soluong;
	}

	public giohangbean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getMasach() {
		return masach;
	}
	public void setMasach(String masach) {
		this.masach = masach;
	}
	public String getTensach() {
		return tensach;
	}
	public void setTensach(String tensach) {
		this.tensach = tensach;
	}
	public String getTacgia() {
		return tacgia;
	}
	public void setTacgia(String tacgia) {
		this.tacgia = tacgia;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public Long getGia() {
		return gia;
	}
	public void setGia(Long gia) {
		this.gia = gia;
	}
	public Long getSoluong() {
		return soluong;
	}
	public void setSoluong(Long soluong) {
		this.soluong = soluong;
	}
	public Long getThanhtien() {
		return gia*soluong;
	}
	public void setThanhtien(Long thanhtien) {
		this.thanhtien = thanhtien;
	}
	
}
