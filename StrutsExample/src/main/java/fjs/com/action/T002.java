package fjs.com.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import fjs.com.Dao.T002Dao;
import fjs.com.Dto.T002Dto;

public class T002 extends Action{
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String indexPage = request.getParameter("index");
		if (indexPage == null) {
			indexPage = "1";
		}
		
		String pages = request.getParameter("page");
		if (pages == null) {
			pages= "2";
		}
		int page = Integer.parseInt(pages);
		
		int index = Integer.parseInt(indexPage);
		request.setAttribute("tag", index);
		T002Dao dao = new T002Dao();
		int count;
		try {
			count = dao.getDataPage();
			int endpage = count/15;
			if (count % 15 != 0) {
				endpage++;
			}
			List<T002Dto> list = dao.pagingData(index);
			request.setAttribute("ListData", list);
			request.setAttribute("endP", endpage);
			return mapping.findForward("success");
		}catch(Exception e) {
			e.printStackTrace();
			return mapping.findForward("success");
		}
		
	}
	
//	private void processSearch(HttpServletRequest request, HttpServletResponse response, String name, String sex, String birthdayFrom, String birthdayTo, String page) throws ServletException, IOException {
//        T002Dao daoSearch = new T002Dao();
//      //  List<T002Dto> resultSearch = daoSearch.getDataSearch(name, sex, birthdayFrom, birthdayTo);
//        int recordsPerPage = 15;
//        int startIndex = (Integer.parseInt(page) - 1) * recordsPerPage;
//        int endIndex = startIndex + recordsPerPage;
//        int totalRecords = resultSearch.size();
//        int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
//        List<T002Dto> resultPaginated = resultSearch.subList(startIndex, Math.min(endIndex, totalRecords));
//        if (resultPaginated.size() == 0) {
//            request.setAttribute("buttonDelete", resultPaginated);
//        }
//        request.setAttribute("listDataSearch", resultPaginated);
//        request.setAttribute("currentPage", page);
//        request.setAttribute("recordsPerPage", recordsPerPage);
//        request.setAttribute("totalRecords", totalRecords);
//        request.setAttribute("totalPages", totalPages);
//        return;
//    }
}
