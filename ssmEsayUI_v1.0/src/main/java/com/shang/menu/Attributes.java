package com.shang.menu;

import java.io.Serializable;

public class Attributes implements Serializable {
	private static final long serialVersionUID = 1L;
	private String url;

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Attributes(String url) {
		super();
		this.url = url;
	}

	public Attributes() {
		super();
	}
	
}
