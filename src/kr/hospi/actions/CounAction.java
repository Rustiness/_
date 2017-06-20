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
import kr.hospi.beans.Member;
import kr.hospi.dao.CounselDAO;
import kr.hospi.dao.MemberDAO;

public class CounAction extends Action {
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
			
	//=====================검색 시 실행할 페이징 작업 코드 부분		
		   
			  String pageStr = request.getParameter("page"); //이건 어디서 값을 얻어오는건지 잘;;
			   
			  int page; 
			  if(pageStr==null){
				  page=1;
			  }else{
			      page= Integer.parseInt(pageStr);
			  }
			  System.out.println("2");
			  
			  int startPage = (page - (page-1)%5);
			  System.out.println("page: "+page);
			  int endPage = startPage + 4;
			  int recordCount = 5; // 한 페이지에 보여질 리스트 행의 갯수
			  int totalRecord= dao.selectCount(); // 전체 리스트 행의 갯수 , 현재 DB에 저장되어있어서 불러올때 나올 selectAll 갯수 같은 개념.
			  int totalPage=totalRecord/recordCount; // 전체페이지 = 전체 리스트 행의 갯수 / 한 페이지에 보여질 행의 갯수  ==> 전체 리스트 행 갯수 32개이면 / 5 
			  if(totalRecord%recordCount>0){ //전체 행 갯수 % 한 페이지 행 갯수 > 0 = 즉, 전체 갯수는 3개인데 한 페이지 행 갯수가 5개이면 페이징이 필요 없다. [1][2] 이런식으로 필요가 없지.
				  totalPage++; //그런데 전체 행 갯수가 한 페이지 행 갯수보다 크면 페이징 코드 [1] 생성되도록. 
			  }
			  System.out.println("totalRecord :"+totalRecord);
			  //DB에서 전체 검색(조회)
			  List<Counsel> pagelist = dao.selectPage(page,recordCount); //page= 1, recordCount(한페이지 행갯수)=5
			  
			  System.out.println("3");
			  System.out.println("---------------------------------------------------------------");
			  session.setAttribute("startPage", startPage);	
			  session.setAttribute("endPage", endPage);	
			  session.setAttribute("list", pagelist);	
			  session.setAttribute("page", page);  //"/client/counsel/coun_list.jsp"
			  session.setAttribute("totalPage", totalPage); //totalPage = 전체 리스트 행의 갯수 / 한 페이지에 보여질 행의 갯수 로써 행 갯수가 증가하면 페이징[1][2][3] 이런식으로 증가하도록 값을 보내주는것.
			  System.out.println("dao.selectPage : "+pagelist);
			  System.out.println("4");
			  System.out.println("page :"+page);
			  System.out.println("totalPage :"+totalPage);
			  
	//=====================검색 시 실행할 페이징 작업 코드 부분 끝		
		}else if(action.equals("select")){
			//Counsel bean = new Counsel();
			//String mID_check=bean.getmID();
			//String mID = (Member)request.getSession().getAttribute("user").getmNO();
			//if(mID=mID_check){
			//	게시글열림		   
			String cNO =  request.getParameter("cNO");
			System.out.println("select cNO 첫번째 :"+cNO);
			
			Counsel bean = dao.select(cNO);	
			String mNO = request.getParameter("mNO");
			System.out.println("++++++++++++++++++++++++++++++"+bean.getmNO());
			if(bean.getmNO() != mNO){
				System.out.println("메롱 다르지롱");
			}else{
				System.out.println("오 ㅆㅂ 마즘@!");
			}
			
			
			if(session.isNew()|| !cNO.equals(session.getAttribute("cNO"))){
				System.out.println("isNew 후");
				session.setAttribute("cNO",bean.getcNO());
				dao.hitUpdate(bean);//조회수 증가
			}
			//조회수 증가전 bean
				System.out.println("cNO : "+cNO);
				System.out.println("isNew 전");

		//조회수 증가후 bean
				bean = dao.select(cNO);	
				session.setAttribute("choice",bean);
		
		}else if(action.equals("writer")){
			String search_name = request.getParameter("word");//검색
		//	System.out.println(search_name);
			//글 검색 부분
			String field = request.getParameter("field");
			//System.out.println("field: "+field);

				List<Counsel> searchlist =  dao.selectName(search_name);
				 
				 System.out.println("검색리스트: "+searchlist);
				session.setAttribute("list2",searchlist);
				
				//=====================검색 시 실행할 페이징 작업 코드 부분		
				   
				  String pageStr = request.getParameter("page"); //이건 어디서 값을 얻어오는건지 잘;;
				   
				  int page; 
				  if(pageStr==null){
					  page=1;
				  }else{
				      page= Integer.parseInt(pageStr);
				  }
				  System.out.println("2");
				  
				  int startPage = (page - (page-1)%5);
				  int endPage = startPage + 4;
				  int recordCount = 5; // 한 페이지에 보여질 리스트 행의 갯수
				  int totalRecord= dao.selectCount(); // 전체 리스트 행의 갯수 , 현재 DB에 저장되어있어서 불러올때 나올 selectAll 갯수 같은 개념.
				  int totalPage=totalRecord/recordCount; // 전체페이지 = 전체 리스트 행의 갯수 / 한 페이지에 보여질 행의 갯수  ==> 전체 리스트 행 갯수 32개이면 / 5 
				  if(totalRecord%recordCount>0){ //전체 행 갯수 % 한 페이지 행 갯수 > 0 = 즉, 전체 갯수는 3개인데 한 페이지 행 갯수가 5개이면 페이징이 필요 없다. [1][2] 이런식으로 필요가 없지.
					  totalPage++; //그런데 전체 행 갯수가 한 페이지 행 갯수보다 크면 페이징 코드 [1] 생성되도록. 
				  }
				  System.out.println("totalRecord :"+totalRecord);
				  //DB에서 전체 검색(조회)
				  List<Counsel> pagelist = dao.selectPage(page,recordCount); //page= 1, recordCount(한페이지 행갯수)=5
				  
				  System.out.println("3");
				  System.out.println("==============================================================");

				  
				  session.setAttribute("startPage", startPage);	
				  session.setAttribute("endPage", endPage);	
				  session.setAttribute("list", pagelist);	
				  session.setAttribute("page", page);  //"/client/counsel/coun_list.jsp"
				  session.setAttribute("totalPage", totalPage); //totalPage = 전체 리스트 행의 갯수 / 한 페이지에 보여질 행의 갯수 로써 행 갯수가 증가하면 페이징[1][2][3] 이런식으로 증가하도록 값을 보내주는것.
				  System.out.println("dao.selectPage : "+pagelist);
				  System.out.println("4");
				  System.out.println("page :"+page);
				  System.out.println("totalPage :"+totalPage);
				  
		//=====================검색 시 실행할 페이징 작업 코드 부분 끝				
				
			
		}else if(action.equals("insert")){
			
			Counsel bean = new Counsel();
			
			String mNO = request.getParameter("mNO");
			System.out.println("mNO============================= :"+mNO);
			bean.setpTypeNO(request.getParameter("pTypeNO"));
			/*Member mem = (Member)request.getSession().getAttribute("user");
			String mNO = mem.getmNO();*/
			bean.setmNO(mNO);
			bean.setcTitle(request.getParameter("cTitle"));
			bean.setcContent(request.getParameter("cContent"));
			bean.setState(request.getParameter("state"));
			bean.setcCount(0);
			
			System.out.println("state: "+request.getParameter("state"));
			 
			if (dao.insert(bean)){//dao에 bean값이 insert 됐다면
				bean = dao.selectmNO(mNO);
				
		          List<Counsel> list2 = dao.selectAll();
			
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
