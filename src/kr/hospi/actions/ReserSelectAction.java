package kr.hospi.actions;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import kr.hospi.beans.Reservation2;
import kr.hospi.dao.ReservationDAO;

public class ReserSelectAction extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//5개의 select를 구분하기위한 요청 분석
		String reser = request.getParameter("reser"); //select요청 분석
		System.out.println(reser);
		
		ActionForward forward = null;
		if(reser==null) reser="all";
		if(reser.equals("mInfo")){//고객용: ID당 예약목록보기 요청이 들어왔을 때
			String mNO = "이번";//로그인 후 저장된 session.getAttribute("member") ---> mNO를 가져올 계획
			ReservationDAO dao = new ReservationDAO();
			request.setAttribute("reser", dao.selectmNO(mNO));
			
			//예약목록 페이지로 이동
			forward = mapping.findForward("reser_info");	
			
		}else if(reser.equals("rInfo")){//고객용: 예약번호당 예약목록보기 요청이 들어왔을 때
			String rNO = request.getParameter("rNO");
			ReservationDAO dao = new ReservationDAO();
			request.setAttribute("reser", dao.selectrNO(rNO));
			
			//예약 수정페이지로 이동
			forward = mapping.findForward("reser_modify");	
			
		}else if(reser.equals("arInfo")){//관리자용: 예약번호당 예약목록보기 요청이 들어왔을 때
			String rNO;
			if(request.getAttribute("rNO")!=null)
				rNO = (String)request.getAttribute("rNO");//수정 후 수정된 상세보기할때(setAttribute로 넘김)
			else rNO = request.getParameter("rNO");//예약 선택 후 상세보기할때(파라미터로 넘김)
			
			if(rNO.substring(0, 2).equals("re")){//수정페이지에 원래 정보를 나타내주기위한 select
				ReservationDAO dao = new ReservationDAO();
				request.setAttribute("reser", dao.selectAdrNO(rNO.substring(2)));

				//수정하는 페이지로 이동
				forward = mapping.findForward("ad_reser_modify");
				
			}else{//해당 예약정보를 보여주기위한 select
				ReservationDAO dao = new ReservationDAO();
				request.setAttribute("reser", dao.selectAdrNO(rNO));
				
				//예약상세 페이지로 이동
				forward = mapping.findForward("ad_reser_info");	
				
			}
		}else if(reser.equals("cate")){//관리자용: 카테고리별 예약목록보기 요청이 들어왔을 때
			
			forward = mapping.findForward("#");	
			
		}else if(reser.equals("time")){//관리자용: 시간별 예약목록보기 요청이 들어왔을 때
			
			forward = mapping.findForward("#");	
			
		}else if(reser.equals("all")){//관리자용: 모든예약목록보기 요청이 들어왔을 때(reser=all)
			
			forward = mapping.findForward("ad_reser");	
		}
		
		return forward;
	}
}
