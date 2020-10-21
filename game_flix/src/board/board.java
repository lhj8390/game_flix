package board;

public class board {
	int id;
	String title;
	String description;
	String num_check;
	String writer;
	String regdate;
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
	
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public board() {
		
	}
	public board(int id, String title, String description, String num_check, String writer, String regdate) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.num_check = num_check;
		this.writer = writer;
		this.regdate = regdate;
	}
	
	
	
}
