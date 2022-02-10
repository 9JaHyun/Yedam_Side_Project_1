package web.controller.manager;

import domain.manager.vo.ReservationVO;
import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServlet;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/websocket")
public class NotificationServer extends HttpServlet {

    private static Map<Session, ReservationVO> reservationVOMap = Collections
        .synchronizedMap(new HashMap<Session, ReservationVO>());

    @OnMessage
    public void onMsg(String message, Session session) throws IOException {
        long memberId = reservationVOMap.get(session).getMemberId();
        System.out.println(memberId + ": " + message);
        synchronized (reservationVOMap) {
            reservationVOMap.keySet().forEach(currentSession -> {
                if (!currentSession.equals(session)) {
                    try {
                        currentSession.getBasicRemote().sendText(memberId + ": " + message);
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            });
        }
    }

    @OnOpen
    public void onOpen(Session session) {
        ReservationVO reservationVO = new ReservationVO();
        System.out.println(session);
        System.out.println(session + " connect");
    }

    public void sendNotice(String message) {
        String server = "server";
        System.out.println(server + " : " + message);

        synchronized (reservationVOMap) {
            reservationVOMap.keySet().forEach(currentSession -> {
                try {
                    currentSession.getBasicRemote().sendText(server + ": " + message);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            });
        }
    }

    @OnClose
    public void onClose(Session session) {
        reservationVOMap.remove(session);
        sendNotice(session + "disconnect..");
    }
}
