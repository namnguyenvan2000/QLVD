package com.poly.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;

import com.poly.Dao.UserDAO;
import com.poly.Dao.Implement.UserDaoImpl;
import com.poly.Entity.User;

public class UserServiceImpl implements UserService{
	private  UserDAO dao;
	public UserServiceImpl() {
		dao = new UserDaoImpl();
	}
	@Override
	public User findByID(Integer id) {
		// 
		return dao.findByID(id);
	}

	@Override
	public User findByEmail(String email) {
		// 
		return dao.findByEmail(email);
	}

	@Override
	public User findByUsername(String username) {
		// 
		return dao.findByUsername(username);
	}

	@Override
	public User login(String username, String password) {
		// TODO Auto-generated method stub
		return dao.findByUsernameAndPassword(username, password);
	}

	@Override
	public User resetPassword(String email) {
		User existUser = findByEmail(email); // Tim xem da ton tai User voiw Email nay chua
		if(existUser != null) {
			//Math.random -> pass
			//(Math.random()) * ((max - min) + 1)) + min
			String newPass = String.valueOf((int)(Math.random() * ((9999 - 1000) + 1)) + 1000);
			existUser.setPassword(newPass);
			return dao.update(existUser);
		}
		return null;
	}

	@Override
	public List<User> findAll() {
		
		return dao.findAll();
	}

	@Override
	public List<User> findAll(int pageNumber, int pageSize) {
		// 
		return dao.findAll(pageNumber, pageSize);
	}

	@Override
	public User create(String username, String password, String email) {
		//
		User newUser = new User();
		newUser.setPassword(password);
		newUser.setUsername(username);
		newUser.setEmail(email);
		newUser.setIsAdmin(Boolean.FALSE);
		newUser.setIsActive(Boolean.TRUE);
		return dao.create(newUser);
		
	}

	@Override
	public User update(User entity) {
		// 
		return dao.update(entity);
	}

	@Override
	public User delete(String username) {
		//
		User user = dao.findByUsername(username);
		user.setIsActive(Boolean.FALSE);
		return dao.update(user);
	}
	@Override
	public List<User> findUsersLikedByVideoHref(String href) {
		// 
		Map<String, Object> params = new HashMap<>();
		params.put("videoHref", href);
		return dao.findUsersLikedByVideoHref(params);
		
	}

}
