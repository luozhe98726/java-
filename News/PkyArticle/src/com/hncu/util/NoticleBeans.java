package com.hncu.util;

public class NoticleBeans {
		private int n_id;
		private String n_name;
		private String n_content;
		public int getN_id() {
			return n_id;
		}
		public void setN_id(int n_id) {
			this.n_id = n_id;
		}
		public String getN_name() {
			return n_name;
		}
		public void setN_name(String n_name) {
			this.n_name = n_name;
		}
		public String getN_content() {
			return n_content;
		}
		public void setN_content(String n_content) {
			this.n_content = n_content;
		}
		@Override
		public String toString() {
			return "NoticleBeans [n_id=" + n_id + ", n_name=" + n_name + ", n_content=" + n_content + "]";
		}
		
		
		
}
