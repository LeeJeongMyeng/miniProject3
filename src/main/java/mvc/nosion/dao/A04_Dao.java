package mvc.nosion.dao;

import java.util.List;

import resource.nosion.vo.Member;



public interface A04_Dao {
	public Member NE_CheckMem(Member sch); //이름,주민 중복검사
	public Member NE_CheckEmail(Member sch); //이메일 중복검사
	public Member NE_CheckKEmail(Member sch); //이메일 중복검사
	public int NE_SignUp(Member ins);
	public Member NE_Login(Member log);
	public void NE_SnsEmailPlus(Member upt);
}

