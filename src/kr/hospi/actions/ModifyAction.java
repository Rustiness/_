package kr.hospi.actions;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import kr.hospi.beans.AdMember;
import kr.hospi.beans.Member;
import kr.hospi.dao.MemberDAO;

public class ModifyAction extends Action{
	ActionForward forward;//포워드 객체 선언
	
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {//execute 메소드
		
		request.setCharacterEncoding("UTF-8");
		
		String mID=request.getParameter("mID");//아이디
		String pass=request.getParameter("pass");//비밀번호
		String qNO=request.getParameter("qNO");//질문
		String answer=request.getParameter("answer");//답
		String name=request.getParameter("name");//이름
		Date birth = Date.valueOf(request.getParameter("birth1") + "-" + request.getParameter("birth2") + "-"
				+ request.getParameter("birth3"));//생일
		String sex=request.getParameter("sex");//성별
		String tel=request.getParameter("tel1")+"-"
					+request.getParameter("tel2")+"-"
					+request.getParameter("tel3");//전화번호
		String email="";
			if(request.getParameter("select_email")==""){
				//'직접 입력'을 선택했을 시, 이메일 뒷자리는 직접 입력한 것으로,
				email=request.getParameter("email1")+"@"
						+request.getParameter("email2");
			}else{//아닐 경우 옵션에서 선택한 것으로 설정된다.
				email=request.getParameter("email1")+"@"
						+request.getParameter("select_email");//이메일
			}
			
		String pTypeNO="";//관심사
			String[] pTypeNOs=request.getParameterValues("pTypeNO");//관심사를 처음엔 문자배열로 받음.
			for(int i=0; i<pTypeNOs.length; i++){//체크박스에서 고른 여러 관심사를 배열로 받음.
				if(i==0){
					pTypeNO=pTypeNOs[i];
				}else{
					pTypeNO=pTypeNO+","+pTypeNOs[i];
				}//따옴표는 관심사와 관심사 사이에만 붙도록 제어
			}// --> 문자열로 바꿈.
		
		AdMember mem = new AdMember();
		//set mID, pass, qNO, answer, name, birth, sex, tel, email, pTypeNO!
			mem.setmID(mID);
			mem.setPass(pass);
			mem.setqNO(qNO);
			mem.setAnswer(answer);
			mem.setName(name);
			mem.setBirth(birth);
			mem.setSex(sex);
			mem.setTel(tel);
			mem.setEmail(email);
			mem.setpTypeNO(pTypeNO);
			//이상의 값들로 회원(Member) 빈을 객체 생성한다.
		
		MemberDAO dao = new MemberDAO();//DAO 객체 생성
		if(dao.update(mem)){//DAO에서 회원수정정보를 입력하는 메소드 insert를 호출한다.(파라미터는 회원가입정보 빈)
			request.getSession().setAttribute("modifyMem", mem);//세션에 "modifyMem"라는 값으로 빈 저장
			forward = mapping.findForward("success");//작업 성공시 포워드 객체에 "success"를 매핑.
		}else{
			forward = mapping.findForward("fail");//작업 성공시 포워드 객체에 "fail"를 매핑.
		}
		
		return forward;//모든 작업이 끝나면 포워드 객체를 리턴.
	}//execute
}
