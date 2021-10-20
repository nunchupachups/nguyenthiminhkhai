package dao;

import java.util.ArrayList;

import bean.loaibean;

public class loaidao {
	public ArrayList<loaibean> getloai(){
		ArrayList<loaibean> ds =new ArrayList<loaibean>();
		ds.add(new loaibean("cntt", "Công nghệ thông tin"));
	 	ds.add(new loaibean("yte", "Y tế"));
	 	ds.add(new loaibean("sinh", "Sinh học"));
	 	ds.add(new loaibean("vatly", "Vật ký"));
	 	ds.add(new loaibean("dia", "Địa lý"));
	 	return ds;
	}
}
