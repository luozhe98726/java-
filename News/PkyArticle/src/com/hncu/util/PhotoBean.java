package com.hncu.util;

public class PhotoBean {
		private int up_id;
		private String up_name;
		private String up_image;
		private int u_id;
		private String u_username;
		public int getUp_id() {
			return up_id;
		}
		public void setUp_id(int up_id) {
			this.up_id = up_id;
		}
		public String getUp_name() {
			return up_name;
		}
		public void setUp_name(String up_name) {
			this.up_name = up_name;
		}
		public String getUp_image() {
			return up_image;
		}
		public void setUp_image(String up_image) {
			this.up_image = up_image;
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
			return "PhotoBean [up_id=" + up_id + ", up_name=" + up_name + ", up_image=" + up_image + ", u_id=" + u_id
					+ ", u_username=" + u_username + "]";
		}
		
		
}
