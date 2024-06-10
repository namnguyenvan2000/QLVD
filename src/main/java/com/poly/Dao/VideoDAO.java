package com.poly.Dao;

import java.util.List;

import com.poly.Entity.Video;

public interface VideoDAO {
	Video findByID(Integer id);

	Video findByHref(String href);

	List<Video> findAll();

	List<Video> findAll(int pageNumber, int pageSize);

	Video create(Video entity);

	Video update(Video entity);

	Video delete(Video entity);
	
}
