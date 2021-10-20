package bo;

import java.util.ArrayList;

import bean.khachhangbean;
import dao.khachhangdao;

public class khachhangbo {
	khachhangdao khdao=new khachhangdao();
	public ArrayList<khachhangbean> getkhachhang(){
		return khdao.getkhachhang();
	}

	public khachhangbean Ktdn(String makh, String matkhau) {
		ArrayList<khachhangbean> ds=khdao.getkhachhang();
		for(khachhangbean kh:ds)
			if (kh.getMakhachhang().equals(makh)&&(kh.getMatkhau().equals(matkhau)))
				return kh;
		return null;
	}
	
}
