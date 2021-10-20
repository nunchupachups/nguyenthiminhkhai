package dao;

import java.util.ArrayList;

import bean.Khoabean;
import bean.SinhVienbean;

public class SinhViendao {
	public ArrayList<SinhVienbean> getsv(){
		ArrayList<SinhVienbean> ds= new ArrayList<SinhVienbean>();
		ds.add(new SinhVienbean("sv1", "Nguyễn Thanh Nam", "Huế", 8.6, "cntt"));
	    ds.add(new SinhVienbean("sv2", "Dương Thị Kiều Trang", "Quảng Trị", 7.5, "ly"));
	    ds.add(new SinhVienbean("sv3", "Hà Xuân Nghĩa", "Huế",8.3, "dia"));
	  	ds.add(new SinhVienbean("sv4", "Bùi Thị Anh Thư", "Quảng trị", 9.7, "toan"));
	  	ds.add(new SinhVienbean("sv5", "Đỗ Thị Thuận", "Hà Nội",7.8, "dia"));
	  	return ds;
	}
	
}
