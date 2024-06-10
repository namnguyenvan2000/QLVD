package com.poly.Dao.Implement;

import java.util.List;
import java.util.Map;

import com.poly.Constant.NamedStored;
import com.poly.Dao.AbstractDao;
import com.poly.Dao.UserDAO;
import com.poly.Entity.User;

public class UserDaoImpl extends AbstractDao<User> implements UserDAO {
	@Override
	public User findByID(Integer id) {
		// Ke thua tu UserDAO
		return super.findById(User.class, id);
	}

	@Override
	public User findByEmail(String email) {
		// Su dung cau lenh SQL
		String sql = "SELECT  o FROM User o WHERE o.email = ?0";
		return super.findOne(User.class, sql, email);
	}

	@Override
	public User findByUsername(String username) {
		String sql = "SELECT  o FROM User o WHERE o.username = ?0";
		return super.findOne(User.class, sql, username);
	}

	@Override
	public User findByUsernameAndPassword(String username, String password) {
		String sql = "SELECT  o FROM User o WHERE o.username = ?0 AND o.password = ?1";
		return super.findOne(User.class, sql, username, password);
	}

	@Override
	public List<User> findAll() {
		// Tim nhung User dang hoat dong
		return super.findAll(User.class, true);
	}

	@Override
	public List<User> findAll(int pageNumber, int pageSize) {
		// TODO Auto-generated method stub
		return super.findAll(User.class, true, pageNumber, pageSize);
	}

	@Override
	public List<User> findUsersLikedByVideoHref(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return super.callStore(NamedStored.FIND_USER_BY_HREF, params);
	}

//	@Override
//	public User create(User entity) {
//		return entity;
//	}
//
//	@Override
//	public User update(User entity) {
//		return entity;
//	}
//
//	@Override
//	public User delete(User entity) {
//		return entity;
//	}

}
