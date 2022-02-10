package web.controller.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Controller;
import domain.manager.service.ManagerService;
import domain.manager.serviceImpl.ManagerServiceImpl;
import domain.manager.vo.ManagerVO;
import domain.member.service.MemberService;
import domain.member.serviceImpl.MemberServiceImpl;
import domain.member.vo.MemberVO;
import web.SessionConst;

public class LoginController implements Controller {

    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String author = request.getParameter("author");

        HttpSession session = request.getSession();

        String url = "cMain.do";

        if (author.equals("customer")) {
            MemberService memberDAO = new MemberServiceImpl();
            MemberVO vo = new MemberVO();
            vo.setLoginId(id);
            vo.setPassword(password);
            vo = memberDAO.memberSelect(vo);
            session.setAttribute(SessionConst.LOGIN_MEMBER, vo);

            String redirectParam = request.getParameter("redirectURL");
            if (redirectParam != null) {
                url = "redirect:" + redirectParam;
            }

        } else if (author.equals("manager")) {
            ManagerService managerDAO = new ManagerServiceImpl();
            ManagerVO vo = new ManagerVO();
            vo.setLoginId(id);
            vo.setPassword(password);
            vo = managerDAO.managerSelect(vo);
            session.setAttribute(SessionConst.LOGIN_MANAGER, vo);
            url = "main.do";
        }

        return url;
    }

}
