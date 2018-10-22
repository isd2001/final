package app.controller.guest;


import java.security.PublicKey;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.context.request.WebRequest;

import app.model.EmployeeRepository;
import app.model.MailRepository;

@Controller
@RequestMapping("/private")
public class PrivateController {
	@Autowired
	EmployeeRepository employeeRepository;
	@Autowired
	MailRepository mailRepository;
	
	@GetMapping("/modify.do")
	public String modifyHandle(Map model) {
		model.put("uri", "modify");
		
		return "guest.modify";
	}
	
	
	@PostMapping("/modify.do")
	public String modifyPostHandle(@SessionAttribute Map user, @RequestParam Map map, ModelMap model) {
		System.out.println(user);
		String cp = (String)user.get("PASS");
		String op = (String)map.get("opass");
		if(op.equals(cp)) {
			map.put("id", user.get("ID"));
			int r = employeeRepository.updatePass(map);
			if(r>0) {
				return "redirect:/";
			}
		}
		model.put("err", "on");
		return "guest.modify";
	}
	
	@GetMapping("/mail.do")
	public String mailGetHandle(WebRequest wreq) {
		Map map=(Map)wreq.getAttribute("user",WebRequest.SCOPE_SESSION );
		String id = (String) map.get("ID");
		System.out.println("id > "+id);
		
		List<Map> total=mailRepository.getAllMail(id);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		
		
		
		
		List<Map> mail = new ArrayList<>();
		Map ex = new HashMap<>();
		for (int i = 0; i < total.size(); i++) {
			ex.put("sender",total.get(i).get("SENDER") );
			Date da = (Date) total.get(i).get("SENDDATE");
				ex.put("senddate", sdf.format(da));
			ex.put("content", total.get(i).get("CONTENT"));
					
			mail.add(ex);
			}
		
		System.out.println("mail > "+mail);
		
		wreq.setAttribute("mail",mail , WebRequest.SCOPE_REQUEST);
		
		
		
		return "guest.mail";
	}
	
	@PostMapping("/mail.do")
	public String mailPostHandle() {
		
		 
		
		return "guest.sendmail";
	}
	
	
	
	
}//end class
