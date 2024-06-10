package com.poly.Service;

import java.util.List;

import com.poly.Entity.History;
import com.poly.Entity.User;
import com.poly.Entity.Video;	

public interface HistoryService {
	List<History> findByUser(String username);
	List<History> findByUserAndIsLiked(String username);
	History findByUserIdAndVideoId(Integer userId,Integer videoId);
	History create(User user,Video video);
	boolean updateLikeOrUnlike(User user,String videoHref);
}
