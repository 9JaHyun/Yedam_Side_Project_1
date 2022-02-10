package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberUpdateController implements common.Command {
    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) {
        // Todo
        String memberId = request.getParameter("memberId");
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        return null;
    }
}
