package com.hncu.util;

public class FileBean {
		private int pf_id;
		private String  pf_name;
		private String pf_image;
		private String pf_addTime;
		private int u_id;//当前用户id
		private String u_username;
		
		public String getU_username() {
			return u_username;
		}
		public void setU_username(String u_username) {
			this.u_username = u_username;
		}
		public int getPf_id() {
			return pf_id;
		}
		public void setPf_id(int pf_id) {
			this.pf_id = pf_id;
		}
		public String getPf_name() {
			return pf_name;
		}
		public void setPf_name(String pf_name) {
			this.pf_name = pf_name;
		}
		public String getPf_image() {
			return pf_image;
		}
		public void setPf_image(String pf_image) {
			this.pf_image = pf_image;
		}
		public String getPf_addTime() {
			return pf_addTime;
		}
		public void setPf_addTime(String pf_addTime) {
			this.pf_addTime = pf_addTime;
		}
		public int getU_id() {
			return u_id;
		}
		public void setU_id(int u_id) {
			this.u_id = u_id;
		}
		@Override
		public String toString() {
			return "FileBean [pf_id=" + pf_id + ", pf_name=" + pf_name + ", pf_image=" + pf_image + ", pf_addTime="
					+ pf_addTime + ", u_id=" + u_id + ", u_username=" + u_username + "]";
		}
	
		
		
}
