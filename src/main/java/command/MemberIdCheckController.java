package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.Command;
import domain.member.service.MemberService;
import domain.member.serviceImpl.MemberServiceImpl;

public class MemberIdCheckController implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");

		MemberService memberDAO = new MemberServiceImpl();
		boolean result = memberDAO.isMemberIdcheck(id);
		if(!result) {
			return "ajax:0";
		}
		return "ajax:1";
	}

}
