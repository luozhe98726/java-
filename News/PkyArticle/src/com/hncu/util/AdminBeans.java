package com.hncu.util;

public class AdminBeans {
		private int a_id;
		private String a_username;
		private String  a_password;
		private String a_photo;
		private String a_sex;
		private int a_age;
		public int getA_id() {
			return a_id;
		}
		public void setA_id(int a_id) {
			this.a_id = a_id;
		}
		public String getA_username() {
			return a_username;
		}
		public void setA_username(String a_username) {
			this.a_username = a_username;
		}
		public String getA_password() {
			return a_password;
		}
		public void setA_password(String a_password) {
			this.a_password = a_password;
		}
		public String getA_photo() {
			return a_photo;
		}
		public void setA_photo(String a_photo) {
			this.a_photo = a_photo;
		}
		@Override
		public String toString() {
			return "AdminBeans [a_id=" + a_id + ", a_username=" + a_username + ", a_password=" + a_password
					+ ", a_photo=" + a_photo + ", a_sex=" + a_sex + ", a_age=" + a_age + "]";
		}
		public String getA_sex() {
			return a_sex;
		}
		public void setA_sex(String a_sex) {
			this.a_sex = a_sex;
		}
		public int getA_age() {
			return a_age;
		}
		public void setA_age(int a_age) {
			this.a_age = a_age;
		}
		
		
}
