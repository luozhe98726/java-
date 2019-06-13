package com.hncu.util;

import java.util.List;
/**
 * 分页查询
 * @author LuoZhe
 *
 */
public class PageInfo {
		private int pageSize;//一页要显示的行数
		private int pageNum;//当前页数
		private int pageToel;//要显示总的页数
		private int pageLine;//表示总的行数
		public int getPageLine() {
			return pageLine;
		}
		public void setPageLine(int pageLine) {
			this.pageLine = pageLine;
		}
		private  List<?> pageList;//要显示的信息
		
		
		public int getPageSize() {
			return pageSize;
		}
		public void setPageSize(int pageSize) {
			this.pageSize = pageSize;
		}
		public int getPageNum() {
			return pageNum;
		}
		public void setPageNum(int pageNum) {
			this.pageNum = pageNum;
		}
		public int getPageToel() {
			return pageToel;
		}
		public void setPageToel(int pageToel) {
			this.pageToel = pageToel;
		}
	
		@Override
		public String toString() {
			return "PageInfo [pageSize=" + pageSize + ", pageNum=" + pageNum + ", pageToel=" + pageToel + ", pageLine="
					+ pageLine + ", pageList=" + pageList + "]";
		}
		public List<?> getPageList() {
			return pageList;
		}
		public void setPageList(List<?> pageList) {
			this.pageList = pageList;
		}
		 
}
