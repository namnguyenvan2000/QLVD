package com.poly.Dao;

import java.util.List;
import java.util.Map;

import com.poly.Entity.User;

public interface UserDAO {
  User findByID(Integer id);
  User findByEmail(String email);
  User findByUsername(String username);
  User findByUsernameAndPassword(String username, String password);
  List<User> findAll();
  List<User> findAll(int pageNumber,int pageSize);
  User create(User entity);
  User update(User entity);
  User delete(User entity);
  List<User> findUsersLikedByVideoHref(Map<String, Object> params);
}
