package bo;

import java.util.ArrayList;

import bean.giohangbean;


public class giohangbo {
	ArrayList<giohangbean> ds=new ArrayList<giohangbean>();
	public ArrayList<giohangbean> getgiohang() {
		return ds;
	}
	public ArrayList<giohangbean> them(String ms, String ts, String tg, String anh, Long gia, Long sl) {
		for(giohangbean k:ds)
			if(k.getMasach().equals(ms)) {
				k.setSoluong(k.getSoluong()+1);
				return ds;
			}
		ds.add(new giohangbean(ms, ts, tg, anh, gia, sl));
		return ds;
	}
	public ArrayList<giohangbean> xoa(String ms) {
		for(giohangbean gh:ds)
			if(gh.getMasach().equals(ms)) {
				ds.remove(gh);	
				break;
			}
						
		return ds;
	}
	public ArrayList<giohangbean> xoaAll() {
		ds.removeAll(ds);			
		return ds;
	}
	public ArrayList<giohangbean> sua(String ms, Long sl){
		for(giohangbean gh:ds)
			if(gh.getMasach().equals(ms))
				gh.setSoluong(sl);
		return ds;
	}
	public Long tongtien() {
		Long tt=(long) 0;
		for(giohangbean gh:ds)
			tt+=gh.getThanhtien();
		return tt;
	}
	public Long tongsach() {
		Long ts=(long) 0;
		for(giohangbean gh:ds)
			ts+=gh.getSoluong();
		return ts;
	}
}
