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
		
		System.out.println("1 :"+request.getParameter("pTypeNO"));
		//������� ����.
		
	    if(action.equals("update")){//������û
	      Counsel bean = new Counsel();
	    	System.out.println("2 :"+request.getParameter("pTypeNO"));
	    	
	    	bean.setcNO(request.getParameter("cNO"));
		  	bean.setpTypeNO(request.getParameter("pTypeNO"));
			bean.setmID(request.getParameter("mID"));
			bean.setcTitle(request.getParameter("cTitle"));
			bean.setcContent(request.getParameter("cContent"));
			
		//	System.out.println(request.getParameter("cNO"));
		//������� ����.
			
			 String state = request.getParameter("state");
			 
			if(state.equals("����")){//�������ΰ� �������
				bean.setState("1");//bean�� ������ ���� ���� ��� '1'�� ġȯ�ؼ� ������.
			}else{ //�������ΰ� ��������
				bean.setState("2"); //bean�� ������ ���� ���� ��� '2'�� ġȯ�ؼ� ������.
			}
			
		    
			System.out.println("Ȯ��:"+dao.update(bean));
		   if(dao.update(bean)){//���� ����
			   List<Counsel> list = dao.selectAll();
			  
			   System.out.println("����list"+list);
			   session.setAttribute("list",list);

				status = true;
			}else{
				status = false;
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