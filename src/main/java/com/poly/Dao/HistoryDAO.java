package com.poly.Dao;

import java.util.List;

import com.poly.Entity.History;

public interface HistoryDAO  {
	//Khai bao cho cac phuong thuc
	List<History> findByUser(String username);
	List<History> findByUserAndIsLiked(String username);
	History findByUserIdAndVideoId(Integer userId,Integer videoId);
	History create(History entity);
	History update(History entity);
}
