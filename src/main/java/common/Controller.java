package common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
    public String exec(HttpServletRequest request, HttpServletResponse response);
}
