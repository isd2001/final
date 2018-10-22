package app.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MailRepository {
	
	@Autowired
	SqlSessionTemplate template;
	
	// 본인 메일 전체 갖고오기
	public List<Map> getAllMail(String id){
		return template.selectList("mail.getAllMail",id);	
	}
	
	
}
