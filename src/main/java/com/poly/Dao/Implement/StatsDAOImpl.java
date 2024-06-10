package com.poly.Dao.Implement;

import java.util.ArrayList;
import java.util.List;

import com.poly.Dao.AbstractDao;
import com.poly.Dao.StatsDAO;
import com.poly.Entity.Video;
import com.poly.Storage.VideoLikedInfo;

public class StatsDAOImpl extends AbstractDao<Object []> implements StatsDAO{

	@Override
	public List<VideoLikedInfo> findVideoLikedInfo() {
		// Viet cau query
		String sql = "select v.id,v.title,v.href, sum(cast(h.isLiked as int)) as totalLike "
				+ "	from video v left join history h on h.videoId = v.id"
				+ "	where v.isActive = 1"
				+ "	group by v.id,v.title,v.href"
				+ "	order by sum(cast(h.isLiked as int)) desc";
		List<Object[]> objects = super.findManyByNativeQuerry(sql);
		List<VideoLikedInfo> result = new ArrayList<>();
		// Duyet list objects
		objects.forEach(object ->{
			VideoLikedInfo videolikedInfo = setDataVideoLikedInfor(object);
			result.add(videolikedInfo);
		});
		return result;
	}
	private VideoLikedInfo setDataVideoLikedInfor(Object[] object) {
		VideoLikedInfo videolikedInfo = new VideoLikedInfo();
		//Mapping theo từng field Object 
		videolikedInfo.setVideoId((Integer)object[0]);
		videolikedInfo.setTitle((String)object[1]);
		videolikedInfo.setHref((String)object[2]);
		videolikedInfo.setTotalLike(object[3] == null ? 0 : (Integer)object[3]);
		return videolikedInfo;
	}
		
}
