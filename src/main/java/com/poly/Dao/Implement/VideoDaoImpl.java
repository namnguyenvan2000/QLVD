package com.poly.Dao.Implement;

import java.util.List;

import com.poly.Dao.AbstractDao;
import com.poly.Dao.VideoDAO;
import com.poly.Entity.Video;

public class VideoDaoImpl extends AbstractDao<Video> implements VideoDAO{

	@Override
	public Video findByID(Integer id) {
		// 
		return super.findById(Video.class, id);
	}

	
	@Override
	public Video findByHref(String href) {
		// 
		String sql = "SELECT o FROM Video o WHERE o.href = ?0";
		return super.findOne(Video.class, sql, href);
	}
	

	@Override
	public List<Video> findAll() {
		// 
		return super.findAll(Video.class, true);
	}

	@Override
	public List<Video> findAll(int pageNumber, int pageSize) {
		// Write Comment
		return super.findAll(Video.class, true, pageNumber, pageSize);
	}



}
