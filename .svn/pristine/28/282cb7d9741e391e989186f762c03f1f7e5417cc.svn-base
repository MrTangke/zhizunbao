package www.zhizunbao.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import www.zhizunbao.dto.insure.Comment;
import www.zhizunbao.dto.insure.Insure;
import www.zhizunbao.dto.insure.InsureComment;

public interface CommentService {

	List<Comment> findComment(HttpServletRequest request);

	Integer deleteByPrimaryKey(HttpServletRequest request,Integer id);

	List<Comment> findOne(Integer insureId);

	List<InsureComment> findCommentById(int id);

	int addPinglun(HttpServletRequest request,String pinglun, int insureId, int userId);
	
	int findCommentCountByInsureId(Insure insure);

	List<Comment> findCommentLimit(Map<String, Object> map);
}
