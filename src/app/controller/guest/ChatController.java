package app.controller.guest;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;

import app.model.ChatRepository;

@Controller
@RequestMapping("/chat")
public class ChatController {
	@Autowired
	ChatRepository chat;
	
	
	@RequestMapping("/Allchat.do")
	public String AllchatHandle(ModelMap map) {
		List<Map> allchat=chat.getAllchat();
		map.addAttribute("allchat",allchat);	
		
		return "guest.Allchat";
	}
	
	@RequestMapping("/Departmentchat.do")
	public String DepartmentchatHandle(ModelMap map,WebRequest wreq) {
		Map m=(Map)wreq.getAttribute("user",WebRequest.SCOPE_SESSION);
		String depart=(String)m.get("DNAME");
		List<Map> departchat=chat.getdepartmentChat(depart);
		map.addAttribute("departchat",departchat);
		return "guest.Departmentchat";
	}
	
	
	
}
