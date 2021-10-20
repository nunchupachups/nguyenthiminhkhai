package bo;

import java.util.ArrayList;

import bean.Khoabean;
import bean.SinhVienbean;
import dao.SinhViendao;

public class SinhVienbo {
	SinhViendao svdao= new SinhViendao();
	public ArrayList<SinhVienbean> getsv(){
		return svdao.getsv();	 
	}
	public ArrayList<SinhVienbean> svkhoa(String makhoa){
		ArrayList<SinhVienbean> ds=svdao.getsv();
		ArrayList<SinhVienbean> ds1= new ArrayList<SinhVienbean>();
		for(SinhVienbean k:ds)
			if(k.getMalop().equals(makhoa)) {
				ds1.add(k);
			}
		return ds1;
	}
	public SinhVienbean thongtinsv(String masv) {
		ArrayList<SinhVienbean> ds=svdao.getsv();
		for(SinhVienbean sv:ds)
			if(sv.getMasv().equals(masv)) 
				return sv;
		return null;
	}
	public ArrayList<SinhVienbean> timkiemsv(String hoten){
		ArrayList<SinhVienbean> ds=svdao.getsv();
		ArrayList<SinhVienbean> ds1= new ArrayList<SinhVienbean>();
		for(SinhVienbean sv:ds)
			if(sv.getHoten().toLowerCase().contains(hoten.toLowerCase())) {
				ds1.add(sv);}
		return ds1;
	}
}
