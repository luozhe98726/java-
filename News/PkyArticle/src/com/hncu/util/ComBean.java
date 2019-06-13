package com.hncu.util;

public class ComBean {
		private int d_id;
		private String d_content;
		private int u_id;
		private String u_username;
		private int p_newsId;
		private String d_addTime;
		private String up_image;
		public String getUp_image() {
			return up_image;
		}
		public void setUp_image(String up_image) {
			this.up_image = up_image;
		}
		public int getD_id() {
			return d_id;
		}
		public String getD_addTime() {
			return d_addTime;
		}
		public void setD_addTime(String d_addTime) {
			this.d_addTime = d_addTime;
		}
		public void setD_id(int d_id) {
			this.d_id = d_id;
		}
		public String getD_content() {
			return d_content;
		}
		public void setD_content(String d_content) {
			this.d_content = d_content;
		}
		public int getU_id() {
			return u_id;
		}
		public void setU_id(int u_id) {
			this.u_id = u_id;
		}
		public String getU_username() {
			return u_username;
		}
		public void setU_username(String u_username) {
			this.u_username = u_username;
		}
		public int getP_newsId() {
			return p_newsId;
		}
		public void setP_newsId(int p_newsId) {
			this.p_newsId = p_newsId;
		}
		@Override
		public String toString() {
			return "ComBean [d_id=" + d_id + ", d_content=" + d_content + ", u_id=" + u_id + ", u_username="
					+ u_username + ", p_newsId=" + p_newsId + ", d_addTime=" + d_addTime + ", up_image=" + up_image
					+ "]";
		}
	
		
		
}
