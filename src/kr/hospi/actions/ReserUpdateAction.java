package kr.hospi.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import kr.hospi.beans.Reservation;
import kr.hospi.dao.ReservationDAO;

public class ReserUpdateAction extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//admin:1, client:2 (누가 update를 원하는지 구분)
		String state = request.getParameter("st");
		
		if(state.equals("1")){
			//update를 위한 정보들 받아오기
			//----> 수정사항: 로그인 후session.getAttribute("member")에 저장되있는 mNO도 수정시 이용할 것임
			//			    ----> sql에 mNO추가해야함
			String rNO = request.getParameter("rNO");
			String time[] = request.getParameter("rTime").split("-");
			String cate = request.getParameter("rCate");
			String date = request.getParameter("rDate");
			String rContent = request.getParameter("rContent");
			String rState = request.getParameter("rState");
			
			ReservationDAO dao = new ReservationDAO();
			
			//받아온 정보를 Reservation(beans)에 입력
			Reservation reser = new Reservation();
			reser.setrNO(rNO);
			reser.setpTypeNO(cate);
			reser.setrDate(date);
			reser.setrFTime(time[0]);
			reser.setrLTime(time[1]);
			reser.setrContent(rContent);
			reser.setrState(rState);
			
			request.setAttribute("rNO", rNO);

			//update실행
			if(dao.updateAd(reser)){			
				//성공 시 해당 예약(rID)의 예약상세 페이지으로 이동
				return mapping.findForward("successAd");
			}
			
			//실패 시 다시 예약(rID)의 예약 수정  페이지로 이동
			return mapping.findForward("failAd");
			
		}else {
			//update를 위한 정보들 받아오기
			//----> 수정사항: 로그인 후session.getAttribute("member")에 저장되있는 mNO도 수정시 이용할 것임
			//			    ----> sql에 mNO추가해야함
			String rNO = request.getParameter("rNO");
			String time[] = request.getParameter("rTime").split("-");
			String cate = request.getParameter("rCate");
			String date = request.getParameter("rDate");
			String rContent = request.getParameter("rContent");
			String rState = request.getParameter("rState");
			
			ReservationDAO dao = new ReservationDAO();
			
			//받아온 정보를 Reservation(beans)에 입력
			Reservation reser = new Reservation();
			reser.setrNO(rNO);
			reser.setpTypeNO(cate);
			reser.setrDate(date);
			reser.setrFTime(time[0]);
			reser.setrLTime(time[1]);
			reser.setrContent(rContent);
			reser.setrState(rState);
			
			//update실행
			if(dao.update(reser)){			
				//성공 시 해당 회원(mID)의 예약목록 페이지으로 이동
				return mapping.findForward("success");
			}
			
			//실패 시 다시 예약 수정 페이지로 이동
			return mapping.findForward("fail");
		}
		
	}
}
