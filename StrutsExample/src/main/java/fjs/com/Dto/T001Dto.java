package fjs.com.Dto;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class T001Dto extends ActionForm {
	public String USERID, PASSWORD, PSN_CD;

	public T001Dto() {
		super();
	}

	public T001Dto(String uSERID, String pASSWORD, String pSN_CD) {
		super();
		USERID = uSERID;
		PASSWORD = pASSWORD;
		PSN_CD = pSN_CD;
	}

	public String getUSERID() {
		return USERID;
	}

	public void setUSERID(String uSERID) {
		USERID = uSERID;
	}

	public String getPASSWORD() {
		return PASSWORD;
	}

	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}

	public String getPSN_CD() {
		return PSN_CD;
	}

	public void setPSN_CD(String pSN_CD) {
		PSN_CD = pSN_CD;
	}
	
	@Override
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
		 ActionErrors error = new ActionErrors();
		    String userID = request.getParameter("USERID"); // lấy giá trị của ô input có tên là "userID"
		    String password = request.getParameter("PASSWORD"); // lấy giá trị của ô input có tên là "password"
		    
		    if (userID == null && password != null) {
		        error.add("logerError", new ActionMessage("LoginBean.username.required"));
		       
		    }
		    if (password == null && userID != null) {
		        error.add("logerError", new ActionMessage("LoginBean.password.required"));
		    }
		    return error;
	}
}
