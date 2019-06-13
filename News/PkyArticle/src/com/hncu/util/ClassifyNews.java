package com.hncu.util;

public class ClassifyNews {
		private int f_id;//分类id
		private String f_name;//新闻的分类名
		private String f_addTime;//创建时间
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
		public String getF_addTime() {
			return f_addTime;
		}
		public void setF_addTime(String f_addTime) {
			this.f_addTime = f_addTime;
		}
		@Override
		public String toString() {
			return "ClassifyNews [f_id=" + f_id + ", f_name=" + f_name + ", f_addTime=" + f_addTime + "]";
		}
		
		
}
