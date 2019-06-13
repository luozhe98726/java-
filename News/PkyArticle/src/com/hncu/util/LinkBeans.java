package com.hncu.util;

public class LinkBeans {
		private int l_id;
		private String l_name;
		private String l_address;
		public int getL_id() {
			return l_id;
		}
		public void setL_id(int l_id) {
			this.l_id = l_id;
		}
		public String getL_name() {
			return l_name;
		}
		public void setL_name(String l_name) {
			this.l_name = l_name;
		}
		public String getL_address() {
			return l_address;
		}
		public void setL_address(String l_address) {
			this.l_address = l_address;
		}
		@Override
		public String toString() {
			return "LinkBeans [l_id=" + l_id + ", l_name=" + l_name + ", l_address=" + l_address + "]";
		}
		
		
}
