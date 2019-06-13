package com.hncu.util;

public class NewsBean {
		private int p_newsId;
		private	String p_newsAu;//作者
		private String p_newsTitle;//标题
		private String p_newsContent;//内容
		private String p_newsK;//关键字
		private String p_addTime;//添加时间
		private	int p_click;//点击率
		private int p_newsPo;//表示是否已经发表
		
		
		public int getF_id() {
			return f_id;
		}
		public void setF_id(int f_id) {
			this.f_id = f_id;
		}
		public String getF_name() {
			return f_name;
		}
		public void setF_name(String f_name) {
			this.f_name = f_name;
		}

		private int f_id;//新闻栏目id
		private String f_name;//新闻栏目名称
		public String getP_newsK() {
			return p_newsK;
		}
		public void setP_newsK(String p_newsK) {
			this.p_newsK = p_newsK;
		}
		public int getP_newsId() {
			return p_newsId;
		}
		public void setP_newsId(int p_newsId) {
			this.p_newsId = p_newsId;
		}
		public String getP_newsAu() {
			return p_newsAu;
		}
		public void setP_newsAu(String p_newsAu) {
			this.p_newsAu = p_newsAu;
		}
		public String getP_newsTitle() {
			return p_newsTitle;
		}
		public void setP_newsTitle(String p_newsTitle) {
			this.p_newsTitle = p_newsTitle;
		}
		public String getP_newsContent() {
			return p_newsContent;
		}
		public void setP_newsContent(String p_newsContent) {
			this.p_newsContent = p_newsContent;
		}
		public String getP_addTime() {
			return p_addTime;
		}
		public void setP_addTime(String p_addTime) {
			this.p_addTime = p_addTime;
		}
		public int getP_click() {
			return p_click;
		}
		public void setP_click(int p_click) {
			this.p_click = p_click;
		}
		public int getP_newsPo() {
			return p_newsPo;
		}
		public void setP_newsPo(int p_newsPo) {
			this.p_newsPo = p_newsPo;
		}
		
		@Override
		public String toString() {
			return "NewsBean [p_newsId=" + p_newsId + ", p_newsAu=" + p_newsAu + ", p_newsTitle=" + p_newsTitle
					+ ", p_newsContent=" + p_newsContent + ", p_newsK=" + p_newsK + ", p_addTime=" + p_addTime
					+ ", p_click=" + p_click + ", p_newsPo=" + p_newsPo + ", f_id=" + f_id + ", f_name=" + f_name + "]";
		}
	

		
}
