package com.poly.Dao;

import java.util.List;

import com.poly.Entity.User;
import com.poly.Storage.VideoLikedInfo;

public interface StatsDAO {
	
	List<VideoLikedInfo> findVideoLikedInfo ();
}
