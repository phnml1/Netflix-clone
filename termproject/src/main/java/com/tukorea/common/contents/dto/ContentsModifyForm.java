package com.tukorea.common.contents.dto;

public class ContentsModifyForm {
	private int contentsid; // 게시물 시퀀스
	
	private String title;
	private String genre;
	private int year;
	private String director;
	private int running;
	private String summary;
	private int hits;
	private String posterimgname;
	private String posterimgposter;
	private String kind;
	public int getContentsid() {
		return contentsid;
	}
	public void setContentsid(int contentsid) {
		this.contentsid = contentsid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public int getRunning() {
		return running;
	}
	public void setRunning(int running) {
		this.running = running;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public String getPosterimgname() {
		return posterimgname;
	}
	public void setPosterimgname(String posterimgname) {
		this.posterimgname = posterimgname;
	}
	public String getPosterimgposter() {
		return posterimgposter;
	}
	public void setPosterimgposter(String posterimgposter) {
		this.posterimgposter = posterimgposter;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	
	
	
}
