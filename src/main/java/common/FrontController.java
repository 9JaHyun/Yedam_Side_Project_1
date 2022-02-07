package common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "*.do")
public class FrontController extends HttpServlet {

    private Map<String, Command> commandMap;

    @Override
    public void init(ServletConfig config) throws ServletException {
        commandMap = new HashMap<>();
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String requestURI = request.getRequestURI();
        String contextPath = request.getContextPath();
        String commandPath = requestURI.substring(contextPath.length());

        if (commandMap.get(commandPath) == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
        String filePath = fullPath(commandMap.get(commandPath).exec(request, response));
        request.getRequestDispatcher(filePath).forward(request, response);
    }

    private String fullPath(String path) {
        return "/WEB-INF/" + path + "tiles";
    }
}
