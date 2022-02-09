package command;

import common.Command;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ManagerIndexController implements Command {

    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) {
        return "main/main";
    }
}
