package web.controller.signup;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Controller;
import domain.member.service.MemberService;
import domain.member.serviceImpl.MemberServiceImpl;

public class MemberIdCheckController implements Controller {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		System.out.println(request.getParameter("id"));
		String id = request.getParameter("id");
<<<<<<< HEAD

=======
>>>>>>> restaurant_and_reserve
		MemberService memberDAO = new MemberServiceImpl();
		boolean result = memberDAO.isMemberIdcheck(id);
		if(!result) {
			return "ajax:0";
		}
		return "ajax:1";
	}

}
