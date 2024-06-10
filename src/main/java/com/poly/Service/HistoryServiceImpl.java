package com.poly.Service;

import java.sql.Timestamp;
import java.util.List;

import com.poly.Dao.HistoryDAO;
import com.poly.Dao.Implement.HistoryDaoImpl;
import com.poly.Entity.History;
import com.poly.Entity.User;
import com.poly.Entity.Video;

public class HistoryServiceImpl implements HistoryService{
	private HistoryDAO dao;
	
	private VideoService videoService = new VideoServiceImpl();
	
	public HistoryServiceImpl() {
		dao = new HistoryDaoImpl();
	}
	@Override
	public List<History> findByUser(String username) {
		//
		return dao.findByUser(username);
	}

	@Override
	public List<History> findByUserAndIsLiked(String username) {
		// 
		return dao.findByUserAndIsLiked(username);
	}

	@Override
	public History findByUserIdAndVideoId(Integer userId, Integer videoId) {
		// 
		return dao.findByUserIdAndVideoId(userId, videoId);
	}

	@Override
	public History create(User user, Video video) {
		// 
		History existHistory = findByUserIdAndVideoId(user.getId(), video.getId());
		if (existHistory == null) {
			existHistory = new History();
			existHistory.setUser(user);
			existHistory.setVideo(video);
			existHistory.setViewedDate(new Timestamp(System.currentTimeMillis()));
			existHistory.setIsLiked(Boolean.FALSE);
			return dao.create(existHistory);
			
		}
		return existHistory;
	}

	@Override
	public boolean updateLikeOrUnlike(User user, String videoHref) {
		// 
		Video video = videoService.findByHref(videoHref);
		History existHistory = findByUserIdAndVideoId(user.getId(), video.getId());
		
		 if(existHistory.getIsLiked() == Boolean.FALSE) {
			existHistory.setIsLiked(Boolean.TRUE);
			existHistory.setLikeDate(new Timestamp(System.currentTimeMillis()));
		}else {
			existHistory.setIsLiked(Boolean.FALSE);
			existHistory.setLikeDate(null);
		}
		 
		History updateHistory = dao.update(existHistory);
		return updateHistory != null ? true : false ;
	}
	

}
