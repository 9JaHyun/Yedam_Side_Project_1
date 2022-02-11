package web.controller.reservation;

import common.Controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CheckAvailableListController implements Controller {

    @Override
    public String exec(HttpServletRequest request, HttpServletResponse response) {
        request.getParameter("");
        long restaurantId = Long.parseLong(request.getParameter("personnel"));
        String date = request.getParameter("personnel");
        int personnel = Integer.parseInt(request.getParameter("personnel"));
        System.out.println(restaurantId + "/" + date + "/" +personnel);
        return null;
    }
}
