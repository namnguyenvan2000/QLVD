package com.poly.Service;

import java.util.List;

import com.poly.Dao.VideoDAO;
import com.poly.Dao.Implement.VideoDaoImpl;
import com.poly.Entity.Video;

//Lop DAO va Controller k xu li Logic ma lop Servide se xu li no!
public class VideoServiceImpl implements VideoService {

	private VideoDAO dao;

	// New hàm tạo để có the goi no
	public VideoServiceImpl() {
		dao = new VideoDaoImpl();
	}

	@Override
	public Video findByID(Integer id) {
		//
		return dao.findByID(id);
	}

	@Override
	public Video findByHref(String href) {
		//
		return dao.findByHref(href);
	}

	@Override
	public List<Video> findAll() {
		//
		return dao.findAll();
	}

	@Override
	public List<Video> findAll(int pageNumber, int pageSize) {
		//
		return dao.findAll(pageNumber, pageSize);
	}

	@Override
	public Video create(Video entity) {
		//
		entity.setIsActive(Boolean.TRUE);
		entity.setViews(0);
		entity.setShares(0);
		return dao.create(entity);
	}
	@Override
	public Video update(Video entity) {
		//
		return dao.update(entity);
	}

	@Override
	public Video delete(String href) {
		//
		Video entity = findByHref(href);
		entity.setIsActive(Boolean.FALSE);
		return dao.update(entity);
	}
}
