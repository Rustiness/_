package kr.hospi.actions;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import kr.hospi.beans.PlasticItem;
import kr.hospi.beans.PlasticType;
import kr.hospi.dao.PlasticItemDAO;

public class PlasticItAction extends Action {
		//Action은 모든 pItem정보를 보여주기 위한 page
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//요청(파라미터)분석, 사용자 입력 데이터 얻기, 모델호출(결과를 영역저장), 페이지이동
				String action = request.getParameter("action");//요청 분석

				if (action == null) {
						action = "list"; //액션이 NULL 이었을때 기본값을 리스트 지정.
				}
		//System.out.println("executeItAction()");
		
		PlasticItemDAO dao = new PlasticItemDAO();
		ActionForward forward = null; //이동할 페이지 저장
		//Print-out pItem info 
		List<PlasticItem> list = null;
		PlasticItem pitem = new PlasticItem();
		String pItemNO = null; //pItemNO 기준
		
		switch (action) {
		case "list"://직원목록  if(action==null || action.equals("list"))
		

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
						  List<PlasticItem> pagelist = dao.selectPage(page,recordCount); //page= 1, recordCount(한페이지 행갯수)=5
						  
						  System.out.println("3");
						  
						  
						 request.setAttribute("startPage", startPage);	
						 request.setAttribute("endPage", endPage);	
						 request.setAttribute("list", pagelist);	
						 request.setAttribute("page", page);  //"/client/counsel/coun_list.jsp"
						 request.setAttribute("totalPage", totalPage); //totalPage = 전체 리스트 행의 갯수 / 한 페이지에 보여질 행의 갯수 로써 행 갯수가 증가하면 페이징[1][2][3] 이런식으로 증가하도록 값을 보내주는것.
						  System.out.println("dao.selectPage : "+pagelist);
						  System.out.println("4");
						  System.out.println("page :"+page);
						  System.out.println("totalPage :"+totalPage);
			
			
						
			
			//list = dao.selectAll();
			//(뷰와) 데이터 공유 - request(forward 이동 시), session(forward 이동, redirect 이동 시)
		//request.setAttribute("listpItem", list);
		//System.out.println("list 성공"+list);
		
		forward= mapping.findForward("selectAll");
		break;
		case "info": //수정폼 이전 정보 페이지
			pItemNO = (String) request.getParameter("pItemNO");
			//System.out.println(pItemNO);
			pitem = dao.selectpItemNO(pItemNO);
			//System.out.println("pitem"+ pitem);
			request.setAttribute("pItemInfolist", pitem);
			forward = mapping.findForward("selectInfo");
			break;
		case "modify": //수정폼
			pItemNO = (String) request.getParameter("pItemNO");
			//System.out.println("update:"+pItemNO);
			pitem = dao.selectpItemNO(pItemNO);
			//System.out.println("update 성공 확인여부:"+pitem);
			request.setAttribute("pItemInfolist", pitem);
			
				forward = mapping.findForward("selectModify");
			
			break;
		case "update": //수정요청
			
			pItemNO = (String) request.getParameter("pItemNO");
			
			
			String pItemName = request.getParameter("pItemName");
			String pItemValue = request.getParameter("pItemValue");
			String state = request.getParameter("state");
			//System.out.println("pItemName:"+pItemName);
			//System.out.println("pItemValue:"+pItemValue);
			//System.out.println("state:"+state);
			
			pitem.setpItemNO(pItemNO);
			pitem.setpItemName(pItemName);
			pitem.setpItemValue(pItemValue);
			pitem.setState(state);
			if(dao.update(pitem)){//update에 성공한다면
				pitem=dao.selectpItemNO(pItemNO);
				request.setAttribute("pItemInfolist", pitem);
				
				forward = mapping.findForward("selectInfo");
			}//if
			break;
	}//switch

	return forward;
				
	}//execute
}
