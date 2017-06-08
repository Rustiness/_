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
		/*  private String cNO;//���ǿ� ���� �ĺ���ȣ
		  private String mID;//ȸ�����̵�
		  private String pTypeNO;//ȸ���� ������ ���ɺо�
		  private Date cDate;//�� �ۼ� ��¥
		  private String cTitle;//ȸ���� �ۼ��� �� ����
		  private String cContent;//ȸ���� �ۼ��� �� ����
		  private int cCount;//���� ���� ��ȸ��
		  private String imageURL;//�ۼ��ۿ� ÷�ε� �̹��� �ּ�
		  private Date eDate;//�亯 �ۼ� ��¥
		  private String eID;//�亯 �ۼ��� �������̵�
		  private String eComent;//�亯 ����
		  private String state;//���� Ȱ��ȭ ����??*/		
		
		CounselDAO dao = new CounselDAO(); 
		HttpSession session = request.getSession();

		String action = request.getParameter("action");
		ActionForward forward = null;
		boolean status = true;
		System.out.println("modify action:: "+ action);
		System.out.println("1 :"+request.getParameter("pTypeNO"));
		
	    if(action.equals("update")){//������û
	      Counsel bean = new Counsel();
	    	System.out.println("2 :"+request.getParameter("pTypeNO"));
	    	
	    	String pTypeNO = request.getParameter("pTypeNO");
	    	System.out.println("wowWow");
	    	
	    	if(pTypeNO.equals("������")){//�������� �������� ���ɺо߸� DB�� �������� ���ĺ����� �ٲٱ�.
	    		bean.setpTypeNO("EY");
	    	}else if(pTypeNO.equals("�ڼ���")){
	    		bean.setpTypeNO("NO");
	    	}else if(pTypeNO.equals("�󱼼���")){
	    		bean.setpTypeNO("FA");
	    	}else if(pTypeNO.equals("ü������")){
	    		bean.setpTypeNO("BO");
	    	}else if(pTypeNO.equals("��������")){
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
		    
			
			System.out.println("Ȯ��:"+dao.update(bean));
		   if(dao.update(bean)){//���� ����
			   List<Counsel> list = dao.selectAll();
			  
			   System.out.println("����list"+list);
			   session.setAttribute("list",list);

				status = true;
			}else{
				status = false;
			}
		}else if(action.equals("remove")){//������û (DB state ---> 3)�����ؼ� �����Ȱ�ó�� ���̰�
			String cNO = request.getParameter("cNO");
			System.out.println("������ cNO="+ cNO);
			if(dao.removecNO(cNO)){
				status = true;
				System.out.println("#�¶��� ����� ��������");
			}else{
				status = false;
				System.out.println("#�¶��� ����� ��������");
			}
		}
		
		if(status){
			forward = mapping.findForward("success");//�׼������� ��ü�� success���ڿ��� �ִ´�.
		}else{
			forward = mapping.findForward("fail");
		}


	    return forward;
	}
}