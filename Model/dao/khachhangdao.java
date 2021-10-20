package dao;

import java.util.ArrayList;

import bean.khachhangbean;

public class khachhangdao {
	public ArrayList<khachhangbean> getkhachhang(){
		ArrayList<khachhangbean> ds=new ArrayList<khachhangbean>();
		ds.add(new khachhangbean("kh01","Nguyễn Văn Tèo", "Hà Nội","123456"));
		ds.add(new khachhangbean("kh02","Bùi Thị Anh Thư", "Huế","123457"));
		ds.add(new khachhangbean("kh03","Lê Thị Mỹ Linh", "Quảng Trị","123458"));
		ds.add(new khachhangbean("kh04","Hà Xuân Nghĩa", "Quảng Ngãi","123459"));
		ds.add(new khachhangbean("kh05","Dương Thị Kiều Trang", "Hà Nội","123450"));
		return ds;
	}
}
