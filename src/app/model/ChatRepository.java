package app.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class ChatRepository {
	
	@Autowired
	MongoTemplate template;
	
	// 전체 채팅 불러오기
	public List<Map> getAllchat() {
		return template.findAll(Map.class,"chat");
	}
	
	// 채팅 입력후 저장
	public Map setChatOne(Map map) {
		return template.insert(map,"chat");
	}
	
	//해당 부서 채팅 불어오기
	public List<Map> getdepartmentChat(String depart){
		Criteria c = Criteria.where("department").is(depart);
		//Query query = new Query(Criteria.where("department").is(c));
		return template.find(new Query(c),Map.class,"chat");
	}
	
	
}
