package com.hncu.util;

public class CollNews {
		private int c_id;
		private int p_newsId;
		private String p_newsTitle;
		private String c_addTime;
		private int u_id;
		private String u_username;
		
		public int getC_id() {
			return c_id;
		}
		public void setC_id(int c_id) {
			this.c_id = c_id;
		}
		public int getP_newsId() {
			return p_newsId;
		}
		public void setP_newsId(int p_newsId) {
			this.p_newsId = p_newsId;
		}
		public String getP_newsTitle() {
			return p_newsTitle;
		}
		public void setP_newsTitle(String p_newsTitle) {
			this.p_newsTitle = p_newsTitle;
		}
		public String getC_addTime() {
			return c_addTime;
		}
		public void setC_addTime(String c_addTime) {
			this.c_addTime = c_addTime;
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
		@Override
		public String toString() {
			return "CollecNews [c_id=" + c_id + ", p_newsId=" + p_newsId + ", p_newsTitle=" + p_newsTitle
					+ ", c_addTime=" + c_addTime + ", u_id=" + u_id + ", u_username=" + u_username + "]";
		}
		
		
		
}
