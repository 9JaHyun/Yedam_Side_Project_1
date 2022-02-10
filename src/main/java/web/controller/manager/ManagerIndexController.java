package web.controller.manager;

import common.Controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ManagerIndexController implements Controller {

    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) {
        return "main/main";
    }
}
