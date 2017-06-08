package kr.hospi.actions;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import kr.hospi.beans.Counsel;
import kr.hospi.dao.CounselDAO;

public class CounModifyAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		/*  private String cNO;//상담건에 대한 식별번호
		  private String mID;//회원아이디
		  private String pTypeNO;//회원이 선택한 관심분야
		  private Date cDate;//글 작성 날짜
		  private String cTitle;//회원이 작성한 글 제목
		  private String cContent;//회원이 작성한 글 내용
		  private int cCount;//글을 읽은 조회수
		  private String imageURL;//작성글에 첨부된 이미지 주소
		  private Date eDate;//답변 작성 날짜
		  private String eID;//답변 작성한 직원아이디
		  private String eComent;//답변 내용
		  private String state;//글의 활성화 유무??*/		
		
		CounselDAO dao = new CounselDAO(); 
		HttpSession session = request.getSession();

		String action = request.getParameter("action");
		ActionForward forward = null;
		boolean status = true;
		System.out.println("modify action:: "+ action);
		System.out.println("1 :"+request.getParameter("pTypeNO"));
		
	    if(action.equals("update")){//수정요청
	      Counsel bean = new Counsel();
	    	System.out.println("2 :"+request.getParameter("pTypeNO"));
	    	
	    	String pTypeNO = request.getParameter("pTypeNO");
	    	System.out.println("wowWow");
	    	
	    	if(pTypeNO.equals("눈성형")){//브라우저에 보여지는 관심분야를 DB에 넣을때는 알파벳으로 바꾸기.
	    		bean.setpTypeNO("EY");
	    	}else if(pTypeNO.equals("코성형")){
	    		bean.setpTypeNO("NO");
	    	}else if(pTypeNO.equals("얼굴성형")){
	    		bean.setpTypeNO("FA");
	    	}else if(pTypeNO.equals("체형성형")){
	    		bean.setpTypeNO("BO");
	    	}else if(pTypeNO.equals("가슴성형")){
	    		bean.setpTypeNO("BR");
	    	}
	    	System.out.println(bean);
	    		System.out.println(">>>>>>>>>>>>>>"+request.getParameter("mNO"));
	    	
	    	System.out.println("=====================");	
	    	bean.setcNO(request.getParameter("cNO"));
			bean.setmNO(request.getParameter("mNO"));
			bean.setcTitle(request.getParameter("cTitle"));
			bean.setcContent(request.getParameter("cContent"));
			
			System.out.println("cNO: "+request.getParameter("cNO"));
			System.out.println("pTypeNO: "+request.getParameter("pTypeNO"));
			System.out.println("mNO: "+request.getParameter("mNO"));
			System.out.println("cTitle: "+request.getParameter("cTitle"));
			System.out.println("cContent: "+request.getParameter("cContent"));
			
			String state = request.getParameter("state");
			System.out.println("state: "+state);
		    
			
			System.out.println("확인:"+dao.update(bean));
		   if(dao.update(bean)){//수정 성공
			   List<Counsel> list = dao.selectAll();
			  
			   System.out.println("수정list"+list);
			   session.setAttribute("list",list);

				status = true;
			}else{
				status = false;
			}
		}else if(action.equals("remove")){//삭제요청 (DB state ---> 3)변경해서 삭제된것처럼 보이게
			String cNO = request.getParameter("cNO");
			System.out.println("삭제할 cNO="+ cNO);
			if(dao.removecNO(cNO)){
				status = true;
				System.out.println("#온라인 상담목록 삭제성공");
			}else{
				status = false;
				System.out.println("#온라인 상담목록 삭제실패");
			}
		}
		
		if(status){
			forward = mapping.findForward("success");//액션포워드 객체에 success문자열을 넣는다.
		}else{
			forward = mapping.findForward("fail");
		}


	    return forward;
	}
}