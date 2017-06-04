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
		
		System.out.println("1 :"+request.getParameter("pTypeNO"));
		//여기까지 들어옴.
		
	    if(action.equals("update")){//수정요청
	      Counsel bean = new Counsel();
	    	System.out.println("2 :"+request.getParameter("pTypeNO"));
	    	
	    	bean.setcNO(request.getParameter("cNO"));
		  	bean.setpTypeNO(request.getParameter("pTypeNO"));
			bean.setmID(request.getParameter("mID"));
			bean.setcTitle(request.getParameter("cTitle"));
			bean.setcContent(request.getParameter("cContent"));
			
		//	System.out.println(request.getParameter("cNO"));
		//여기까지 들어옴.
			
			 String state = request.getParameter("state");
			 
			if(state.equals("공개")){//공개여부가 공개라면
				bean.setState("1");//bean에 데이터 값을 공개 대신 '1'로 치환해서 보내라.
			}else{ //공개여부가 비공개라면
				bean.setState("2"); //bean에 데이터 값을 공개 대신 '2'로 치환해서 보내라.
			}
			
		    
			System.out.println("확인:"+dao.update(bean));
		   if(dao.update(bean)){//수정 성공
			   List<Counsel> list = dao.selectAll();
			  
			   System.out.println("수정list"+list);
			   session.setAttribute("list",list);

				status = true;
			}else{
				status = false;
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