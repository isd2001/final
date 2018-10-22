package app.controller.guest;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;

import app.model.ChatRepository;
import app.service.SocketService;

@Controller
public class ChatSocketController extends TextWebSocketHandler {
	List<WebSocketSession> sockets;
	
	
	@Autowired
	Gson gson;
	
	@Autowired
	AlertSocketController socketAlert;
	
	@Autowired
	ChatRepository chat;
	
	public ChatSocketController() {
		sockets = new ArrayList<>();
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String got = message.getPayload();
	
		Map read= gson.fromJson(got, Map.class);
		
		//======================================
		// mongodb 저장
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date d = new Date();
		
		Map map = new HashMap<>();
			map.put("sender", read.get("talker"));
			map.put("department", read.get("mode"));
			map.put("time", sdf.format(d));
			map.put("content",read.get("text"));
		chat.setChatOne(map);
		//======================================
		
		
		for (int i = 0; i < sockets.size(); i++) {
				try {
					sockets.get(i).sendMessage(message);
				} catch (Exception e) {
					e.printStackTrace();				
			}
		}//end for
		
	}//end handle
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sockets.add(session);
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sockets.remove(session);
		
		
	}
}
