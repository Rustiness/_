package kr.hospi.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import kr.hospi.beans.Member;
import kr.hospi.dao.MemberDAO;

public class ModifyAction extends Action{
	ActionForward forward;//������ ��ü ����
	
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {//execute �޼ҵ�
		
		request.setCharacterEncoding("UTF-8");
		
		String mID=request.getParameter("mID");//���̵�
		String pass=request.getParameter("pass");//��й�ȣ
		String question=request.getParameter("question");
		String answer=request.getParameter("answer");
		String name=request.getParameter("name");//�̸�
		String birth=request.getParameter("birth1")+"/"
				+request.getParameter("birth2")+"/"
				+request.getParameter("birth3");//����
		String sex=request.getParameter("sex");//����
		String tel=request.getParameter("tel1")+"-"
					+request.getParameter("tel2")+"-"
					+request.getParameter("tel3");//��ȭ��ȣ
		String email="";
			if(request.getParameter("select_email")==""){
				//'���� �Է�'�� �������� ��, �̸��� ���ڸ��� ���� �Է��� ������,
				email=request.getParameter("email1")+"@"
						+request.getParameter("email2");
			}else{//�ƴ� ��� �ɼǿ��� ������ ������ �����ȴ�.
				email=request.getParameter("email1")+"@"
						+request.getParameter("select_email");//�̸���
			}
			
		String pTypeNO="";//���ɻ�
			String[] pTypeNOs=request.getParameterValues("pTypeNO");//���ɻ縦 ó���� ���ڹ迭�� ����.
			for(int i=0; i<pTypeNOs.length; i++){//üũ�ڽ����� �� ���� ���ɻ縦 �迭�� ����.
				if(i==0){
					pTypeNO=pTypeNOs[i];
				}else{
					pTypeNO=pTypeNO+","+pTypeNOs[i];
				}//����ǥ�� ���ɻ�� ���ɻ� ���̿��� �ٵ��� ����
			}// --> ���ڿ��� �ٲ�.
		
		Member mem = new Member(mID,pass,question,answer,name,birth,sex,tel,email,pTypeNO);
		//�̻��� ����� ȸ��(Member) ���� ��ü �����Ѵ�.
		
		MemberDAO dao = new MemberDAO();//DAO ��ü ����
		if(dao.update(mem)){//DAO���� ȸ������������ �Է��ϴ� �޼ҵ� insert�� ȣ���Ѵ�.(�Ķ���ʹ� ȸ���������� ��)
			request.getSession().setAttribute("modifyMem", mem);//���ǿ� "modifyMem"��� ������ �� ����
			forward = mapping.findForward("success");//�۾� ������ ������ ��ü�� "success"�� ����.
		}else{
			forward = mapping.findForward("fail");//�۾� ������ ������ ��ü�� "fail"�� ����.
		}
		
		return forward;//��� �۾��� ������ ������ ��ü�� ����.
	}//execute
}
