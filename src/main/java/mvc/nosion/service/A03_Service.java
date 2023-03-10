package mvc.nosion.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import mvc.nosion.dao.A04_Dao;
import resource.nosion.vo.Member;

@Service
public class A03_Service {

	@Autowired(required=false)
	private A04_Dao dao;
	
	public Member NE_CheckMem(Member sch) {
		return dao.NE_CheckMem(sch);
	}
	
	public Member NE_CheckEmail(Member sch) {
		return dao.NE_CheckEmail(sch);
	}
	
	public Member NE_CheckKEmail(Member sch) {
		return dao.NE_CheckKEmail(sch);
	}
	
	public int NE_SignUp(Member ins) {
		return dao.NE_SignUp(ins);
	}
	
	public Member NE_Login(Member log) {
		System.out.println("Sdd"+log.getSnsemail());

		if(log.getEmail()==null) log.setEmail("aaaaaaaa");
		if(log.getSnsemail()==null) {
		if(log.getKakaoemail()==null) {log.setSnsemail(log.getGoogleemail());}
		if(log.getGoogleemail()==null) {log.setSnsemail(log.getKakaoemail());}
		}
		return dao.NE_Login(log);
	}
	
	public void NE_SnsEmailPlus(Member upt) {
		dao.NE_SnsEmailPlus(upt);
	}
}
