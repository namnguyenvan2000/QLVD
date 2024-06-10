package com.poly.Dao;


import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;

import com.poly.Util.JPAUtils;

public class AbstractDao<T> {
	public static final EntityManager entityManager = JPAUtils.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		entityManager.close();
		super.finalize();
	}

	public T findById(Class<T> clazz, Integer id) {
		return entityManager.find(clazz, id);
	}

	public List<T> findAll(Class<T> clazz, boolean existIsActive) {
		String entityName = clazz.getSimpleName();
		StringBuilder sql = new StringBuilder();
		//Dung StringBuilder de noi chuoi
		sql.append("SELECT o FROM ").append(entityName).append(" o");
		if (existIsActive == true) {
			sql.append(" WHERE isActive = 1");
		}
		TypedQuery<T> query = entityManager.createQuery(sql.toString(), clazz);
		return query.getResultList();
		//Example SELECT o From User o WHERE isActive = 1?
	}

	public List<T> findAll(Class<T> clazz, boolean existIsActive, int pageNumber, int pageSize) {
		String entityName = clazz.getSimpleName();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT o FROM ").append(entityName).append(" o");
		if (existIsActive == true) {
			sql.append(" WHERE isActive = 1");
		}
		TypedQuery<T> query = entityManager.createQuery(sql.toString(), clazz);
		//Vi query index tu 0 nen phai tru 1 ( trang 1)
		query.setFirstResult((pageNumber - 1) * pageSize);
		
		//Vi tri bat dau
		query.setMaxResults(pageSize);
		//So luong thuc the toi da - Theo Slide
		return query.getResultList();
		/*
		 * 5 phan tu : Muon 1 trang co 2 phan tu => Tong so trang : 3 trang 1: 2pt trang
		 * 2: 2pt trang 3: 1pt
		 */
	}

	// Select o from user o where o.username = ?0 and o.password = ?1
	public T findOne(Class<T> clazz, String sql, Object... params) {
		//Truyen dung theo thu tu Params de Mapping dung
		TypedQuery<T> query = entityManager.createQuery(sql, clazz);
		for (int i = 0; i < params.length; i++) {
			query.setParameter(i, params[i]);

		}
		List<T> result = query.getResultList();
		//GetResultList tranh truong hop Null
		if (result.isEmpty()) {
			return null;
		}
		return result.get(0);
	}
	
	public List<T> findMany(Class<T> clazz, String sql, Object... params) {

		TypedQuery<T> query = entityManager.createQuery(sql, clazz);
		for (int i = 0; i < params.length; i++) {
			query.setParameter(i, params[i]);

		}
		return query.getResultList();
	}
	
	public List<Object[]> findManyByNativeQuerry(String sql, Object... params) {
		//Dung NativeQuery
		Query query = entityManager.createNativeQuery(sql);
		for (int i = 0; i < params.length; i++) {
			query.setParameter(i, params[i]);
		}
		return query.getResultList();
	}
	public T create (T entity) {
		try {
			entityManager.getTransaction().begin();
			entityManager.persist(entity);
			entityManager.getTransaction().commit();
			System.out.println("Added Success!!");
			return entity;
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			System.out.println("Can't add entity!!");
			throw new RuntimeException(e);
		}
	}
	public T update (T entity) {
		try {
			entityManager.getTransaction().begin();
			entityManager.merge(entity);
			entityManager.getTransaction().commit();
			System.out.println("Updated success!!");
			return entity;
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			System.out.println("Can't updated entity!!");
			throw new RuntimeException(e);
		}
	}
	
	public T delete (T entity) {
		try {
			entityManager.getTransaction().begin();
			entityManager.remove(entity);
			entityManager.getTransaction().commit();
			System.out.println("Enity has been deleted!!");
			return entity;
		} catch (Exception e) {
			entityManager.getTransaction().rollback();
			System.out.println("Can't delete entity!!");
			throw new RuntimeException(e);
		}
	}
	public List<T> callStore(String namedStore, Map<String, Object> params){
		//ten Store - list Param - key la tham so truyen vao trong cau SP
		// Value la gia tri truyen vao trong dieu kien where
		StoredProcedureQuery query = entityManager.createNamedStoredProcedureQuery(namedStore);
		
		params.forEach((key,value) -> query.setParameter(key, value));
		//duyet het cac phan tu
		return (List<T>) query.getResultList();
	}

}
