package bbs;

public class Bbs {

	
	private int id;
	private String title;
	private String description;
	private String regdate;
	private String num_check;
	private String writer;
	
	

	public Bbs(){
		
	}
	
	public Bbs(int id, String title, String description, String regdate, String num_check,String writer) {
		this.id=id;
		this.title=title;
		this.description=description;
		this.regdate=regdate;
		this.num_check=num_check;
		this.writer=writer;
		
		
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getNum_check() {
		return num_check;
	}
	public void setNum_check(String num_check) {
		this.num_check = num_check;
	}
	
	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	
	
}
