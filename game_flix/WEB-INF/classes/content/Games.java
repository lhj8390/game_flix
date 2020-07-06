package content;

import java.util.Date;

public class Games {
	private int id;
	private String title;
	private String description;
	private String imageLink;
	private String videoLink;
	private String downloadLink;
	private String category;
	private Date updateTime;
	
	public Games() {
		title = "no title";
		description = "no description";
		imageLink = "no imageLink";
		videoLink = "no videoLink";
		downloadLink = "no downloadLink";
		category = "no category";
	}
	

	public Games(int id, String title, String description, String imageLink, String videoLink, String downloadLink,
			String category, Date updateTime) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.imageLink = imageLink;
		this.videoLink = videoLink;
		this.downloadLink = downloadLink;
		this.category = category;
		this.updateTime = updateTime;
	}






	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImageLink() {
		return imageLink;
	}
	public void setImageLink(String imageLink) {
		this.imageLink = imageLink;
	}
	public String getVideoLink() {
		return videoLink;
	}
	public void setVideoLink(String videoLink) {
		this.videoLink = videoLink;
	}
	public String getDownloadLink() {
		return downloadLink;
	}
	public void setDownloadLink(String downloadLink) {
		this.downloadLink = downloadLink;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	
}
