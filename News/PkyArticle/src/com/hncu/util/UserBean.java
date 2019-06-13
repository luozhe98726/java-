package com.hncu.util;
/**
 * 普通用户信息
 * @author LuoZhe
 *
 */
public class UserBean {
		private int u_id;
		private String u_username;
		private String u_password;
		private String u_email;
		private String u_age;
		private String u_sex;
		private String u_reDate;
		private int u_freeze;
	 	private String u_realName;
	 	private String up_image;
	 	private String u_problem;
	 	private String u_answer;
	
		public String getU_problem() {
			return u_problem;
		}
		public void setU_problem(String u_problem) {
			this.u_problem = u_problem;
		}
		public String getU_answer() {
			return u_answer;
		}
		public void setU_answer(String u_answer) {
			this.u_answer = u_answer;
		}
		public String getUp_image() {
			return up_image;
		}
		public void setUp_image(String up_image) {
			this.up_image = up_image;
		}
		public String getU_realName() {
			return u_realName;
		}
		public void setU_realName(String u_realName) {
			this.u_realName = u_realName;
		}
		public int getU_freeze() {
			return u_freeze;
		}
		public void setU_freeze(int u_freeze) {
			this.u_freeze = u_freeze;
		}
		public String getU_reDate() {
			return u_reDate;
		}
		public void setU_reDate(String u_reDate) {
			this.u_reDate = u_reDate;
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
		public String getU_password() {
			return u_password;
		}
		public void setU_password(String u_password) {
			this.u_password = u_password;
		}
		public String getU_email() {
			return u_email;
		}
		public void setU_email(String u_email) {
			this.u_email = u_email;
		}
		public String getU_age() {
			return u_age;
		}
		public void setU_age(String u_age) {
			this.u_age = u_age;
		}
		public String getU_sex() {
			return u_sex;
		}
		public void setU_sex(String u_sex) {
			this.u_sex = u_sex;
		}
		@Override
		public String toString() {
			return "UserBean [u_id=" + u_id + ", u_username=" + u_username + ", u_password=" + u_password + ", u_email="
					+ u_email + ", u_age=" + u_age + ", u_sex=" + u_sex + ", u_reDate=" + u_reDate + ", u_freeze="
					+ u_freeze + ", u_realName=" + u_realName + ", up_image=" + up_image + ", u_problem=" + u_problem
					+ ", u_answer=" + u_answer + "]";
		}
		
		
		
		
		
}
