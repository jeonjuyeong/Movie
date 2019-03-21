package com.movie.domain;

public class GoodsVO {
	int num,currentPrice,wantPrice;
	String userid,userName,category,title,content,untilDate,uploadDate,email,mainPic;
	GoodsPriceVO[] vo;
	
	
	
	public GoodsPriceVO[] getVo() {
		return vo;
	}
	public void setVo(GoodsPriceVO[] vo) {
		this.vo = vo;
	}
	public int getNum() {
		return num;
	}
	public String getMainPic() {
		return mainPic;
	}
	public void setMainPic(String mainPic) {
		this.mainPic = mainPic;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCurrentPrice() {
		return currentPrice;
	}
	public void setCurrentPrice(int currentPrice) {
		this.currentPrice = currentPrice;
	}
	public int getWantPrice() {
		return wantPrice;
	}
	public void setWantPrice(int wantPrice) {
		this.wantPrice = wantPrice;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUntilDate() {
		return untilDate;
	}
	public void setUntilDate(String untilDate) {
		this.untilDate = untilDate;
	}
	public String getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	

	
}
