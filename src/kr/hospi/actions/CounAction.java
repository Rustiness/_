package kr.hospi.actions;

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

public class CounAction extends Action {
	int rCurrentPage;
	int rPageSize=5;

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
	//	String address = request.getRemoteAddr();//접속 클라이언트의 ip정보

		String action = request.getParameter("action");
		ActionForward forward = null;
		boolean status = true;
		
		if(action == null || action.equals("list")){
/*		List<Counsel> list = dao.selectAll();	
			session.setAttribute("list",list);*/
			
	//=====================페이징 작업 코드 부분		
		   
		         String cPage = request.getParameter("rpage");
		         
		         
		         if(cPage==null){
		            rCurrentPage=1;
		         }else{
		            rCurrentPage = Integer.parseInt(cPage);
		         }
		         
		         int rPageRange=5;
		         int rPageRangeGroup=0;
		         int rStartPageRange=1;
		         
		         if(rCurrentPage%rPageRange==0){
		            rPageRangeGroup = rCurrentPage/rPageRange;
		         }else{
		            rPageRangeGroup = rCurrentPage/rPageRange+1;
		         }
		         
		         rStartPageRange = (rPageRangeGroup-1)*rPageRange+1;
		         
		         int tPrev = rStartPageRange -1;
		         int tNext = rStartPageRange + rPageRange;
		         
		         int totalRecord = dao.counCount();
		         int totalPage=totalRecord/rPageSize;
		         if(totalRecord%rPageSize>0){
		            totalPage++;
		         }
		         List<Counsel> list2 = dao.counPage(rCurrentPage, rPageSize);
		         
		         session.setAttribute("list",list2);
		         session.setAttribute("rCurrentPage", rCurrentPage);
		         session.setAttribute("totalPage", totalPage);
		         session.setAttribute("rStartPageRange", rStartPageRange);
		         session.setAttribute("rPageRangeGroup", rPageRangeGroup);
		         session.setAttribute("tPrev", tPrev);
		         session.setAttribute("tNext", tNext);
		         session.setAttribute("rPageRange", rPageRange);
		         
		         //forward = mapping.findForward("rlist");
	//=====================페이징 작업 코드 부분 끝		
		}else if(action.equals("select")){
			//조회수 증가전 bean
			Counsel bean = dao.select(request.getParameter("cNO"));	
			 dao.hitUpdate(bean);//조회수 증가

			//조회수 증가후 bean
			Counsel bean2 = dao.select(request.getParameter("cNO"));	
		    
			session.setAttribute("choice",bean2);
			
		}else if(action.equals("writer")){
			String search_name = request.getParameter("word");//검색
		//	System.out.println(search_name);
			//글 검색 부분
			String field = request.getParameter("field");
			//System.out.println("field: "+field);
		
			
				List<Counsel> searchlist =  dao.selectName(search_name);
				 
				 System.out.println("검색리스트: "+searchlist);
				session.setAttribute("list2",searchlist);
				
			
		}else if(action.equals("insert")){
			Counsel bean = new Counsel();
			
			bean.setpTypeNO(request.getParameter("pTypeNO"));
			bean.setmNO(request.getParameter("mNO"));
			bean.setcTitle(request.getParameter("cTitle"));
			bean.setcContent(request.getParameter("cContent"));
			bean.setState(request.getParameter("state"));
			bean.setcCount(0);
			
			System.out.println("state: "+request.getParameter("state"));
				
			 
			if (dao.insert(bean)){//dao에 bean값이 insert 됐다면
				List<Counsel> list2 = dao.counPage(rCurrentPage, rPageSize);
			
			//list.add(bean);
				
				//System.out.println("list"+list2);
				session.setAttribute("list",list2);
			
				status = true;
			}else{
				status = false;
			}
			}//(action.equals("insert")){
	
		if(status){
			forward = mapping.findForward("success");//액션포워드 객체에 success문자열을 넣는다.
		}else{
			forward = mapping.findForward("fail");
		}
	    return forward;
}
		
}
