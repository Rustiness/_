package kr.hospi.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import kr.hospi.beans.Member;
import kr.hospi.beans.Reservation;
import kr.hospi.dao.MemberDAO;
import kr.hospi.dao.ReservationDAO;

public class ReserInsertAction extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//admin:1, client:2 (누가 update를 원하는지 구분)
		String state = request.getParameter("st");
		
		if(state.equals("1")){
			//예약을 진행할 회원의 mNO가져오기
			String mID = request.getParameter("mID");
			MemberDAO mDao = new MemberDAO();
			String mNO = mDao.selmNO(mID);
			
			//insert할 예약 정보들 받아오기
			String time[] = request.getParameter("rTime").split("-");
			String cate = request.getParameter("rCate");
			String date = request.getParameter("rDate");
			//String content = request.getParameter("rContent");
	
			//reservationDAO 객체생성
			ReservationDAO dao = new ReservationDAO();
			
			//받아온 정보를 Reservation(beans)에 입력
			Reservation reser = new Reservation();
			reser.setmNO(mNO);
			reser.setpTypeNO(cate);
			reser.setrDate(date);
			reser.setrFTime(time[0]);
			reser.setrLTime(time[1]);
			//reser.setrContent(content);
			reser.setrState("1");
			
			//insert실행
			if(dao.insertAd(reser)){			
				//성공시 예약 리스트로 이동
				return mapping.findForward("successAd");
			}
			
			//실패시 예약신청 페이지로 이동
			return mapping.findForward("failAd");
			
		}else{
			//로그인되어있는 회원의 정보 가져오기
			Member user = (Member)request.getSession().getAttribute("user");
			String mNO = user.getmNO();
			
			//insert할 예약 정보들 받아오기
			String time[] = request.getParameter("rTime").split("-");
			String cate = request.getParameter("rCate");
			String date = request.getParameter("rDate");
	
			//reservationDAO 객체생성
			ReservationDAO dao = new ReservationDAO();
			
			//받아온 정보를 Reservation(beans)에 입력
			Reservation reser = new Reservation();
			reser.setmNO(mNO);
			reser.setpTypeNO(cate);
			reser.setrDate(date);
			reser.setrFTime(time[0]);
			reser.setrLTime(time[1]);
			//reser.setrContent("a");
			reser.setrState("1");
			
			//insert실행
			if(dao.insert(reser)){			
				//성공시 해당 회원(mID)의 예약 목록으로 이동
				return mapping.findForward("success");
			}
			
			//실패시 예약신청 페이지로 이동
			return mapping.findForward("fail");
		}
	}
}
