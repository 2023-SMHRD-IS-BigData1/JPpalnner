package com.jpPlanner.model;


public class MemberVO {
    private String id;
    private String pw;
    private String nick;
    private String url;
    
    public MemberVO() {
    }
	
    public MemberVO(String id, String pw, String nick, String url) {
		super();
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.url = url;
	}
    
    public MemberVO(String id, String pw, String nick) {
		super();
		this.id = id;
		this.pw = pw;
		this.nick = nick;
	}

	public String getId() {
		return id;
	}

	public String getPw() {
		return pw;
	}

	public String getNick() {
		return nick;
	}
	
	public String getUrl() {
		return nick;
	}
    
}